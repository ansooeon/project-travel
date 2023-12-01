<%@page import="java.text.DecimalFormat"%>
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
		
		DecimalFormat df = new DecimalFormat("###,###");
		
		for(int i=0;i<list.size();i++ ) {
			int price = list.get(i).getPrice();
			if(list.get(i).getCategory() == 3) {
	%>
		<div class="bodylist" id="liststart">
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
	<%}} %>
</body>
</html>