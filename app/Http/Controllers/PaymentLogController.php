<?php

namespace App\Http\Controllers;

use App\AppointmentBooking;
use App\Course;
use App\CourseEnroll;
use App\EventAttendance;
use App\EventPaymentLogs;
use App\Events;
use App\Facades\EmailTemplate;
use App\Mail\BasicMail;
use App\Mail\ContactMessage;
use App\Mail\PaymentSuccess;
use App\Mail\PlaceOrder;
use App\Order;
use App\PaymentLogs;
use App\PricePlan;
use App\ProductOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Str;
use KingFlamez\Rave\Facades\Rave;
use phpDocumentor\Reflection\Types\Self_;
use Razorpay\Api\Api;
use Stripe\Charge;
use Stripe\Stripe;
use Unicodeveloper\Paystack\Facades\Paystack;
use PayPal\Api\Amount;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;
use Illuminate\Support\Facades\Session;
use function App\Http\Traits\getChecksumFromArray;

class PaymentLogController extends Controller
{

    private const SUCCESS_ROUTE = 'frontend.order.payment.success';
    private const CANCEL_ROUTE = 'frontend.order.payment.cancel';

    public function order_payment_form(Request $request)
    {

        $this->validate($request, [
            'name' => 'required|string|max:191',
            'email' => 'required|email|max:191',
            'order_id' => 'required|string',
            'payment_gateway' => 'required|string',
        ]);
        if (!get_static_option('disable_guest_mode_for_package_module') && !auth()->guard('web')->check()){
            return back()->with(['type' => 'warning','msg' => __('login to place an order')]);
        }
        $order_details = Order::find($request->order_id);
        $payment_details = PaymentLogs::where('order_id', $request->order_id)->first();
        if (empty($payment_details)) {
            $payment_log_id = PaymentLogs::create([
                'email' => $request->email,
                'name' => $request->name,
                'package_name' => $order_details->package_name,
                'package_price' => $order_details->package_price,
                'package_gateway' => $request->payment_gateway,
                'order_id' => $request->order_id,
                'status' => 'pending',
                'track' => Str::random(10) . Str::random(10),
            ])->id;
            $payment_details = PaymentLogs::find($payment_log_id);
        }


        if ($request->payment_gateway === 'paypal') {

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
            $redirect_url =  paypal_gateway()->charge_customer([
                'amount' => $payment_details->package_price,
                'description' => 'Payment For Package Order Id: #' . $request->order_id . ' Package Name: ' . $payment_details->package_name . ' Payer Name: ' . $request->name . ' Payer Email:' . $request->email,
                'item_name' => 'Payment For Package Order Id: #'.$request->order_id,
                'ipn_url' => route('frontend.paypal.ipn'),
                'cancel_url' => route(self::CANCEL_ROUTE,$payment_details->id),
                'payment_track' => $payment_details->track,
            ]);

            session()->put('order_id',$request->order_id);
            return redirect()->away($redirect_url);

        } elseif ($request->payment_gateway === 'manual_payment') {

            event(new Events\PackagesOrderSuccess([
                'order_id' =>  $request->order_id,
                'transaction_id' => $request->trasaction_id
            ]));

            $order_id = Str::random(6) . $request->order_id . Str::random(6);
            return redirect()->route('frontend.order.payment.success', $order_id);

        } elseif ($request->payment_gateway === 'stripe') {

            $stripe_data['order_id'] = $payment_details->order_id;
            $stripe_data['route'] = route('frontend.stripe.charge');
            return view('payment.stripe')->with('stripe_data', $stripe_data);

        }


        return redirect()->route('homepage');
    }




