<%@page import="java.util.List"%>
<%@page import="traveldetail.travelDetailImgDTO"%>
<%@page import="traveldetail.travelscheduleDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="travel.travelDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	travelDTO article = (travelDTO) request.getAttribute("article");
	travelscheduleDTO schedule = (travelscheduleDTO) request.getAttribute("schedule");
	String id = (String) session.getAttribute("userid");

	DecimalFormat df = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
</head>
<link href="css/traveldetail.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2-RUJ9BHgIALNEhGYHF33qaMgE-hsvkk&callback=myMap"></script>
<script src="js/traveldetail.js"></script>
<script src="js/slick.js"></script>
<script src="js/slick.min.js"></script>
<script src="https://js.tosspayments.com/v1/payment"></script>
<script type="text/javascript">
	
	
	//구글맵 시작
	var latitude  = <%=article.getLatitude()%>;
	var longitude = <%=article.getLongtitude()%>;
	
	function myMap(){
		
	   var mapOptions = { 
	         center:new google.maps.LatLng(latitude, longitude),
	         disableDefaultUI:true,
             zoomControl: true,
	         zoom:7
	   };
	   //실질적인 맵 그리기
	   var map = new google.maps.Map(
			   document.getElementById("map"), mapOptions);
	   
       //마커
       var marker = new google.maps.Marker({
           position: new google.maps.LatLng(latitude, longitude),
           map: map,
           title: 'Hello World!'
       });	   
		   
	}
	
	/* 탭메뉴 함수 */
	$(function() {
		
		 $('.con_detail > div').hide();
		 $('.tab-d-area a').click(function() {
		 	$('.con_detail > div').hide().filter(this.hash).fadeIn();
			$('.tab-d-area a').removeClass('selected');
			$(this).addClass('selected');
			return false;
		 }).filter(':eq(0)').click();
	});
	
	

	//결제 api

