
<script>
    function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

    function setCookie(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }

    (function ($) {
        "use strict";

        var allProgress = $('.donation-progress');
        $.each(allProgress, function (index, value) {
            $(this).rProgressbar({
                percentage: $(this).data('percent'),
                fillBackgroundColor: "{{get_static_option('site_color')}}"
            });
        })

        @if(!empty(get_static_option('site_sticky_navbar_enabled')))
        $(window).on('scroll', function () {

            if ($(window).width() > 992) {
                /*--------------------------
                sticky menu activation
               -------------------------*/
                var st = $(this).scrollTop();
                var mainMenuTop = $('.navbar-area');
                if ($(window).scrollTop() > 1000) {
                    // active sticky menu on scrollup
                    mainMenuTop.addClass('nav-fixed');
                } else {
                    mainMenuTop.removeClass('nav-fixed ');
                }
            }
        });
        @endif
        $(document).on('change', '.search-form-warp', function (e) {
            e.preventDefault();
            var el = $(this);
            var searchType = $('#search_popup_search_type').val();
            if (searchType == 'blog') {
                el.attr('action', "{{route('frontend.blog.search')}}");
                el.find('.search-field').attr('name', 'search');
            } else if (searchType == 'event') {
                el.attr('action', "{{route('frontend.events.search')}}");
                el.find('.search-field').attr('name', 'search');
            } else if (searchType == 'knowledgebase') {
                el.attr('action', "{{route('frontend.knowledgebase.search')}}");
                el.find('.search-field').attr('name', 'search');
            } else if (searchType == 'product') {
                el.attr('action', "{{route('frontend.products')}}");
                el.find('.search-field').attr('name', 'q');
            }

        });
        $(document).on('change', '#langchange', function (e) {
            $.ajax({
                url: "{{route('frontend.langchange')}}",
                type: "GET",
                data: {
                    'lang': $(this).val()
                },
                success: function (data) {
                    window.location = "{{route('homepage')}}";
                }
            })
        });
        $(document).on('click', '.newsletter-form-wrap .submit-btn', function (e) {
            e.preventDefault();
            var email = $('.newsletter-form-wrap input[type="email"]').val();
            $('.newsletter-widget .form-message-show').html('');

            $.ajax({
                url: "{{route('frontend.subscribe.newsletter')}}",
                type: "POST",
                data: {
                    _token: "{{csrf_token()}}",
                    email: email
                },
                success: function (data) {
                    $('.newsletter-widget .form-message-show').html('<div class="alert alert-success">' + data + '</div>');
                },
                error: function (data) {
                    var errors = data.responseJSON.errors;
                    $('.newsletter-widget .form-message-show').html('<div class="alert alert-danger">' + errors.email[0] + '</div>');
                }
            });
        });

        $(document).on('submit', '.custom-form-builder-form', function (e) {
            e.preventDefault();
            var form = $(this);
            var formID = form.attr('id');
            var msgContainer =  form.find('.error-message');
            var formSelector = document.getElementById(formID);
            var formData = new FormData(formSelector);
            msgContainer.html('');
            $.ajax({
                url: "{{route('frontend.form.builder.custom.submit')}}",
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': "{{csrf_token()}}",
                },
                beforeSend:function (){
                    form.find('.ajax-loading-wrap').addClass('show').removeClass('hide');
                },
                processData: false,
                contentType: false,
                data:formData,
                success: function (data) {
                    form.find('.ajax-loading-wrap').removeClass('show').addClass('hide');
                    msgContainer.html('<div class="alert alert-'+data.type+'">' + data.msg + '</div>');
                },
                error: function (data) {
                    form.find('.ajax-loading-wrap').removeClass('show').addClass('hide');
                    var errors = data.responseJSON.errors;
                    var markup = '<ul class="alert alert-danger">';
                    $.each(errors,function (index,value){
                        markup += '<li>'+value+'</li>';
                    })
                    markup += '</ul>';
                    msgContainer.html(markup);
                }
            });
        });

    }(jQuery));
</script>