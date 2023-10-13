
<%@page import="Mainpage.MainpageDto"%>
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
    <form name="form">
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
            
            <div class="searchform">
                <div>
                    <p class="info">검색</p>
                </div>
                <input type="text" title="검색어 입력" placeholder="검색 입력" class="searchInput">
                <div>
                    <p class="info2">나라</p>
                </div>
                <select class="selectInput">
                    <option>한국</option>
                    <option>영국</option>
                    <option>미국</option>
                    <option>일본</option>
                    <option>호주</option>
                </select>
                <div>
                    <p class="info3">날짜</p>
                </div>
                <input type="text" name="mb_11" id="mb_11" class="calenderInput" autocomplete="off"
                    placeholder="달력" />
                <button class="buttonInput" type="button">
                    검색하기
                </button>
            </div>
        </div>
        <jsp:useBean id="print" class="Mainpage.MainpagePrint"/>
        <div class="mainbody">
            <div class="mainbodyInner">
                <div class="travel">
                    <div class="Travel_sub">여행을 떠나요</div>
                    <div class="travel_slide">
                    <%
                    	ArrayList<MainpageDto> list = print.MainpagePrint();
            
                    	for(int i = 0; i<list.size(); i++) {
                    		if(list.get(i).getCategory() == 1) {
                    %>
                        <!-- https://fresh-mint.tistory.com/entry/%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8%EC%8A%AC%EB%9D%BC%EC%9D%B4%EB%93%9C-slick-%EC%82%AC%EC%9A%A9%EB%B2%95%EB%B0%98%EC%9D%91%ED%98%95 -->
                        <!-- https://m.blog.naver.com/ka28/221999891981 -->
                        <div class="travel_item_active2" >
                            <div class="item-img2">
                           		<a href="">
                                <img src="img/<%= list.get(i).getImgFile()  %>">
                                </a>
                            </div>
                            <div class="item-info">
                                <p class="tit">
                                	<a href="">
                                    <%= list.get(i).getTitle() %>
                                    </a>
                                </p>
                                <p class="cont"><a href=""><%= list.get(i).getTitlesub() %></a></p>
                                <div class="btn-detail"><a href="">자세히 보기</a></div>
                            </div>      
                        </div>
                        <%-- <div class="travel_item_active" >
                            <div class="item-img">
                            <a href="">
                                <img src="img/<%= list.get(i).getImgFile()  %>">
                                </a>
                            </div>
                            <div class="item-info">
                                <p class="tit">
                                <a href="">
                                    <%= list.get(i).getTitle() %>
                                    </a>
                                </p>
                                <p class="cont"><a href=""><%= list.get(i).getTitlesub() %></a></p>
                                <div class="btn-detail"><a href="">자세히 보기</a></div>
                            </div>      
                        </div> --%>
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
                    			if(list.get(i).getCategory() == 2) {
                        %>
                        <div class="travel_item_active2" >
                            <div class="item-img2">
                           		<a href="">
                                <img src="img/<%= list.get(i).getImgFile()  %>">
                                </a>
                            </div>
                            <div class="item-info">
                                <p class="tit">
                                	<a href="">
                                    <%= list.get(i).getTitle() %>
                                    </a>
                                </p>
                                <p class="cont"><a href=""><%= list.get(i).getTitlesub() %></a></p>
                                <div class="btn-detail"><a href="">자세히 보기</a></div>
                            </div>      
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
                    			if(list.get(i).getCategory() == 3) {
                        %>
                        <div class="travel_item_active2" >
                            <div class="item-img2">
                           		<a href="">
                                <img src="img/<%= list.get(i).getImgFile()  %>">
                                </a>
                            </div>
                            <div class="item-info">
                                <p class="tit">
                                	<a href="">
                                    <%= list.get(i).getTitle() %>
                                    </a>
                                </p>
                                <p class="cont"><a href=""><%= list.get(i).getTitlesub() %></a></p>
                                <div class="btn-detail"><a href="">자세히 보기</a></div>
                            </div>      
                        </div>
                        <%-- <div class="travel_item_active" >
                            <div class="item-img">
                            <a href="">
                                <img src="img/<%= list.get(i).getImgFile()  %>">
                                </a>
                            </div>
                            <div class="item-info">
                                <p class="tit">
                                <a href="">
                                    <%= list.get(i).getTitle() %>
                                    </a>
                                </p>
                                <p class="cont"><a href=""><%= list.get(i).getTitlesub() %></a></p>
                                <div class="btn-detail"><a href="">자세히 보기</a></div>
                            </div>      
                        </div> --%>
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
    </form>
    <script src="js/MainPage.js"></script>
    <script src="js/slick.js"></script>
    <script src="js/slick.min.js"></script>
</body>
</html>