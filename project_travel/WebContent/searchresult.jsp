<%@page import="java.text.DecimalFormat"%>
<%@page import="travel.travelDTO"%>
<%@page import="java.util.*"%>
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
<link rel="stylesheet" href="css/searchresult.css">
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
                </div>
                <%                               
                	List<travelDTO> list = (List)request.getAttribute("searchlist");
                	
					DecimalFormat df = new DecimalFormat("###,###");
                	
                	for(int i=0;i<list.size();i++) {
                		
                		int price = list.get(i).getPrice();
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
	                        <div class="body-price"><%= df.format(price) %><em style="font-size: 15px; ">원~</em></div>
	                        <a href="traveldetail.co?travel_num=<%= list.get(i).getTravel_num() %>" class="body-enter">
			            	자세히 보기
			           		</a>			           		
	                        <a href="cartadd.ca?travel_num=<%= list.get(i).getTravel_num() %>&userid=<%= session.getAttribute("userid") %>" class="body-cart">장바구니 담기</a>
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
    <script src="js/freePage.js"></script>
    <script src="js/slick.js"></script>
    <script src="js/slick.min.js"></script>
</body>
</html>