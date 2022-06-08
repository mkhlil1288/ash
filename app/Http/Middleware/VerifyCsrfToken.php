<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        'paypal-ipn',
        'event-paypal-ipn',
        'product-paypal-ipn',
        'admin-home/update-static-option',
        'admin-home/get-static-option',
        'admin-home/set-static-option',
        'job-paypal-ipn',
    ];
}
