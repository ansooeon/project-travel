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
	
		int boardnum = Integer.parseInt(request.getParameter("num").trim());
		
		dto.setBoardnum(boardnum);
	%>
	<jsp:useBean id="delete" class="Qboard.QboardDao">
	<%
		int update = delete.deleted(dto);
	
		response.sendRedirect("qboard.jsp");
	%>
	</jsp:useBean>
</body>
</html>