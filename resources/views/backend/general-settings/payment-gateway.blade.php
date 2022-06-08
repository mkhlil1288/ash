@extends('backend.admin-master')
@section('site-title')
    {{__('Payment Settings')}}
@endsection
@section('style')
    @include('backend.partials.media-upload.style')
    <link rel="stylesheet" href="{{asset('assets/backend/css/summernote-bs4.css')}}">
    <style>
        .accordion-wrapper .card .card-header button {
            color: #000 !important;
        }
    </style>
@endsection
@section('content')
    <div class="col-lg-12 col-ml-12 padding-bottom-30">
        <div class="row">
            <div class="col-12 mt-5">
                @include('backend.partials.message')
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title">{{__("Payment Gateway Settings")}}</h4>
                        <x-error-msg/>
                        <form action="{{route('admin.general.payment.settings')}}" method="POST"
                              enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="site_global_currency">{{__('Site Global Currency')}}</label>
                                        <select name="site_global_currency" class="form-control"
                                                id="site_global_currency">
                                            @foreach(script_currency_list() as $cur => $symbol)
                                                <option value="{{$cur}}"
                                                        @if(get_static_option('site_global_currency') == $cur) selected @endif>{{$cur.' ( '.$symbol.' )'}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="site_currency_symbol_position">{{__('Currency Symbol Position')}}</label>
                                        @php $all_currency_position = ['left','right']; @endphp
                                        <select name="site_currency_symbol_position" class="form-control"
                                                id="site_currency_symbol_position">
                                            @foreach($all_currency_position as $cur)
                                                <option value="{{$cur}}"
                                                        @if(get_static_option('site_currency_symbol_position') == $cur) selected @endif>{{ucwords($cur)}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="site_default_payment_gateway">{{__('Default Payment Gateway')}}</label>
                                        <select name="site_default_payment_gateway" class="form-control" >
                                            @php
                                                $all_gateways = ['paypal','manual_payment','mollie','paytm','stripe','razorpay','flutterwave','paystack'];
                                            @endphp
                                            @foreach($all_gateways as $gateway)
                                                @if(!empty(get_static_option($gateway.'_gateway')))
                                                    <option value="{{$gateway}}" @if(get_static_option('site_default_payment_gateway') == $gateway) selected @endif>{{ucwords(str_replace('_',' ',$gateway))}}</option>
                                                @endif
                                            @endforeach
                                        </select>
                                    </div>
                                    @php $global_currency = get_static_option('site_global_currency');@endphp
                                    @if($global_currency != 'USD')
                                        <div class="form-group">
                                            <label for="site_{{strtolower($global_currency)}}_to_usd_exchange_rate">{{__($global_currency.' to USD Exchange Rate')}}</label>
                                            <input type="text" class="form-control"
                                                   name="site_{{strtolower($global_currency)}}_to_usd_exchange_rate"
                                                   value="{{get_static_option('site_'.$global_currency.'_to_usd_exchange_rate')}}">
                                            <span class="info-text">{{sprintf(__('enter %1$s to USD exchange rate. eg: 1 %2$s = ? USD'),$global_currency,$global_currency) }}</span>
                                        </div>
                                    @endif

                                    @if($global_currency != 'EUR' && !empty(get_static_option('paytm_gateway') || !empty(get_static_option('razorpay_gateway'))))
                                        <div class="form-group">
                                            <label for="site_{{strtolower($global_currency)}}_to_inr_exchange_rate">{{__($global_currency.' to EUR Exchange Rate')}}</label>
                                            <input type="text" class="form-control"
                                                   name="site_{{strtolower($global_currency)}}_to_inr_exchange_rate"
                                                   value="{{get_static_option('site_'.$global_currency.'_to_inr_exchange_rate')}}">
                                            <span class="info-text">{{__('enter '.$global_currency.' to EUR exchange rate. eg: 1'.$global_currency.' = ? EUR')}}</span>
                                        </div>
                                    @endif

                                    @if($global_currency != 'NGN' && !empty(get_static_option('paystack_gateway') ))
                                        <div class="form-group">
                                            <label for="site_{{strtolower($global_currency)}}_to_ngn_exchange_rate">{{__($global_currency.' to NGN Exchange Rate')}}</label>
                                            <input type="text" class="form-control"
                                                   name="site_{{strtolower($global_currency)}}_to_ngn_exchange_rate"
                                                   value="{{get_static_option('site_'.$global_currency.'_to_ngn_exchange_rate')}}">
                                            <span class="info-text">{{__('enter '.$global_currency.' to NGN exchange rate. eg: 1'.$global_currency.' = ? NGN')}}</span>
                                        </div>
                                    @endif

                                    <div class="accordion-wrapper">
                                        <div id="accordion-payment">
                                            <div class="card">
                                                <div class="card-header" id="cash_on_delivery_settings">
                                                    <h5 class="mb-0">
                                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#pcash_on_delivery_settings_content" aria-expanded="false" >
                                                            <span class="page-title"> {{__('Cash On Delivery Settings (only for product order)')}}</span>
                                                        </button>
                                                    </h5>
                                                </div>
                                                <div id="pcash_on_delivery_settings_content" class="collapse"  data-parent="#accordion-payment">
                                                    <div class="card-body">
                                                        <div class="form-group">
                                                            <label for="cash_on_delivery_gateway"><strong>{{__('Enable Cash On Delivery')}}</strong></label>
                                                            <label class="switch">
                                                                <input type="checkbox" name="cash_on_delivery_gateway"  @if(!empty(get_static_option('cash_on_delivery_gateway'))) checked @endif id="cash_on_delivery_gateway">
                                                                <span class="slider onff"></span>
                                                            </label>
                                                        </div>
                                                        <x-media-upload :name="'cash_on_delivery_preview_logo'" :dimentions="'160x50'" :title="__('Cash On Delivery Logo')"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header" id="paypal_settings">
                                                    <h5 class="mb-0">
                                                        <button class="btn btn-link" type="button"
                                                                data-toggle="collapse"
                                                                data-target="#paypal_settings_content"
                                                                aria-expanded="true">
                                                            <span class="page-title"> {{__('Paypal Settings')}}</span>
                                                        </button>
                                                    </h5>
                                                </div>
                                                <div id="paypal_settings_content" class="collapse show"
                                                     data-parent="#accordion-payment">
                                                    <div class="card-body">
                                                        <div class="payment-notice alert alert-warning">
                                                            <p>{{__("Available Currency For Paypal is")}} {{implode(',',paypal_gateway()->supported_currency_list())}}</p>
                                                            <p>{{__('if your currency is not available in paypal, it will convert you currency value to USD value based on your currency exchange rate.')}}</p>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="paypal_gateway"><strong>{{__('Enable Paypal')}}</strong></label>
                                                            <label class="switch">
                                                                <input type="checkbox" name="paypal_gateway"
                                                                       @if(!empty(get_static_option('paypal_gateway'))) checked
                                                                       @endif id="paypal_gateway">
                                                                <span class="slider onff"></span>
                                                            </label>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="paypal_test_mode"><strong>{{__('Enable Test Mode For Paypal')}}</strong></label>
                                                            <label class="switch">
                                                                <input type="checkbox" name="paypal_test_mode"
                                                                       @if(!empty(get_static_option('paypal_test_mode'))) checked
                                                                        @endif >
                                                                <span class="slider onff"></span>
                                                            </label>
                                                        </div>
                                                        <x-media-upload :name="'paypal_preview_logo'" :dimentions="'160x50'" :title="__('Paypal Logo')"/>
                                                        <div class="form-group">
                                                            <label for="paypal_app_client_id">{{__('Paypal Client ID')}}</label>
                                                            <input type="text" name="paypal_app_client_id"
                                                                   class="form-control"
                                                                   value="{{get_static_option('paypal_app_client_id')}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="paypal_app_secret">{{__('Paypal Secret')}}</label>
                                                            <input type="text" name="paypal_app_secret"
                                                                   class="form-control"
                                                                   value="{{get_static_option('paypal_app_secret')}}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header" id="stripe_settings">
                                                    <h5 class="mb-0">
                                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#stripe_settings_content" aria-expanded="false" >
                                                            <span class="page-title"> {{__('Stripe Settings')}}</span>
                                                        </button>
                                                    </h5>
                                                </div>
                                                <div id="stripe_settings_content" class="collapse"  data-parent="#accordion-payment">
                                                    <div class="card-body">
                                                        <div class="payment-notice alert alert-warning">
                                                            <p>{{__("Stripe supported currency ")}} {{implode(',',stripe_gateway()->supported_currency_list())}}</p>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="stripe_gateway"><strong>{{__('Enable/Disable Stripe')}}</strong></label>
                                                            <label class="switch">
                                                                <input type="checkbox" name="stripe_gateway"  @if(!empty(get_static_option('stripe_gateway'))) checked @endif id="stripe_gateway">
                                                                <span class="slider onff"></span>
                                                            </label>
                                                        </div>
                                                        <x-media-upload :name="'stripe_preview_logo'" :dimentions="'160x50'" :title="__('Stripe Logo')"/>
                                                        <div class="form-group">
                                                            <label for="stripe_publishable_key">{{__('Stripe Publishable Key')}}</label>
                                                            <input type="text" name="stripe_publishable_key" id="stripe_publishable_key" value="{{get_static_option('stripe_publishable_key')}}" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="stripe_secret_key">{{__('Stripe Secret')}}</label>
                                                            <input type="text" name="stripe_secret_key" id="stripe_secret_key"  value="{{get_static_option('stripe_secret_key')}}" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header" id="manual_payment_settings">
                                                    <h5 class="mb-0">
                                                        <button class="btn btn-link" type="button"
                                                                data-toggle="collapse"
                                                                data-target="#manual_payment_settings_content"
                                                                aria-expanded="false">
                                                            <span class="page-title"> {{__('Manual Payment Settings')}}</span>
                                                        </button>
                                                    </h5>
                                                </div>
                                                <div id="manual_payment_settings_content" class="collapse"
                                                     data-parent="#accordion-payment">
                                                    <div class="card-body">
                                                        <div class="form-group">
                                                            <label for="manual_payment_gateway"><strong>{{__('Enable/Disable Manual Payment')}}</strong></label>
                                                            <label class="switch">
                                                                <input type="checkbox" name="manual_payment_gateway"
                                                                       @if(!empty(get_static_option('manual_payment_gateway'))) checked
                                                                       @endif id="manual_payment_gateway">
                                                                <span class="slider onff"></span>
                                                            </label>
                                                        </div>
                                                        <x-media-upload :name="'manual_payment_preview_logo'" :dimentions="'160x50'" :title="__('Manual Payment Logo')"/>

                                                        <div class="form-group">
                                                            <label for="site_manual_payment_name">{{__('Manual Payment Name')}}</label>
                                                            <input type="text" name="site_manual_payment_name"
                                                                   id="site_manual_payment_name"
                                                                   value="{{get_static_option('site_manual_payment_name')}}"
                                                                   class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="site_manual_payment_description">{{__('Manual Payment Description')}}</label>
                                                            <input type="hidden" name="site_manual_payment_description" value="{{get_static_option('site_manual_payment_description')}}">
                                                            <div class="summernote" data-content='{{get_static_option('site_manual_payment_description')}}'></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit"
                                    class="btn btn-primary mt-4 pr-4 pl-4">{{__('Update Changes')}}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('backend.partials.media-upload.media-upload-markup')
@endsection
@section('script')
    <script src="{{asset('assets/backend/js/dropzone.js')}}"></script>
    <script src="{{asset('assets/backend/js/summernote-bs4.js')}}"></script>
    @include('backend.partials.media-upload.media-js')
    <script>
        $(document).ready(function ($) {

            $(document).on('change','#site_global_currency',function (e) {
                e.preventDefault();
                checkCurrency();
            });

            function checkCurrency() {
                var selectedValue = $('#site_global_currency').val();
                if(selectedValue == 'USD'){
                    $('#site_usd_to_nri_exchange_rate').parent().show();
                }else{
                    $('#site_usd_to_nri_exchange_rate').parent().hide();
                }
            }
            $('.summernote').summernote({
                height: 250,   //set editable area's height
                codemirror: { // codemirror options
                    theme: 'monokai'
                },
                callbacks: {
                    onChange: function(contents, $editable) {
                        $(this).prev('input').val(contents);
                    }
                }
            });
            if($('.summernote').length > 0){
                $('.summernote').each(function(index,value){
                    $(this).summernote('code', $(this).data('content'));
                });
            }
        });

    </script>
@endsection
