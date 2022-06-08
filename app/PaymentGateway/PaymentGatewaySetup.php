<?php


namespace App\PaymentGateway;


use App\PaymentGateway\Gateways\Paypal;
use App\PaymentGateway\Gateways\StripePay;

class PaymentGatewaySetup
{
    public static function paypal(){
        return new Paypal();
    }
    public static function stripe(){
        return new StripePay();
    }
}