<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="css/header.css" type="text/css" rel="stylesheet">

<body>
	<div class="header">
         <div class="headerInner">
             <div class="util1">
                 <a href="mainPage.jsp">
                     <img src="img/MainRogo.jpg">
                 </a>
             </div>             
             <ul class="util2">
             	 <% if(session.getAttribute("userid") == null) { %>
                 <li><a href="login.jsp">로그인</a></li>
                 <% } else { %>
                 <li><% out.print(session.getAttribute("userid")); %>님</li>
                 <li><a href="logout.jsp">로그아웃</a></li>
                 <% } %>
                 <% if(session.getAttribute("userid") == null) { %>                   
                 <li><a href="member.jsp">회원가입</a></li>  
                 <% } else {} %>                  
                 <li><a href="mypage.jsp">마이페이지</a></li>
                 <li><a href="cartpage.ca?userid=<%= session.getAttribute("userid")%>">장바구니</a></li>
             </ul>
             <ul class="util3">
                 <li class="util_nav"><a href="freePage.do?category=free">자유 여행</a></li>
                 <li class="util_nav"><a href="themaPage.do?category=thema">테마 여행</a></li>
                 <li class="util_nav"><a href="packagePage.do?category=package">패키지 여행</a></li>                    
                 <li><a href="travelinfoList.ti">여행을 공유해요</a></li>
                 <li><a href="qboard.jsp">질문 게시판</a></li>
             </ul>
         </div>
         <div class="nb">            
             <ul class="nb_t">
                 <li>국내</li>
                 <li>아시아</li>
                 <li>오세아니아</li>
                 <li>아메리카</li>
                 <li>유럽</li>
                 <li>아프리카</li>
             </ul>
             <div class="nb_Inner">
                 <ul class="gmenu1">
                     <li><a href="">서울</a></li>
                     <li><a href="">강원도</a></li>
                     <li><a href="">부산</a></li>
                     <li><a href="">전주</a></li>
                     <li><a href="">제주도</a></li>
                 </ul>
                 <ul class="gmenu2">
                     <li><a href="">일본</a></li>
                     <li><a href="">태국</a></li>
                     <li><a href="">대만</a></li>
                     <li><a href="">중국</a></li>
                 </ul>
                 <ul class="gmenu3">
                     <li><a href="">호주</a></li>
                     <li><a href="">뉴질랜드</a></li>
                     <li><a href="">파푸아뉴기니</a></li>
                 </ul>
                 <ul class="gmenu4">
                     <li><a href="">미국</a></li>
                     <li><a href="">캐나다</a></li>
                     <li><a href="">브라질</a></li>
                     <li><a href="">아르헨티나</a></li>
                 </ul>
                 <ul class="gmenu5">
                     <li><a href="">영국</a></li>
                     <li><a href="">프랑스</a></li>
                     <li><a href="">스페인</a></li>
                     <li><a href="">스위스</a></li>
                     <li><a href="">이탈리아</a></li>           
                 </ul>
                 <ul class="gmenu6">
                     <li><a href="">남아프리카 공화국</a></li>
                     <li><a href="">이집트</a></li>    
                     <li><a href="">모로코</a></li>    
                     <li><a href="">케냐</a></li>    
                 </ul>
             </div>
         </div>
     </div>
</body>
</html>