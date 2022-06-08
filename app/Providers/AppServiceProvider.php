<?php

namespace App\Providers;

use App\Facades\Cart;
use App\Helpers\CartHelper;
use App\Helpers\EmailTemplateHelper;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        app()->bind('Cart',function (){
            return new CartHelper();
        });
        app()->singleton('EmailTemplate',function (){
            return new EmailTemplateHelper();
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
        $home_page_variant = get_static_option('home_page_variant');
        view()->share(compact('home_page_variant'));
        if (get_static_option('site_force_ssl_redirection') === 'on'){
            URL::forceScheme('https');
        }
    }
}
