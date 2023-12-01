<%@page import="java.sql.*"%>
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
	
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");//한글화
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id =request.getParameter("id");
		String pwd =request.getParameter("pwd");
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/time_ti_travel?characterEncoding=utf8", "root", "skrdh159");
			if (conn ==null ) {
				throw new Exception("데이터베이스에 연결할수 없습니다.<BR>");
				//throw //확인문
			}
			
			pstmt = conn.prepareStatement("SELECT member_id,pw FROM member WHERE member_id = ?");
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();//맞는 정보 가져올때까지 반복 실행
						
			if(rs.next()) {
				
				if(!id.equals(rs.getString("member_id"))) {
					System.out.print("1");
					response.sendRedirect("login.jsp");
					
				}else if(!pwd.equals(rs.getString("pw"))) {
										
					out.print("<script>alert('로그인 실패!');location.href='http://localhost:8081/project_travel/login.jsp';</script>");
					
				}else {
					
					
					out.print("<script>alert('로그인 성공!');location.href='http://localhost:8081/project_travel/mainPage.jsp';</script>");
					session.setAttribute("userid", id);
					request.setAttribute("userid", id);
				}	
				
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
</body>
</html>