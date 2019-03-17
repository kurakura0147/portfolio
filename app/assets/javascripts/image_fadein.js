$(function(){
    $(window).scroll(function (){
        $('.fadein').each(function(){
            var targetElement = $(this).offset().top;
            var scroll = $(window).scrollTop();
            var windowHeight = $(window).height();
            if (scroll > targetElement - windowHeight + 40){
                $(this).css('opacity','1.0');
                $(this).css('transform','translateY(0)');
            }
        });
    });
});
