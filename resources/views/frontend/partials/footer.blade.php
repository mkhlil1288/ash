@php
    $home_page_variant = $home_page ?? get_static_option('home_page_variant');
@endphp
@if(!in_array(Route::currentRouteName(),['frontend.course.lesson','frontend.course.lesson.start']))
<footer class="footer-area home-variant-{{$home_page_variant}}
@if((request()->routeIs('homepage')  || request()->routeIs('frontend.homepage.demo') ) && $home_page_variant == '17' &&
filter_static_option_value('home_page_call_to_action_section_status',$static_field_data))
   has-top-padding
@endif
">
    @if(App\WidgetsBuilder\WidgetBuilderSetup::render_frontend_sidebar('footer',['column' => true]))
        <div class="footer-top padding-top-90 padding-bottom-65">
            <div class="container">
                <div class="row">
                    {!! App\WidgetsBuilder\WidgetBuilderSetup::render_frontend_sidebar('footer',['column' => true]) !!}
                </div>
            </div>
        </div>
    @endif
    <div class="copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="copyright-item">
                        <div class="copyright-area-inner">
                            {!! get_footer_copyright_text() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<div class="back-to-top">
    <span class="back-top">
        <i class="fas fa-angle-up"></i>
    </span>
</div>

@include('frontend.partials.popup-structure')
@endif
<!-- load all script -->
<script src="{{asset('assets/frontend/js/bootstrap.bundle.min.js')}}"></script>
<script src="{{asset('assets/frontend/js/dynamic-script.js')}}"></script>
<script src="{{asset('assets/frontend/js/jquery.magnific-popup.js')}}"></script>
<script src="{{asset('assets/frontend/js/imagesloaded.pkgd.min.js')}}"></script>
<script src="{{asset('assets/frontend/js/isotope.pkgd.min.js')}}"></script>
<script src="{{asset('assets/frontend/js/jquery.waypoints.js')}}"></script>
<script src="{{asset('assets/frontend/js/jquery.counterup.min.js')}}"></script>
<script src="{{asset('assets/frontend/js/owl.carousel.min.js')}}"></script>
<script src="{{asset('assets/frontend/js/wow.min.js')}}"></script>
<script src="{{asset('assets/frontend/js/jQuery.rProgressbar.min.js')}}"></script>
<script src="{{asset('assets/frontend/js/jquery.mb.YTPlayer.js')}}"></script>
<script src="{{asset('assets/frontend/js/main.js')}}"></script>

@if(request()->routeIs('homepage') || request()->routeIs('frontend.homepage.demo'))
    @include('frontend.partials.google-captcha')
    @include('frontend.partials.gdpr-cookie')
    @include('frontend.partials.popup-jspart')
    @include('frontend.partials.twakto')
@endif

@include('frontend.partials.inline-script')
@include('frontend.partials.product-ajax-js')

@yield('scripts')

</body>
</html>
