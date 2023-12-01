<%@page import="TravelInfo.TravelDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	TravelDTO dto = (TravelDTO) request.getAttribute("article");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>time_to_travel</title>
</head>
<link rel="stylesheet" href="css/header.css">
<link href="css/travelinfoDetail.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2-RUJ9BHgIALNEhGYHF33qaMgE-hsvkk&callback=myMap"></script>
<script src="js/travelinfoDetail.js"></script>
<script type="text/javascript">	
	//검색 좌표 얻어 오기
	//https://hgko1207.github.io/2020/03/25/java-geocoder/
	//java 주소를 통해 위도, 경도 좌표 얻기
	//구글맵 시작
	var latitude  = 17.31;
	var longitude = 13.31;
	
	function myMap(){
		
	   var mapOptions = { 
	         center:new google.maps.LatLng(17.31, 13.31),
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
	
</script>
<body>
	<div class="mainbody">
		<%@ include file="headerfooter/header.jsp" %>
		<div class="main_body">
			<div class="mainInner">
				<div class="travelFormArea">
					<div class="formtitle">여행 위치 표시</div>
					<div class="formlist">
					
					</div>
					<div class="formlist">
					
					</div>
					<div class="formlist">
					
					</div>
					<div class="formlist">
					
					</div>
					<div class="formlist">
					
					</div>
					<div class="list-btn">
						<a href="" name="regionAdd" id="regionAdd" class="btn-type white">추가하기</a>
					</div>
				</div>
				<div class="travelMain">
					<div class="travelMain_Inner">
						<div class="title_region">
							<div class="item_title">
								<p class="title"><%= dto.getTitle() %></p>
								<div class="writer">글쓴이: <%=dto.getMember_id() %></div>
							</div>								
						</div>		
						<div class="item_img" style="margin: 10px; border-bottom: 1px solid black; ">
							<img src="img/<%=dto.getImg() %>">
						</div>
						<div class="item_content" style="margin: 10px; border-bottom: 1px solid black;">
							<div class="title">내용</div>
							<div class="content" style="padding-top: 60px; padding-bottom: 60px;">
								<%= dto.getContent() %>
							</div>
						</div>		
						<div Id="map" style= "margin:10px;"></div>
						<div class="item_myplan" style= "margin:10px; border-bottom:1px solid black; border-top:1px solid black;">
							<div class="title" style="margin-top: 10px;">계획</div>
							<div class="myplan" style="padding-top: 60px; padding-bottom: 60px;">
								<%= dto.getMyplan() %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer -->
        <%@ include file="headerfooter/footer.jsp" %>
	</div>
</body>


</html>