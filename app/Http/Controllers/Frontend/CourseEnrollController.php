<?php

namespace App\Http\Controllers\Frontend;

use App\Course;
use App\CourseCoupon;
use App\CourseEnroll;
use App\Facades\EmailTemplate;
use App\Helpers\NexelitHelpers;
use App\Http\Controllers\Controller;
use App\Mail\BasicMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class CourseEnrollController extends Controller
{
    private $cancel_route = 'frontend.course.payment.cancel';
    private $success_route = 'frontend.course.payment.success';

    public function enroll_now(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:191',
            'email' => 'required|string|max:191',
            'course_id' => 'required|string',
        ], [
            'name.required' => __('name is required'),
            'email.required' => __('email is required'),
        ]);

        $course = Course::findOrFail($request->course_id);
        $max_enroll = CourseEnroll::where(['course_id' => $course->id])->count();

        if ($max_enroll >= $course->max_student) {
            $data['type'] = 'danger';
            $data['msg'] = __('max student limit reached');
            return back()->with($data);
        }

        if (empty($request->enroll_id)) {
            //save content to database
            $new_enroll = CourseEnroll::where(['course_id' => $request->course_id,'user_id' => auth()->guard('web')->id()])->first();
            if (empty($new_enroll)){
                $new_enroll = CourseEnroll::create([
                    'email' => $request->email,
                    'name' => $request->name,
                    'total' => $course->price,
                    'user_id' => auth()->guard('web')->check() ? auth()->guard('web')->user()->id : null,
                    'payment_gateway' => $request->selected_payment_gateway ?? '',
                    'payment_track' => Str::random(10) . Str::random(10),
                    'transaction_id' => null,
                    'payment_status' => !empty($course->price) && $course->price != 0 ? 'pending' : '',
                    'status' => 'pending',
                    'course_id' => $course->id,
                    'coupon' => $request->coupon,
                    'coupon_discounted' => $request->coupon ? $this->discounted_price($course->price, $request->coupon) : 0 // dicounted price
                ]);
            }
        } else {
            $new_enroll = CourseEnroll::findOrFail($request->enroll_id);
        }


        // check is payment able
        if (!empty($course->price) && $course->price > 0) {
            //check gateway type
            $selected_payment_gateway = $request->selected_payment_gateway;

            // if manual then check transaction id validation
            if ($selected_payment_gateway === 'manual_payment') {
                $this->validate($request, [
                    'transaction_id' => 'required|string'
                ], [
                    'transaction_id.required' => __('transaction id is required')
                ]);
                CourseEnroll::findOrFail($new_enroll->id)->update([
                    'transaction_id' => $request->transaction_id
                ]);

            }

            //send to new method for payment process
            $payment_process = $selected_payment_gateway . '_process';

            if(empty($selected_payment_gateway)){
                return back()->with(['msg' => __('No Payment Gateway Available'),'type' => 'danger']);
            }

            if(!method_exists($this,$payment_process)){
                return back()->with(['msg' => $selected_payment_gateway.' '.__('Gateway Method Not Available'),'type' => 'danger']);
            }

            $returned_value = $this->$payment_process($new_enroll->id);
            switch ($selected_payment_gateway) {
                case ('paypal'):
                    return redirect()->away($returned_value);
                    break;
                case ('stripe'):
                    $stripe_data['order_id'] = $new_enroll->id;
                    $stripe_data['route'] = route('frontend.course.stripe.ipn');
                    return view('payment.stripe')->with('stripe_data', $stripe_data);
                    break;
                default:
                    return $returned_value; //mollie, manual payment, razorpay,fluttewave,paystack
                    break;
            }

        } else {
            /* send mail to admin and customer */
            //check price is 0 or not
            //if price is zero update payment status and enroll sataus
            $new_enroll->payment_status = 'complete';
            $new_enroll->status = 'complete';
            $new_enroll->save();
            $this->send_mail($new_enroll->id);
            $order_id = random_int(123456, 999999) . $new_enroll->id . random_int(123456, 999999);
            return redirect()->route($this->success_route, $order_id);
        }

        return back()->with(NexelitHelpers::somethig_wrong());
    }

    public function return_msg()
    {
        $msg = get_static_option('enroll_form_mail_' . get_user_lang() . '_success_message') ?? __('thanks for enroll the course, admin will verify your payment soon');
        return $msg;
    }

    public function manual_payment_process($enroll_id)
    {
        return back()->with(['msg' => $this->return_msg(), 'type' => 'success']);
    }

    /**
     * process paypal payment
     * @since 2.0.4
     * */
    public function paypal_process($enroll_id)
    {
        /**
         * @required param list
         * $args['amount']
         * $args['description']
         * $args['item_name']
         * $args['ipn_url']
         * $args['cancel_url']
         * $args['payment_track']
         * return redirect url for paypal
         * */
        $enroll_details = CourseEnroll::findOrFail($enroll_id);
        $redirect_url = paypal_gateway()->charge_customer([
            'amount' => $this->discounted_amount($enroll_details->total, $enroll_details->coupon),
            'description' => __('Payment For Course Enroll Id:') . ' #' . $enroll_details->id . ' ' . __('Payer Name: ') . ' ' . $enroll_details->name . ' ' . __('Payer Email:') . ' ' . $enroll_details->email,
            'item_name' => __('Payment For Course Enroll Id:') . ' #' . $enroll_details->id,
            'ipn_url' => route('frontend.course.paypal.ipn'),
            'cancel_url' => route($this->cancel_route, $enroll_details->id),
            'payment_track' => $enroll_details->payment_track,
        ]);
        session()->put('enroll_id', $enroll_details->id);
        return $redirect_url;

    }


    public function paypal_ipn(Request $request)
    {
        $enroll_id = session()->get('enroll_id');
        session()->forget('enroll_id');
        if (empty($enroll_id)) {
            return abort(404);
        }
        /**
         * @required param list
         * $args['request']
         * $args['cancel_url']
         * $args['success_url']
         *
         * return @void
         * */
        $payment_data = paypal_gateway()->ipn_response([
            'request' => $request,
            'cancel_url' => route($this->cancel_route, $enroll_id),
            'success_url' => route($this->success_route, $enroll_id)
        ]);

        if (isset($payment_data['status']) && $payment_data['status'] === 'complete') {
            $this->update_database($enroll_id, $payment_data['transaction_id']);
            $this->send_mail($enroll_id);
            $order_id = random_int(123456, 999999) . $enroll_id . random_int(123456, 999999);
            return redirect()->route($this->success_route, $order_id);
        }

        return redirect()->route($this->cancel_route, $enroll_id);
    }

    /**
     * process stripe payment
     * @since 2.0.4
     * */
    public function stripe_process($enroll_id){}

    public function stripe_ipn(Request $request)
    {
        $enroll_details = CourseEnroll::findOrFail($request->order_id);

        /**
         * @require params
         *
         * product_name
         * amount
         * description
         * ipn_url
         * cancel_url
         * order_id
         *
         * */

        $enroll_details =  stripe_gateway()->charge_customer([
            'product_name' => __('Payment For Course Enroll Id:'). ' #'.$enroll_details->id,
            'amount' => $this->discounted_amount($enroll_details->total, $enroll_details->coupon),
            'description' => __('Payment For Course Enroll Id:'). ' #'.$enroll_details->id.' '.__('Payer Name: ').' '.$enroll_details->name.' '.__('Payer Email:').' '.$enroll_details->email,
            'ipn_url' => route('frontend.course.stripe.success'),
            'order_id' => $enroll_details->id,
            'cancel_url' => route($this->cancel_route,$enroll_details->id)
        ]);
        return response()->json(['id' => $enroll_details['id']]);
    }

    public function stripe_success(Request $request){
        /**
         * @require params
         * */
        $enroll_id = session()->get('stripe_order_id');
        session()->forget('stripe_order_id');

        $payment_data = stripe_gateway()->ipn_response();
        if (isset($payment_data['status']) && $payment_data['status'] === 'complete'){
            $this->update_database($enroll_id, $payment_data['transaction_id']);
            $this->send_mail($enroll_id);
            $order_id = random_int(123456,999999) . $enroll_id .random_int(123456,999999);
            return redirect()->route($this->success_route,$order_id);
        }
        return redirect()->route($this->cancel_route,$enroll_id);

    }

    private function send_mail($enroll_id)
    {
        $enroll_details = CourseEnroll::findOrFail($enroll_id);

        //mail to user
        $this->mail_to_user($enroll_details);
        //mail to admin
        $this->mail_to_admin($enroll_details);
    }

    private function mail_to_user($enroll_details)
    {
        $email = $enroll_details->email;
        try {
            Mail::to($email)->send(new BasicMail(EmailTemplate::courseEnrollUserMail($enroll_details)));
        }catch (\Exception $e){}
    }

    private function mail_to_admin($enroll_details)
    {
        $admin_email = get_static_option('course_notify_mail') ?? get_static_option('site_global_email');
        try {
            Mail::to($admin_email)->send(new BasicMail(EmailTemplate::courseEnrollAdminMail($enroll_details)));
        }catch (\Exception $e){

        }
    }

    private function discounted_price($price, $coupon)
    {
        //have to write code for get discounted price
        $return_val = 0;
        if (!empty($coupon)) {
            $coupon_details = CourseCoupon::where('code', $coupon)->first();
            if (!empty($coupon_details)) {
                if ($coupon_details->discount_type === 'percentage') {
                    $discount_bal = ($price / 100) * (int)$coupon_details->discount;
                    $return_val = $discount_bal;
                } elseif ($coupon_details->discount_type === 'amount') {
                    $return_val = $coupon_details->discount;
                }
            }
        }

        return $return_val;
    }

    private function discounted_amount($price, $coupon)
    {
        //have to write code for get discounted price
        $return_val = $price;
        if (!empty($coupon)) {
            $coupon_details = CourseCoupon::where('code', $coupon)->first();
            if (!empty($coupon_details)) {
                if ($coupon_details->discount_type === 'percentage') {
                    $discount_bal = ($price / 100) * (int)$coupon_details->discount;
                    $return_val = $price - $discount_bal;
                } elseif ($coupon_details->discount_type === 'amount') {
                    $return_val = $price - (int)$coupon_details->discount;
                }
            }
        }

        return $return_val;
    }

    private function update_database($enroll_id, $transaction_id)
    {
        $enroll_details = CourseEnroll::findOrFail($enroll_id);
        $enroll_details->transaction_id = $transaction_id;
        $enroll_details->payment_status = 'complete';
        $enroll_details->status = 'complete';
        $enroll_details->save();

        //increase enrolled strudent number in course table
        $course = Course::findOrFail($enroll_details->course_id);
        $course->enrolled_student = $course->enrolled_student + 1;
        $course->save();
    }
}