    public function paypal_ipn(Request $request)
    {
        $order_id = session()->get('order_id');
        session()->forget('order_id');
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
            'cancel_url' => route(self::CANCEL_ROUTE,$order_id),
            'success_url' => route(self::SUCCESS_ROUTE,$order_id)
        ]);
        if (isset($payment_data['status']) && $payment_data['status'] === 'complete'){
            event(new Events\PackagesOrderSuccess([
                'order_id' => $order_id,
                'transaction_id' => $payment_data['transaction_id']
            ]));
            $order_id = Str::random(6) . $order_id . Str::random(6);
            return redirect()->route(self::SUCCESS_ROUTE,$order_id);
        }
        return redirect()->route(self::CANCEL_ROUTE,$order_id);
    }

    public function stripe_ipn(Request $request){
        /**
         * @require params
         * */
        $order_id = session()->get('stripe_order_id');
        session()->forget('stripe_order_id');

        $payment_data = stripe_gateway()->ipn_response();
        if (isset($payment_data['status']) && $payment_data['status'] === 'complete'){
            event(new Events\PackagesOrderSuccess([
                'order_id' => $order_id,
                'transaction_id' => $payment_data['transaction_id']
            ]));
            $encoded_order_id = Str::random(6) . $order_id . Str::random(6);
            return redirect()->route(self::SUCCESS_ROUTE,$encoded_order_id);
        }
        return redirect()->route(self::CANCEL_ROUTE,$order_id);
    }

    public function stripe_charge(Request $request)
    {
        $order_details = PaymentLogs::where('order_id',$request->order_id)->first();

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

        $stripe_session =  stripe_gateway()->charge_customer([
            'product_name' => $order_details->package_name,
            'amount' => $order_details->package_price,
            'description' => 'Payment From '. get_static_option('site_'.get_default_language().'_title').'. Package Order ID #'.$order_details->id .', Payer Name: '.$order_details->name.', Payer Email: '.$order_details->email,
            'ipn_url' => route('frontend.stripe.ipn'),
            'order_id' => $request->order_id,
            'cancel_url' => route(self::SUCCESS_ROUTE,$request->order_id)
        ]);
        return response()->json(['id' => $stripe_session['id']]);
    }



        public function update_database($order_id, $transaction_id)
        {
            Order::find($order_id)->update(['payment_status' => 'complete']);
            PaymentLogs::where('order_id', $order_id)->update(['transaction_id' => $transaction_id, 'status' => 'complete']);
        }

        public function send_order_mail($order_id)
        {

            $order_details = Order::find($order_id);
            $package_details = PricePlan::where('id', $order_details->package_id)->first();
            $payment_details = PaymentLogs::where('order_id', $order_id)->first();
            $all_fields = unserialize($order_details->custom_fields,['class' => false]);
            unset($all_fields['package']);

            $all_attachment = unserialize($order_details->attachment,['class' => false]);
            $order_page_form_mail = get_static_option('order_page_form_mail');
            $order_mail = $order_page_form_mail ? $order_page_form_mail : get_static_option('site_global_email');

            $subject = __('your have an package order');
            $message = __('your have an package order.') . ' #' . $order_id;
            $message .= ' ' . __('at') . ' ' . date_format($order_details->created_at, 'd F Y H:m:s');
            $message .= ' ' . __('via') . ' ' . str_replace('_', ' ', $payment_details->package_gateway);

            try {
                Mail::to($order_mail)->send(new PlaceOrder([
                    'data' => $order_details,
                    'subject' => $subject,
                    'message' => $message,
                    'package' => $package_details,
                    'attachment_list' => $all_attachment,
                    'payment_log' => $payment_details
                ]));
            }catch (\Exception $e){
                //handle error
            }

            $subject = __('your order has been placed');
            $message = __('your order has been placed.') . ' #' . $order_id;
            $message .= ' ' . __('at') . ' ' . date_format($order_details->created_at, 'd F Y H:m:s');
            $message .= ' ' . __('via') . ' ' . str_replace('_', ' ', $payment_details->package_gateway);
            try {
                Mail::to($payment_details->email)->send(new PlaceOrder([
                    'data' => $order_details,
                    'subject' => $subject,
                    'message' => $message,
                    'package' => $package_details,
                    'attachment_list' => $all_attachment,
                    'payment_log' => $payment_details
                ]));
            }catch (\Exception $e){
                //handle error
            }
        }
}
