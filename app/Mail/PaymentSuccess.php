<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class PaymentSuccess extends Mailable
{
    use Queueable, SerializesModels;
    public $data;
    public $type;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data,$type = 'order')
    {
        $this->data = $data;
        $this->type = $type;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $mail_template_file = 'mail.payment-success';
        if ($this->type == 'event'){
            $mail_template_file = 'mail.event-payment-success';
        }
        return $this->from(get_static_option('site_global_email'), get_static_option('site_'.get_default_language().'_title'))
            ->subject('Payment Success for '.get_static_option('site_'.get_default_language().'_title'))
            ->view($mail_template_file);
    }
}
