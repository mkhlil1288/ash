<?php

namespace App\Providers;

use App\Listeners\PakcagesOrderSuccessMailSendUser;
use App\Listeners\PakcagesOrderDatabaseUpdate;
use App\Listeners\PakcagesOrderSuccessMailSendAdmin;
use App\Listeners\AttendanceBookingSuccessMailSendAdmin;
use App\Listeners\AttendanceBookingSuccessMailSendUser;
use App\Listeners\AttendanceBookingDatabaseUpdate;
use App\Listeners\ProductOrderSuccessMailSend;
use App\Listeners\ProductOrderDatabaseUpdate;
use App\Listeners\SupportSendMailToAdmin;
use App\Listeners\SupportSendMailToUser;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;
use App\Events\SupportMessage;
use App\Events\ProductOrders;
use App\Events\AttendanceBooking;
use App\Events\PackagesOrderSuccess;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        SupportMessage::class => [
            SupportSendMailToAdmin::class,
            SupportSendMailToUser::class
        ],
        ProductOrders::class => [
            ProductOrderDatabaseUpdate::class,
            ProductOrderSuccessMailSend::class
        ],
        AttendanceBooking::class => [
            AttendanceBookingDatabaseUpdate::class,
            AttendanceBookingSuccessMailSendAdmin::class,
            AttendanceBookingSuccessMailSendUser::class
        ],
        PackagesOrderSuccess::class => [
            PakcagesOrderDatabaseUpdate::class,
            PakcagesOrderSuccessMailSendAdmin::class,
            PakcagesOrderSuccessMailSendUser::class
        ]
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
