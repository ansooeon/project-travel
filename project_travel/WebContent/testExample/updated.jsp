<%@page import="javatest.SurvletDTO"%>
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
	
		SurvletDTO dto = new SurvletDTO();	
	
		String pwd = request.getParameter("pwd").trim();
		
		dto.setPpwd(pwd);
		
	%>
	<jsp:useBean id="modify" class="javatest.Survlet">
		<%
			int update = modify.updated(dto);
		
			response.sendRedirect("selectAllinfo.jsp");
		%>
	</jsp:useBean>
</body>
</html>