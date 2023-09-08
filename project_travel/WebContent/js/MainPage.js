window.onload = function () {

	$(function () {
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
			prevArrow:"<button type='button' class='slick-prev'><img src='img/left.png'></button>",		
			
		});
	})
	$(function () {

		$('#mb_11').datepicker({
			lang: 'ko',
			dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //달력의 월 부분 텍스트
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //달력의 월 부분 Tooltip
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], //달력의 요일 텍스트
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 Tooltip
		});
	})
	$(function () {

		$('.travel_slide').slick({
			slidesToShow: 3,
			slidesToScroll: 1,
			nextArrow:"<button type='button' class='slick-next'><img src='img/icon_arrow_next.jpg'></button>",
			prevArrow:"<button type='button' class='slick-prev'><img src='img/icon_arrow_prev.jpg'></button>",
		});
	})

	$(function () {

		$('.travel_slide2').slick({
			slidesToShow: 4,
			slidesToScroll: 2,
			autoplay: true,
			autoplaySpeed: 4000,
			nextArrow:"<button type='button' class='slick-next'><img src='img/icon_arrow_next.jpg'></button>",
			prevArrow:"<button type='button' class='slick-prev'><img src='img/icon_arrow_prev.jpg'></button>",
		});
	})

	$(function () {

		$('.travel_slide3').slick({
			slidesToShow: 3,
			slidesToScroll: 1,
			autoplay: true,
			autoplaySpeed: 3000,
			
		});
	})        

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


		
    