</script>
<body>
	<!--header-->
	<%@ include file="headerfooter/header.jsp"%>
	<div class="mainbody">
		<div class="mainbody_Inner">
			<div class="title_region">
				<div class="item_title">
					<p class="title">
						<%=article.getTitle()%></p>
				</div>

			</div>
			<div class="body_region">
				<div class="body_area">
					<div class="slider">
						<%
							List<travelDetailImgDTO> img = (List) request.getAttribute("img");

							for (int i = 0; i < img.size(); i++) {
						%>
						<img src="img/<%=img.get(i).getImg()%>">
						<%
							}
						%>
					</div>
					<div class="item_price">
						<div class="price_tab">
							<div class="cell_title">
								<div class="tit">구분</div>
								<div class="cont">상품가격</div>
							</div>
							<div class="cell age-1">
								<div class="tit">성인(만 12세 이상)</div>
								<div class="cont">
									<strong style="font-size: 18px;"><%=df.format(article.getPrice())%></strong>원
								</div>
							</div>
							<div class="cell age-2">
								<div class="tit">아동(만 12세 미만)</div>
								<div class="cont">
									<strong style="font-size: 18px;"><%=df.format(article.getPrice())%></strong>원
								</div>
							</div>
							<div class="cell age-3">
								<div class="tit">(유아(24개월 미만))</div>
								<div class="cont">여행 불가능</div>
							</div>
						</div>
						<p class="price_txt">- 유류할증료, 제세공과금은 유가와 환율에 따라 변동될 수 있습니다.</p>
					</div>
					<div class="item_traffic">
						<div class="tit">
							<div>
								<strong style="font-size: 20px;">이용교통</strong>
								<p class="area" style="margin-top: 30px; margin-bottom: 0;">
									&nbsp;<%=article.getAirport()%></p>
							</div>
						</div>
						<div class="cont">
							<div class="info-box" style="margin-right: 50px;">
								<dl>
									<dt style="text-align: right;">여행출발</dt>
									<dd style="font-size: 20px"><%=article.getStartdate()%></dd>
								</dl>
							</div>
							<div class="info-box" style="margin-right: 50px;">
								<dl>
									<dt style="text-align: right;">여행종료</dt>
									<dd style="font-size: 20px"><%=article.getEnddate()%></dd>
								</dl>
							</div>
						</div>
					</div>
					<div class="item_detail">
						<nav class="tab_detail">
							<div class="tab-d-area">
								<a href="#goodsEvtTab_1_show" id="goodsEvtTab_1" type="button"
									class="selected">여행내용</a> <a href="#goodsEvtTab_2_show"
									id="goodsEvtTab_2" type="button" class="selected">약관정보</a>
							</div>
						</nav>
						<div class="con_detail">
							<div class="goodsEvtTab_1_show" id="goodsEvtTab_1_show">
								<div class="tit_1" style="font-size: 32px !important;">
									<strong>여행내용</strong>
								</div>
								<div class="item_schedule">
									<div class="plan-header">
										<div class="tit_1">
											<strong>여행정보</strong>
										</div>
										<strong class="date"><%=schedule.getTitle()%></strong>
									</div>

									<div class="plan-body" style="margin-left: 20px;">
										<img src="img/url-CpLCyXKiSItL7Uq8.jpg">
										<div><%=schedule.getContent()%></div>
									</div>
								</div>
							</div>
							<div class="goodsEvtTab_2_show" id="goodsEvtTab_2_show">
								<div class="tit_1">
									<strong style="font-size: 32px;">약관정보</strong>
								</div>
								<div class="tit_2">
									<div class="item_tab2">
										<div class="tab2_term1">특별약관</div>
										<div class="item_tab2_right">
											<div class="tab2_text_area">
												■ 여행사<br> · 예약 후 취소시 여행사 수수료 1인 20만원이 발생됩니다.<br> <br>
												■ 항공권<br> · 출발 후 취소는 불가합니다.<br> · 항공권 발권 후 취소시
												항공사별 규정에 따라 수수료 발생되며, 담당자에게 별도 확인부탁드립니다.<br> · 항공권 발권 후
												예약 변경이나 재발행(영문변경)으로 인하여 발생되는 비용은 항공사 규정에 따릅니다.<br> ·
												전세기 및 일부 특가 항공권은 예약 확정 또는 항공권 발권 후 취소 시 100% 비용이 부과됩니다.<br>
												· 항공 사전좌석 배정은 항공편의 취소, 지연, 기종의 변경 등으로 인해 부득이한 사유로 인하여 예고없이
												변경 될 수 있습니다.<br> · 항공 사전좌석배정은 출발전 해당항공사 홈페이지에서 직접
												지정가능하며,<br> 온라인상으로 배정한 좌석도 100% 개런티되지 않으니 보딩 시 공항에서
												재확인하시기 바랍니다.<br> <br> ■ 호텔<br> · 각 호텔별 규정 및
												객실에따라 수수료 발생시점이 상이합니다. 예약 변경/취소 시점에 맞춰 담당자에게 별도 확인 부탁드립니다.<br>
												<br> ■ 열차/구간항공/각종 교통권<br> · 대부분의 열차/구간항공/교통권 등은 발권
												후 변경/취소가 불가하며 환불이 불가합니다.<br> 교통권 발권전 담당자가 고객님께 별도 추가안내
												드리고있습니다.<br> <br> <br> ■ 취소위약금 증빙 제공 및 계약해제<br>
												고객은 계약취소와 관련하여 취소수수료(여행사 인건비 포함) 부과내역에 대한 구체적인 증빙과 설명을 여행사에
												요구할 수 있으며, 여행사는 관련 설명과 증빙을 제시하고 취소수수료 규정과 차액이 있는 경우 환급합니다.<br>
												<br> ※ 행사 진행 중 천재지변 및 불가피한 상황 발생으로 소요되는 비용은 고객님께서 부담하셔야
												합니다.<br> ※ 취소기준일은 취소를 통지한 날로 여행사와 항공사의 업무특성 상
												영업일(월~금-09:00~18:00, 공휴일 제외) 기준입니다.<br>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="option_area">
					<div class="item-quantity">
						<dl>
							<dt>성인</dt>
							<dd>
								<strong class="won"><%=df.format(article.getPrice())%><a
									style="font-size: 15px;">원</a></strong>
								<div class="count_box">
									<button class="btn-minus"
										onclick="adult_setReservation('minus')" value="-">빼기</button>
									<div id="adultCnt" name="_NoKorean">0</div>
									<button class="btn-plus" onclick="adult_setReservation('plus')"
										value="+">더하기</button>
								</div>

							</dd>
						</dl>
						<dl>
							<dt>아동</dt>
							<dd>
								<strong class="won"><%=df.format(article.getPrice())%><a
									style="font-size: 15px;">원</a></strong>
								<div class="count_box">
									<button class="btn-minus"
										onclick="child_setReservation('minus')" value="-">빼기</button>
									<div id="childCnt" name="_NoKorean">0</div>
									<button class="btn-plus" onclick="child_setReservation('plus')"
										value="+">더하기</button>
								</div>

							</dd>
						</dl>
						<dl class="item-total">
							<dt>최종 합계금액</dt>
							<dd>
								<strong class="sum" id="sum" style="display: flex;">0</strong><a
									style="font-size: 15px;">원</a> <span class="txt">유류할증료
									포함</span>
							</dd>
						</dl>
						<div class="item-btn">
							<button type="button" id="btnReservation"
								class="btn-type-1 color--black">주문하기</button>
						</div>
						<a
							href="cartadd.ca?travel_num=<%=article.getTravel_num()%>&userid=<%=session.getAttribute("userid")%>"
							class="btn-type-2 color--black">장바구니 담기</a>
						<div id="map"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="headerfooter/footer.jsp"%>
