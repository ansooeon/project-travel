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
// https://beingdesigner.tistory.com/17 더하기 함수
	// 나라 검색 필터
	var usaCh = [];
	var korCh = [];
	var japanCh = [];
	var egyptCh = [];
	var franchCh = [];

	var usa = "";
	var kor = "";
	var japan = "";
	var egypt = "";
	var franch = "";

	

	$('#usa').click(function() {

		var tmpEle = document.getElementsByName("region");
		var tmpEleP = document.getElementsByName("price");
		var tmpEleS = document.getElementsByName("start");
		
		for(var y =0; y<tmpEleS.length;y++) {
			
			if(tmpEleS[y].checked == true) {
				tmpEleS[y].checked = false;
			}
		}		
		for(var x =0; x<tmpEleP.length;x++) {
			
			if(tmpEleP[x].checked == true) {
				tmpEleP[x].checked = false;
			}
		}
		if (tmpEle[0].checked == true) {

			for (var i = 0; i < tmpEle.length; i++) { 
														
				if (i != 0) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}
				}
			}
		}
		$.ajax({
			url : "packagePage.do?category=freeregion",
			data : {
				'region' : $('#usa').val()
			},
			success : function(result) {				
				for (var i = 0; i < 18; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
		})

	})

	$('#franch').click(function() {

		var tmpEle = document.getElementsByName("region");
		var tmpEleP = document.getElementsByName("price");
		var tmpEleS = document.getElementsByName("start");
		
		for(var y =0; y<tmpEleS.length;y++) {
			
			if(tmpEleS[y].checked == true) {
				tmpEleS[y].checked = false;
			}
		}
		
		for(var x =0; x<tmpEleP.length;x++) {
			
			if(tmpEleP[x].checked == true) {
				tmpEleP[x].checked = false;
			}
		}

		if (tmpEle[1].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 1) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}
				}
			}
		}

		$.ajax({

			url : "packagePage.do?category=freeregion",
			data : {
				'region' : $('#franch').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})
	})

	$('#korea').click(function() {

		var tmpEle = document.getElementsByName("region");
		var tmpEleP = document.getElementsByName("price");
		var tmpEleS = document.getElementsByName("start");
		
		for(var y =0; y<tmpEleS.length;y++) {
			
			if(tmpEleS[y].checked == true) {
				tmpEleS[y].checked = false;
			}
		}
		
		for(var x =0; x<tmpEleP.length;x++) {
			
			if(tmpEleP[x].checked == true) {
				tmpEleP[x].checked = false;
			}
		}

		if (tmpEle[2].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 2) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}
				}
			}
		}

		$.ajax({

			url : "packagePage.do?category=freeregion",
			data : {
				'region' : $('#korea').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})
	})

	$('#japan').click(function() {

		var tmpEle = document.getElementsByName("region");
		var tmpEleP = document.getElementsByName("price");
		var tmpEleS = document.getElementsByName("start");
		
		for(var y =0; y<tmpEleS.length;y++) {
			
			if(tmpEleS[y].checked == true) {
				tmpEleS[y].checked = false;
			}
		}
		
		for(var x =0; x<tmpEleP.length;x++) {
			
			if(tmpEleP[x].checked == true) {
				tmpEleP[x].checked = false;
			}
		}

		if (tmpEle[3].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 3) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}
				}
			}
		}

		$.ajax({

			url : "packagePage.do?category=freeregion",
			data : {
				'region' : $('#japan').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})
	})

	$('#egypt').click(function() {

		var tmpEle = document.getElementsByName("region");
		var tmpEleP = document.getElementsByName("price");
		var tmpEleS = document.getElementsByName("start");
		
		for(var y =0; y<tmpEleS.length;y++) {
			
			if(tmpEleS[y].checked == true) {
				tmpEleS[y].checked = false;
			}
		}
		
		for(var x =0; x<tmpEleP.length;x++) {
			
			if(tmpEleP[x].checked == true) {
				tmpEleP[x].checked = false;
			}
		}

		if (tmpEle[4].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 4) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}
				}
			}
		}

		$.ajax({

			url : "packagePage.do?category=freeregion",
			data : {
				'region' : $('#egypt').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})

	})

	// 가격 검색 필터
	var price1 = [];
	var price5 = [];
	var price10 = [];
	var price15 = [];
	var price20 = [];

	function priceCh() {

		if ($('#1').val() == price1) {
			var pri1 = $('#1').val();
		} else {
			pri1 = "";
		}
		if ($('#5').val() == price5) {
			var pri5 = $('#5').val();
		} else {
			pri5 = "";
		}
		if ($('#10').val() == price10) {
			var pri10 = $('#10').val();
		} else {
			pri10 = "";
		}

		if ($('#15').val() == price15) {
			var pri15 = $('#15').val();
		} else {
			pri15 = "";
		}

		if ($('#20').val() == price20) {
			var pri20 = $('#20').val();
		} else {
			pri20 = "";
		}

	}

	$('#1').click(function() {

		priceCh();

		var tmpEle = document.getElementsByName("price");
		var tmpEleR = document.getElementsByName("region");
		var tmpEleS = document.getElementsByName("start");
		
		for(var x =0; x<tmpEleS.length;x++) {
			
			if(tmpEleS[x].checked == true) {
				tmpEleS[x].checked = false;
			}
		}			
		
		for(var y =0; y<tmpEleR.length;y++) {
			
			if(tmpEleR[y].checked == true) {
				tmpEleR[y].checked = false;
			}
		}

		if (tmpEle[0].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 0) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}

				}
			}
		}

		$.ajax({

			url : "packagePage.do?category=ajaxfree",
			data : {
				'price' : $('#1').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})
	})

	$('#5').click(function() {

		priceCh();

		var tmpEle = document.getElementsByName("price");
		var tmpEleR = document.getElementsByName("region");
		var tmpEleS = document.getElementsByName("start");
		
		for(var x =0; x<tmpEleS.length;x++) {
			
			if(tmpEleS[x].checked == true) {
				tmpEleS[x].checked = false;
			}
		}			
		
		for(var y =0; y<tmpEleR.length;y++) {
			
			if(tmpEleR[y].checked == true) {
				tmpEleR[y].checked = false;
			}
		}

		if (tmpEle[1].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 1) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					} // 선택 해제
				}
			}
			// 선택 체크박스 해제시 선택 풀림
		}

		$.ajax({

			url : "packagePage.do?category=ajaxfree",
			data : {
				"price" : $('#5').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})

	})

	$('#10').click(function() {

		priceCh();

		var tmpEle = document.getElementsByName("price");
		var tmpEleR = document.getElementsByName("region");
		var tmpEleS = document.getElementsByName("start");
		
		for(var x =0; x<tmpEleS.length;x++) {
			
			if(tmpEleS[x].checked == true) {
				tmpEleS[x].checked = false;
			}
		}	
		
		for(var y =0; y<tmpEleR.length;y++) {
			
			if(tmpEleR[y].checked == true) {
				tmpEleR[y].checked = false;
			}
		}

		if (tmpEle[2].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 2) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					} // 선택 해제

				}
			}
			// 선택 체크박스 해제시 선택 풀림
		}

		$.ajax({

			url : "packagePage.do?category=ajaxfree",
			data : {
				"price" : $('#10').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})

	})

	$('#15').click(function() {

		priceCh();
		var tmpEle = document.getElementsByName("price");
		var tmpEleR = document.getElementsByName("region");
		var tmpEleS = document.getElementsByName("start");
		
		for(var y =0; y<tmpEleS.length;y++) {
			
			if(tmpEleS[y].checked == true) {
				tmpEleS[y].checked = false;
			}
		}
		
		for(var y =0; y<tmpEleR.length;y++) {
			
			if(tmpEleR[y].checked == true) {
				tmpEleR[y].checked = false;
			}
		}

		if (tmpEle[3].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 3) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					} // 선택 해제

				}
			}
			// 선택 체크박스 해제시 선택 풀림
		}

		$.ajax({

			url : "packagePage.do?category=ajaxfree",
			data : {
				"price" : $('#15').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})

	})

	$('#20').click(function() {

		priceCh();
		var tmpEle = document.getElementsByName("price");
		var tmpEleR = document.getElementsByName("region");
		var tmpEleS = document.getElementsByName("start");
		
		for(var y =0; y<tmpEleS.length;y++) {
			
			if(tmpEleS[y].checked == true) {
				tmpEleS[y].checked = false;
			}
		}		
		
		for(var y =0; y<tmpEleR.length;y++) {
			
			if(tmpEleR[y].checked == true) {
				tmpEleR[y].checked = false;
			}
		}

		if (tmpEle[4].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 4) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					} // 선택 해제

				}
			}
			// 선택 체크박스 해제시 선택 풀림
		}

		$.ajax({

			url : "packagePage.do?category=ajaxfree",
			data : {
				"price" : $('#20').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})

	})
	
