$(document).on('turbolinks:load', function() {
    $(function(){
        $('.down-menu').hover(function(){
            $("ul:not(:animated)", this).slideDown();
        }, function(){
            $("ul.child",this).slideUp();
        });
    });
});
