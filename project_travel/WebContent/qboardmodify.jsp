<%@page import="Qboard.QboardDTO"%>
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
		request.setCharacterEncoding("UTF-8");//한글화
	
		QboardDTO dto = new QboardDTO();	
	
		String title = request.getParameter("title").trim();
		String content = request.getParameter("content").trim();
		int num = Integer.parseInt(request.getParameter("board_num")); 
		
		dto.setTitle(title);
		dto.setContent(content);
		dto.setBoardnum(num);
	%>
	<jsp:useBean id="modify" class="Qboard.QboardDao">
	<%
		int update = modify.updated(dto);
	
		response.sendRedirect("qboard.jsp");
	%>
	</jsp:useBean>
</body>
</html>