<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String id =request.getParameter("id");
		String pwd =request.getParameter("pwd");
		String name =request.getParameter("name");	
		String phone =request.getParameter("phone");
		String email1 =request.getParameter("email1");
		String email2 =request.getParameter("email2");
		String birthY = request.getParameter("birth_yy");
		String birthM = request.getParameter("birth_mm");
		String birthD = request.getParameter("birth_dd");
		String address1 =request.getParameter("address1");
		String address2 =request.getParameter("address2");
		String address3 =request.getParameter("address3");
		String[] hobby =request.getParameterValues("hobby");
		
		String hobbys = "";
		
		for(int i = 0; i< hobby.length; i++) { //여러가지 취미 선택 풀어내기
			hobbys += hobby[i] + "";
		}
		
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/time_ti_travel?characterEncoding=utf8", "root", "skrdh159");
			if (conn ==null ) {
				throw new Exception("데이터베이스에 연결할수 없습니다.<BR>");
				//throw //확인문
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, phone);
			pstmt.setString(5, email1);
			pstmt.setString(6, email2);
			pstmt.setString(7, birthY);
			pstmt.setString(8, birthM);
			pstmt.setString(9, birthD);
			pstmt.setString(10, hobbys);
			pstmt.setString(11, address1);
			pstmt.setString(12, address2);
			pstmt.setString(13, address3);
			
			int result = pstmt.executeUpdate();
			
			if(result == 1) {//성공
				response.sendRedirect("login.jsp");
			} else {//실패
				out.println("회원 가입 실패!");
				response.sendRedirect("member.jsp");
			}
			
		} finally {
			try {
				pstmt.close();
			} catch (Exception ignored) {
				
			} 
			try {
				conn.close();
			} catch (Exception ignored) {
				
			}
		}
	
	%>
	<%-- <h2>회원 가입 정보</h2>
	아이디: <%= id %> <br>
	이름:	 <%= name %><br>
	패스워드: <%= pwd %><br>
	폰번호: <%= phone %><br>
	이메일: <%= email1 %> @ <%=email2 %><br>
	생년월일: <%= birthY %> <%= birthM %> <%= birthD %><br>
	주소: <%= address1 %><br>
	<%= address2 %><br>
	<%= address3 %><br>
	취미: <%
	
			if(hobby == null) {
				out.println("취미없음");
			}for (int i = 0; i<hobby.length;i++) {
				out.println(hobby[i] + "");
			}
	
		 %> --%>
</body>
</html>