// 날짜 검색 필터

	var monthCh8 = [];
	var monthCh9 = [];
	var monthCh10 = [];
	var monthCh11 = [];

	function monthCh() {

		if ($('#month8').val() == monthCh8) {
			var month8 = $('#month8').val();
		} else {
			month8 = "";
		}
		if ($('#month9').val() == monthCh9) {
			var month9 = $('#month9').val();
		} else {
			month9 = "";
		}

		if ($('#month10').val() == monthCh10) {
			var month10 = $('#month10').val();
		} else {
			month10 = "";
		}

		if ($('#month11').val() == monthCh11) {
			var month11 = $('#month11').val();
		} else {
			month11 = "";
		}

	}

	$('#month8').click(function() {

		monthCh();
		
		var tmpEle = document.getElementsByName("start");
		var tmpEleP = document.getElementsByName("price");
		var tmpEleR = document.getElementsByName("region");
		
		for(var y =0; y<tmpEleR.length;y++) {
			
			if(tmpEleR[y].checked == true) {
				tmpEleR[y].checked = false;
			}
		}
		
		for(var x =0; x<tmpEleP.length;x++) {
			
			if(tmpEleP[x].checked == true) {
				tmpEleP[x].checked = false;
			}
		}

		if (tmpEle[0].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 0) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}
				}
			}
		}

		$.ajax({

			url : "packagePage.do?category=startfree",
			data : {
				'start' : $('#month8').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})

	})

	$('#month9').click(function() {

		monthCh();
		
		var tmpEle = document.getElementsByName("start");
		var tmpEleP = document.getElementsByName("price");
		var tmpEleR = document.getElementsByName("region");
		
		for(var y =0; y<tmpEleR.length;y++) {
			
			if(tmpEleR[y].checked == true) {
				tmpEleR[y].checked = false;
			}
		}
		
		for(var x =0; x<tmpEleP.length;x++) {
			
			if(tmpEleP[x].checked == true) {
				tmpEleP[x].checked = false;
			}
		}

		if (tmpEle[1].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 1) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}
				}
			}
		}

		$.ajax({

			url : "packagePage.do?category=startfree",
			data : {
				'start' : $('#month9').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})

	})

	$('#month10').click(function() {

		monthCh();
		
		var tmpEle = document.getElementsByName("start");
		var tmpEleP = document.getElementsByName("price");
		var tmpEleR = document.getElementsByName("region");
		
		for(var y =0; y<tmpEleR.length;y++) {
			
			if(tmpEleR[y].checked == true) {
				tmpEleR[y].checked = false;
			}
		}
		
		for(var x =0; x<tmpEleP.length;x++) {
			
			if(tmpEleP[x].checked == true) {
				tmpEleP[x].checked = false;
			}
		}

		if (tmpEle[2].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 2) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}
				}
			}
		}

		$.ajax({

			url : "packagePage.do?category=startfree",
			data : {
				'start' : $('#month10').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})

	})

	$('#month11').click(function() {

		monthCh();
		
		var tmpEle = document.getElementsByName("start");
		var tmpEleP = document.getElementsByName("price");
		var tmpEleR = document.getElementsByName("region");
		
		for(var y =0; y<tmpEleR.length;y++) {
			
			if(tmpEleR[y].checked == true) {
				tmpEleR[y].checked = false;
			}
		}
		
		for(var x =0; x<tmpEleP.length;x++) {
			
			if(tmpEleP[x].checked == true) {
				tmpEleP[x].checked = false;
			}
		}

		if (tmpEle[3].checked == true) { // 10만원이 체크 된다면

			for (var i = 0; i < tmpEle.length; i++) { // 선택한 등급을 제외한 수만큼 for
														// 수행. i는 등급 위치
				if (i != 3) {
					if (tmpEle[i].checked == true) {
						tmpEle[i].checked = false;
					}
				}
			}
		}

		$.ajax({

			url : "packagePage.do?category=startfree",
			data : {
				'start' : $('#month11').val()
			},
			success : function(result) {
				console.log(result);
				for (var i = 0; i < 8; i++) {
					$("#listhide").remove();
				}
				document.getElementById("liststart").innerHTML = result;
			},
			error : function(result) {
				alert(JSON.stringify(result));
				alert("실패!");
			}
		})

	})
}
	
    