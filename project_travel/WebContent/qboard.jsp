<%@page import="Qboard.QboardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question board</title>
</head>
<link rel="stylesheet" href="css/header.css">
<link href="css/qboard.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/qboard.js"></script>
<jsp:useBean id="qboard" class="Qboard.QboardDao"/>
<body>
	<div class="mainbody">
	<%@ include file="headerfooter/header.jsp" %>	
	
	<div class="main_body">
		<div class="mainInner">
			<h1 style="text-align: center; font-size: 50px;">질문 게시판</h1>
			<div class="board_form">
				<ul class="cart_item">
					<li class="item_num">번호</li> 
					<li class="item_title">제목</li> 
					<li class="item_writer">작성자</li> 
					<li class="item_date">작성일</li>			
				</ul>
				<%
					request.setCharacterEncoding("UTF-8");//한글화
					
					ArrayList<QboardDTO> listone = qboard.selectOne();
					
					for(int i = 0; i< listone.size(); i++) {
				%>
				
				<a href="qboardcontent.jsp?board_num=<%=listone.get(i).getBoardnum() %>">
					<div class="cart_items">
						<div class="items_num"><%=listone.get(i).getBoardnum() %></div>
						<div class="items_title"><%=listone.get(i).getTitle()%></div>
						<div class="items_writer"><%=listone.get(i).getWriter()%></div>
						<div class="items_date"><%=listone.get(i).getDate() %></div>
					</div>
				</a>
				<% } %>
			</div>
			<% if(session.getAttribute("userid") != null) { %>
			<a href="qboardarticle.jsp">
				<input type="button" name="created" value="작성" class="body-enter">
			</a>
			<% } %>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="headerfooter/footer.jsp" %>
	</div>
</body>
</html>