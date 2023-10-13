<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="javatest.Survlet" %>
<%@ page import="javatest.SurvletDTO" %> <!-- 저장된 데이터들을 불러오기 위해서 파일을 임포트 하여 홯용한다. -->
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
	
		String id = request.getParameter("id"); //앞 페이지 링크에서 페이지 뒤에 id를 변수 id 에 저장.
		
		dto.setPid(id); //dto에 아이디를 저장한다.
	
	%>
	<jsp:useBean id="selectOne" class="javatest.Survlet"/>
	<%
		SurvletDTO list = selectOne.selectOneInfo(dto); //항상 어디에서 무언가를 가져왔다면 어떤 변수안에 객체를 선언해서 값을 저장시킨다.		
	%>
	
	<div><h2><%=list.getPid()%>의 정보</h2></div>
	<table border="1">
		<form action="updated.jsp">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>년도</td>
			<td>회원번호</td>
			<td>전공</td>
			<td>번호1</td>
			<td>번호2</td>
			<td>주소</td>
			<td>이메일</td>
		</tr>
		
		<tr>
			<td><%=list.getPid()%></td>
			<td><input type="text" name="pwd" value="<%=list.getPpwd()%>"></td>
			<td><%=list.getPname()%></td>
			<td><%=list.getPyear()%></td>
			<td><%=list.getPsnum() %></td>
			<td><%=list.getPdepart() %></td>
			<td><%=list.getPmobile1() %></td>
			<td><%=list.getPmobile2() %></td>
			<td><%=list.getPaddress() %></td>
			<td><%=list.getPemail() %></td>
		</tr>
		<input type="submit" value="수정"/>
		</form>
	</table>
</body>
</html>