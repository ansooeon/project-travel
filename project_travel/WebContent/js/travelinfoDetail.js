window.onload= function() {
    $(function () {

        $('.nb').hide();
    
        $('.util_nav').mouseenter(function(){
            $(".nb").slideDown("slow");
        });

        $('.nb').mouseleave(function(){
            $(".nb").slideUp("middle");
            
        });
    })
}