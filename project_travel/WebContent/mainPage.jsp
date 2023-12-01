
<%@page import="mainprint.MainpageDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
</head>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/MainPage.css">
<!-- 달력 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 3가지 슬라이드 -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> -->
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />


<body>
    
    <div class="mainbody">
        <!--header-->
        <%@ include file="headerfooter/header.jsp" %>
	
        <!-- mainbody -->
        <div class="img_body">
            <div class="slider">        
	         	<img src="img/mainImage1.jpg"  />	
                <img src="img/mainImage2.jpg"  />
                <img src="img/mainImage3.jpg"  />
                <img src="img/mainImage4.jpg"  />
                <img src="img/mainImage5.jpg"  />                
            </div>
            <form action="searchresult.bo" name="form" method="get">
	            <div class="searchform">
	                <div>
	                    <p class="info">검색</p>
	                </div>	                
	                <input type="text" class="searchInput" name="search" id="search" placeholder="검색 입력" >	                 
	                <div>
	                    <p class="info2">나라</p>
	                </div>
	                <select class="selectInput" name="country" id="country">
	                	<option value="" disabled selected>선택</option>
	                    <option value="대한한국">한국</option>
	                    <option value="영국">영국</option>
	                    <option value="미국">미국</option>
	                    <option value="일본">일본</option>
	                    <option value="호주">호주</option>
	                </select>
	                <div>
	                    <p class="info3">날짜</p>
	                </div>
	                <input type="text" name="mb_11" id="mb_11" class="calenderInput" autocomplete="off" placeholder="날짜 선택"/>
	                <input class="buttonInput" type="submit" value="검색하기"/>                
	            </div>
            </form>
        </div>
        <jsp:useBean id="print" class="mainprint.MainpagePrint"/>
        <div class="mainbody">
            <div class="mainbodyInner">
                <div class="travel">
                    <div class="Travel_sub">여행을 떠나요</div>
                    <div class="travel_slide">
                    <%
                    	ArrayList<MainpageDto> list = print.MainpagePrint();    
                    
                    	for(int i = 0; i<list.size(); i++) {
                    		if(i == 6) {
                    			break;
                    		}
                    		
                    		if(list.get(i).getCategory() == 1) {
                    %>                        
                    	<div class="travel_item_active2" >
                        	<a href="traveldetail.co?travel_num=<%= list.get(i).getTravel_num() %>">
                            <div class="item-img2">                           		
                                <img src="img/<%= list.get(i).getImgFile() %>">
								<div class="hovertext"><%=list.get(i).getAddress1() %></div>                                     
                            </div>
                            <div class="item-info">
                                <p class="tit"><%= list.get(i).getTitle() %></p>
                                <p class="cont"><%= list.get(i).getTitlesub() %></p>
                                <div class="btn-detail">자세히 보기</div>
                            </div>                            
                            </a>      
                        </div>                      
                    <%
                			}
                		}
                	%>
                    </div>
                </div>
                <div class="thematravel">
                    <div class="Travel_sub2">테마 여행</div>
                    <div class="travel_slide2">
                        <!-- https://fresh-mint.tistory.com/entry/%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C-slick-%EC%82%AC%EC%9A%A9%EB%B2%95%EB%B0%98%EC%9D%91%ED%98%95 -->
                        <!-- https://m.blog.naver.com/ka28/221999891981 -->
                        <%
                       	for(int i = 0; i<list.size(); i++) {
                       		if(i == 12) {
                       			break;
                       		}                        		
                   			if(list.get(i).getCategory() == 2) {
                        %>
                        <div class="travel_item_active2" >
                        	<a href="traveldetail.co?travel_num=<%= list.get(i).getTravel_num() %>">
                            <div class="item-img2">                           		
                                <img src="img/<%= list.get(i).getImgFile() %>">     
                                <div class="hovertext"><%=list.get(i).getAddress1() %></div>                                 
                            </div>
                            <div class="item-info">
                                <p class="tit"><%= list.get(i).getTitle() %></p>
                                <p class="cont"><%= list.get(i).getTitlesub() %></p>
                                <div class="btn-detail">자세히 보기</div>
                            </div>                            
                            </a>      
                        </div>
                        <%
                    			}
                    		}
                        %>
                    </div>
                </div>
                <div class="packagetravel">
                    <div class="Travel_sub3">패키지 여행</div>
                    <div class="travel_slide3">
                        <!-- https://fresh-mint.tistory.com/entry/%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C-slick-%EC%82%AC%EC%9A%A9%EB%B2%95%EB%B0%98%EC%9D%91%ED%98%95 -->
                        <!-- https://m.blog.naver.com/ka28/221999891981 -->
                        <%
                        	for(int i = 0; i<list.size(); i++) {
                        		if(i == 18) {
                        			break;
                        		}
                        		
                    			if(list.get(i).getCategory() == 3) {
                        %>
                        <div class="travel_item_active2">
                        	<a href="traveldetail.co?travel_num=<%= list.get(i).getTravel_num() %>">
                            <div class="item-img2">                               		
                                <img src="img/<%= list.get(i).getImgFile() %>">
                                <div class="hovertext"><%=list.get(i).getAddress1() %></div>                                                           
                            </div>
                            <div class="item-info">
                                <p class="tit"><%= list.get(i).getTitle() %></p>
                                <p class="cont"><%= list.get(i).getTitlesub() %></p>
                                <div class="btn-detail">자세히 보기</div>
                            </div>                            
                            </a>      
                        </div>                      
                        <%
                    			}
                    		}
                        %>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="headerfooter/footer.jsp" %>
    </div>
    
    <script src="js/MainPage.js"></script>
    <script src="js/slick.js"></script>
    <script src="js/slick.min.js"></script>
</body>
</html>