</body>
<script type="text/javascript">

// ------ 클라이언트 키로 객체 초기화 ------
var clientKey = 'test_ck_0RnYX2w5327DZ42pN5KMVNeyqApQ';
var tossPayments = TossPayments(clientKey);
const button = document.getElementById("btnReservation");

var sum = document.getElementById("sum");
var adult = document.getElementById("adultCnt");
var child = document.getElementById("childCnt");

var changeValue = sum.textContent;
var changeAdult = 0;
var changeChild = 0;

/* 카운트 함수 */
function adult_setReservation(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('adultCnt');
	  const sumElement = document.getElementById('sum');		  	  
	  // 현재 화면에 표시된 값
	  var number = resultElement.innerText;
	  var sum = sumElement.innerText;		
	  
	  // 더하기/빼기
	  if(type == 'plus') {
	    number = parseInt(number) + 1;
	    sum = parseInt(sum) + <%=article.getPrice()%>;
	  }else if(type == 'minus')  {
	    number = parseInt(number) - 1;
	    sum = parseInt(sum) - <%=article.getPrice()%>;
	  }	    
	  // 결과 출력
	  resultElement.innerText = number;
	  sumElement.innerText = sum;
  
}

function child_setReservation(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('childCnt');
	  const sumElement = document.getElementById('sum');
	  
	  // 현재 화면에 표시된 값
	  var number = resultElement.innerText;
	  var sum = sumElement.innerText;
	  
	  // 더하기/빼기
	  if(type == 'plus') {
	    number = parseInt(number) + 1;
	    sum = parseInt(sum) + <%=article.getPrice()%>;
	  }else if(type == 'minus')  {
	    number = parseInt(number) - 1;
	    sum = parseInt(sum) - <%=article.getPrice()%>;
	  }		  	  
	  // 결과 출력
	  resultElement.innerText = number;
	  sumElement.innerText = sum;
}

//주기적으로 값을 확인하는 함수
// 2초마다 checkForChanges 함수를 호출
setInterval(checkForChanges, 1000);

setTimeout(function() {
  document.getElementById("sum").textContent = "0";
}, 1000);  

var userId = '<%=session.getAttribute("userid")%>';

function checkForChanges() {
  
changeValue = sum.textContent;
changeAdult = adult.textContent;
changeChild = child.textContent;

	button.addEventListener("click", function () {
	 
	 	if(userId != null) {
	
			if(changeAdult == 0 && changeChild == 0) {
				alert("인원이 한명 이상일 경우 결제가 가능합니다!");
				return;
			}else {
			
			   tossPayments.requestPayment('카드', { 
			     
			      amount: changeValue , // 결제 금액
			      orderId: '7_XR8395y-HtJQb7Wb55L', 
			      orderName: '<%=article.getTitle()%>', 
			      customerName: '<%=session.getAttribute("userid")%>', 
				      successUrl: 'http://localhost:8081/project_travel/mainPage.jsp', 
				      failUrl: 'http://localhost:8081/project_travel/mainPage.jsp', 
				    })
				    
				    .catch(function (error) {
				      if (error.code === 'USER_CANCEL') {
				        
				      } else if (error.code === 'INVALID_CARD_COMPANY') {
				        
				      }
				   });
				}
	  	} else {
	  		alert("로그인 후 이용해 주세요!");
	  		return;
	  	}
	})	  
}
</script>
</html>