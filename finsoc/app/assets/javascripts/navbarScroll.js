var didScroll = false;

$(window).scroll(function() {
    didScroll = true;
});

setInterval(function() {
    if ( didScroll ) {
        didScroll = false;

        var scroll = $(window).scrollTop();
        $el = $("#finsoc-navbar-div");

        //Same that all the if else statements
        switch (true) {
            case (scroll >= 20): //margin below navbar
                if ($el.hasClass('z-depth-2')) {
                    $el.removeClass('z-depth-2');
                    $el.addClass('z-depth-4');
                }
                break;
            default: 
                if ($el.hasClass('z-depth-4')) {
                    $el.removeClass('z-depth-4');
                    $el.addClass('z-depth-2');
                }
        }
    }
}, 50);
