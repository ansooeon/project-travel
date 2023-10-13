<%@page import="travel.travelDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>packagePage</title>
</head>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/packagePage.css">
<!-- 이미지 슬라이드 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 이미지 슬라이드 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 3가지 슬라이드 -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> -->
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<body>
    <form name="form">
    <div class="mainbody">
        <%@ include file="headerfooter/header.jsp" %>
        <!-- body part -->
        <div class="main_body">
            <div class="mainbody_Inner">
                <div class="left_filter">
                    <div class="item_search">검색</div>
                    <!-- <input type="text" class="filterSearch" name="filtersearch"> -->
                    <div class="by_rigion">
                        <div class="item-title">Region Search</div>
                        <div class="item-checkInner">
	                        <input class="item_ck1" type="checkbox" name="region" id="usa" value="미국">미국
	                        <input class="item_ck4" type="checkbox" name="region" id="franch" value="프랑스">프랑스<br/>
	                        <input class="item_ck2" type="checkbox" name="region" id="korea" value="대한민국">대한민국
	                        <input class="item_ck2" type="checkbox" name="region" id="japan" value="일본">일본<br/>
	                        <input class="item_ck2" type="checkbox" name="region" id="egypt" value="이집트">이집트
                        
                        </div>
                    </div>
                    <div class="by_price">
                        <div class="item-title">Price Search</div>
                        <div class="item-checkInner">
                            <input class="item_ck1" type="checkbox" name="price" id="1" value="100000">10만원
                            <input class="item_ck3" type="checkbox" name="price" id="5" value="500000">50만원<br/>
                            <input class="item_ck2" type="checkbox" name="price" id="10" value="1000000">100만원
                            <input class="item_ck2" type="checkbox" name="price" id="15" value="1500000">150만원<br/>
                            <input class="item_ck2" type="checkbox" name="price" id="20" value="2000000">200만원
                        </div>
                    </div>
                    <div class="by_thing">
                        <div class="item-title">Travel Start</div>
                        <div class="item-checkInner">
                            <input class="item_ck1" type="checkbox" name="start" id="month8" value="8">8월 
                            <input type="checkbox" class="startnine" name="start" id="month9" value="9">9월 <br/>
                            <input class="item_ck2" type="checkbox" name="start" id="month10" value="10">10월 
                            <input class="item_ck2" type="checkbox" name="start" id="month11" value="11">11월 
                        </div>                   
                    </div>
                </div>
                <%
                	travelDTO dto = new travelDTO();
                
                	List<travelDTO> list = (List)request.getAttribute("list");
                	
                	for(int i=0;i<list.size();i++) {
                		
                		
                %>
                <div id="liststart">
                </div>
                <div id="listhide">
	                <div class="bodylist" >
	                    <div class="img-box">
	                        <img class="img-radius" src="img/<%= list.get(i).getImg()%>">
	                    </div>
	                    <div class="body-box">
	                        <div class="body-title"><%= list.get(i).getTitle() %></div>
	                        <div class="body-content"><%= list.get(i).getTitlesub() %></div>
	                        <div class="body-day"><%= list.get(i).getStartdate() %> ~ <%= list.get(i).getEnddate() %> </div>
	                        <div class="body-price"><%= list.get(i).getPrice() %>원~</div>
	                        <a href="traveldetail.do?travel_num=<%= list.get(i).getTravel_num() %>" class="body-enter">
			            	자세히 보기
			           		</a>
	                        <!-- <button class="body-enter">장바구니 담기</button> -->
	                    </div>
	                </div>
                </div>
                
                <%} %>
                <br/><br/><br/>
              
            </div>
        </div>
        <!-- body part end -->
        <%@ include file="headerfooter/footer.jsp" %>
    </div>
    </form>
    <script src="js/packagePage.js"></script>
    <script src="js/slick.js"></script>
    <script src="js/slick.min.js"></script>
</body>
</html>