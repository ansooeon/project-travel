<%@page import="java.util.ArrayList"%>
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
	<jsp:useBean id="insert" class="javatest.SurvletInsert">
		<%
		request.setCharacterEncoding("UTF-8");//한글화
		
		SurvletDTO dto = new SurvletDTO();//SurvletDTo 객체
		
		String id =request.getParameter("pid");
		String pwd =request.getParameter("ppasswd");
		String name =request.getParameter("pname");	
		String p_year =request.getParameter("pyear");
		String snum =request.getParameter("psnum");
		String depart =request.getParameter("pdepart");
		String mobile1 = request.getParameter("pmobile1");
		String mobile2 = request.getParameter("pmobile2");
		String address = request.getParameter("paddress");
		String email =request.getParameter("pemail"); //넘어온 데이터 변수처리
		
		//매개변수
		dto.setPid(id);
		dto.setPpwd(pwd);
		dto.setPname(name);
		int year = Integer.parseInt(p_year);
		dto.setPyear(year);
		dto.setPsnum(snum);
		dto.setPdepart(depart);
		dto.setPmobile1(mobile1);
		dto.setPmobile2(mobile2);
		dto.setPaddress(address);
		dto.setPemail(email); //dto에 입력한 데이터에 입력
		
		int aa = insert.insert(dto); //dto SurvletInsert.java를 불러와서 입력 작업 실행
		
		//입력폼 => jap(웹 페이지) => java(데이터 처리)
		
		%>
	</jsp:useBean>
	<jsp:useBean id="id" class="javatest.Survlet"/>
	
	<div><h2>모든 자료 조회</h2></div>
	<table border="1">
		
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
		<%
			ArrayList<SurvletDTO> list = id.selectAll(); //항상 어디에서 무언가를 가져왔다면 어떤 변수안에 객체를 선언해서 값을 저장시킨다.
			for(int i = 0; i<list.size(); i++) {
		%>
		<tr>
			<td><%=list.get(i).getPid()%></td>
			<td><%=list.get(i).getPpwd()%></td>
			<td><%=list.get(i).getPname()%></td>
			<td><%=list.get(i).getPyear()%></td>
			<td><%=list.get(i).getPsnum() %></td>
			<td><%=list.get(i).getPdepart() %></td>
			<td><%=list.get(i).getPmobile1() %></td>
			<td><%=list.get(i).getPmobile2() %></td>
			<td><%=list.get(i).getPaddress() %></td>
			<td><%=list.get(i).getPemail() %></td>
		</tr>
		<%
			}
		%>
	</table>
	<jsp:useBean id="one" class="javatest.Survlet"/>
	<div><h2>아이디 링크</h2></div>
	<table border="1">
		
		<tr>
			<td>아이디</td>
		</tr>	
		<%
			request.setCharacterEncoding("UTF-8");//한글화
			
			ArrayList<SurvletDTO> listone = one.selectOne(); //항상 어디에서 무언가를 가져왔다면 어떤 변수안에 객체를 선언해서 값을 저장시킨다.
			for(int i = 0; i<list.size(); i++) {
		%>		
		<tr>
			<td><a href="selectOneinfo.jsp?id=<%=listone.get(i).getPid() %>"><%=listone.get(i).getPid()%></a></td>
			<!-- 링크 파일 뒤에 ?id 는 넘기는 페이지에서 불리게 될 변수 같은 역할을 한다 -->
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>