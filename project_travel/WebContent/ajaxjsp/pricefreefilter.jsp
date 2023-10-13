<%@page import="travel.travelDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		travelDTO dto = new travelDTO();
	
		List<travelDTO> list = (List) request.getAttribute("listselect");
		
		for(int i=0;i<list.size();i++ ) {
			if(list.get(i).getCategory() == 1 ) {
	%>
		<div class="bodylist">
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
	<%}} %>
</body>
</html>