window.onload = function () {
	$(function () {
		
	    $('.nb').hide();
	
	    $('.util_nav').mouseenter(function(){
	        $(".nb").slideDown("slow");
	    });
	
	    $('.nb').mouseleave(function(){
	        $(".nb").slideUp("middle");
	        
	    });
	})

	$(function () { //이미지 슬라이더
		$('.slider').slick({
			autoplay: true,
			autoplaySpeed: 2000,
			dots: true,
			infinite: true,
			speed: 1000,
			fade: true,
			cssEase: 'linear',
			adaptiveHeight: true,
			nextArrow:"<button type='button' class='slick-next'><img src='img/right.png'></button>",
			prevArrow:"<button type='button' class='slick-prev'><img src='img/left.png'></button>"	
			
		});
	})
	
	
}