<!DOCTYPE html>

<html class="no-js" lang="{{get_default_language()}}"  dir="{{get_default_language_direction()}}">
    <head>
        <!-- Meta Tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />

        <link rel="stylesheet" href="{{asset('assets/backend/backend.css')}}">

        {{ $css ?? '' }}

        <style>
            .ck-editor{
                color: #1a1e21;
            }
        </style>
        @php
            $site_favicon = get_attachment_image_by_id(get_static_option('site_favicon'),"full",false);
        @endphp
        @if (!empty($site_favicon))
            <link rel="icon" href="{{$site_favicon['img_url']}}" type="image/png">
        @endif

        <title>
            {{get_static_option('site_'.get_user_lang().'_title')}} -
            @if(request()->path() == 'admin-home')
                {{get_static_option('site_'.get_user_lang().'_tag_line')}}
            @else
                @yield('site-title')
            @endif
        </title>
        @yield('style')
        @if(!empty(get_static_option('site_admin_dark_mode')))
        <link rel="stylesheet" href="{{asset('assets/backend/css/dark-mode.css')}}">
        @endif
        @if( get_default_language_direction() === 'rtl')
            <link rel="stylesheet" href="{{asset('assets/backend/css/rtl.css')}}">
        @endif
        <script>var siteurl = "{{url('/')}}"</script>
        <!-- modernizr css -->
        <script src="{{asset('assets/common/vendor/modernizr-2.8.3.min.js')}}"></script>
    
    </head>

    <body class="antialiased d-flex flex-column ">
        <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        
        @if(!empty(get_static_option('disable_backend_preloader')))
        <div id="preloader">
            <div class="loader"></div>
        </div>
        @endif

    
        <div class="page">

            <header class="navbar navbar-expand-md navbar-light d-none d-lg-flex d-print-none header-vertical">
                <div class="container-xl">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu-search">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-nav flex-row order-md-last">
                        <div class="nav-item dropdown {{ $class ?? '' }}">

                        <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu" aria-expanded="false">
                            <span
                                class="avatar avatar-sm"
                                style="background-image: url('#')">
                            </span>
                            <div class="d-none d-xl-block ps-2">
                                <div>{{ auth()->user()->name }}</div>
                                {{--<div class="mt-1 small text-muted">UI Designer</div>--}}
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow theme-light">
                            <a href="" class="dropdown-item">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user-check pe-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path>
                                    <path d="M16 11l2 2l4 -4"></path>
                                </svg>
                                Profile &amp; Account
                            </a>

                            <a href="#" class="dropdown-item" onclick="event.preventDefault();document.getElementById('logout-form').submit()">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-lock pe-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <rect x="5" y="11" width="14" height="10" rx="2"></rect>
                                    <circle cx="12" cy="16" r="1"></circle>
                                    <path d="M8 11v-4a4 4 0 0 1 8 0v4"></path>
                                </svg>
                                Logout
                            </a>
                        </div>

                        <form method="POST" action="#" style="display: none;" id="logout-form">
                            @csrf
                        </form>
                        </div>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-menu-search">
                        <div>
                            <form action="." method="get">
                                <div class="input-icon">
                                    <span class="input-icon-addon">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/search -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>
                                        </span>
                                    <input type="text" value="" class="form-control" placeholder="Search…" aria-label="Search in website">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </header>

            <div class="page-wrapper">
                <div class="container-xl">
                    <!-- Page title -->
                    <div class="page-header d-print-none d-none d-md-block">
                        <div class="row align-items-center">
                            <div class="col">
                                    <div class="page-pretitle">
                                        Overview
                                    </div>

                                    <h2 class="page-title">
                                        @yield('site-title')
                                    </h2>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="page-body">
                    @yield('content')
                </div>

                <footer class="footer footer-transparent d-print-none">
                    <div class="container">
                        <div class="row text-center align-items-center flex-row-reverse">
                            <div class="col-lg-auto ml-lg-auto">
                                <ul class="list-inline list-inline-dots mb-0">
                                    <li class="list-inline-item">
                                        <a href="#" class="link-secondary">Help</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="#" class="link-secondary">Support</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-12 col-lg-auto mt-3 mt-lg-0 me-auto">
                                <ul class="list-inline list-inline-dots mb-0">
                                    <li class="list-inline-item">
                                        © {{ date('Y') }}
                                        <a href="https://tenchology.com" class="link-secondary">Tenchology</a>.
                                        All rights reserved.
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>

        </div>

        <script src="{{ asset('assets/backend/backend.js') }}"></script>
        <script src="{{asset('assets/common/vendor/jquery-2.2.4.min.js')}}"></script>
<script src="{{asset('assets/common/js/popper.min.js')}}"></script>
<script src="{{asset('assets/common/js/bootstrap.min.js')}}"></script>
<script src="{{asset('assets/backend/js/metisMenu.min.js')}}"></script>
<script src="{{asset('assets/backend/js/jquery.slimscroll.min.js')}}"></script>
<script src="{{asset('assets/backend/js/jquery.slicknav.min.js')}}"></script>
<script src="{{asset('assets/backend/js/fontawesome-iconpicker.min.js')}}"></script>
<script src="{{asset('assets/backend/js/bootstrap-datepicker.min.js')}}"></script>
<script src="{{asset('assets/backend/js/sweetalert2.js')}}"></script>
@yield('script')
<script src="{{asset('assets/backend/js/plugins.js')}}"></script>
<script src="{{asset('assets/backend/js/scripts.js')}}"></script>
@if(!empty(get_static_option('site_admin_panel_nav_sticky')))
<script>
    (function($){
        "use strict";

        $(document).ready(function ($) {

            var parent = $("#menu");
            var activeMenu = $('.metismenu > li.main_dropdown.active');
            var markup = activeMenu.clone();
            activeMenu.remove();
            parent.prepend(markup);

        });

    })(jQuery);
</script>
@endif
<script>
    (function($){
        "use strict";

        $(document).ready(function ($) {

             $('input[type="date"]').datepicker({
                format: 'yyyy-mm-dd'
             });

            $(document).on('click','.swal_delete_button',function(e){
              e.preventDefault();
                Swal.fire({
                  title: '{{__("Are you sure?")}}',
                  text: '{{__("You would not be able to revert this item!")}}',
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                  if (result.isConfirmed) {
                    $(this).next().find('.swal_form_submit_btn').trigger('click');
                  }
                });
            });
    
            $(document).on('click','.swal_change_language_button',function(e){
                e.preventDefault();
                Swal.fire({
                    title: '{{__("Are you sure to make this language as a default language?")}}',
                    text: '{{__("Languages will be turn changed as default")}}',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Change it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $(this).next().find('.swal_form_submit_btn').trigger('click');
                    }
                });
            });
    
            $(document).on('click','.swal_change_approve_payment_button',function(e){
                e.preventDefault();
                Swal.fire({
                    title: '{{__("Are you sure to approve this payment?")}}',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Accept it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $(this).next().find('.swal_form_submit_btn').trigger('click');
                    }
                });
            });
        
        });

    })(jQuery);
</script>
</body>

</html>
