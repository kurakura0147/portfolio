$(document).on('turbolinks:load', function() {

    //メニューのドロップダウン機能
    $(function(){
        $('.down-menu').hover(function(){
            $("ul:not(:animated)", this).slideDown();
        }, function(){
            $("ul.child",this).slideUp();
        });
    });
    //検索機能のドロップダウン
    $(function(){
        $('.down-menu').hover(function(){
            $("ul:not(:animated)", this).slideDown();
        }, function(){
            $("ul.child-search",this).slideUp();
        });
    });

});
