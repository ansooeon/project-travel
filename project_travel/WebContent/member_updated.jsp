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
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "skrdh159");
			
			if (conn ==null ) {
				throw new Exception("데이터베이스에 연결할수 없습니다.<BR>"); // 이걸로 인해서 catch 안써도 된다.
				//throw //확인문
			}
			
			
			String command = String.format("update time_ti_travel set pwd :='%s', address1 :='%s'," +
											"email1 :='%s', email2 :='%s'," + 
											"address2 :='%s', address3 :='%s';",pwd,email1,email2,address1,address2,address3);
			
			int rowNum = pstmt.executeUpdate(command);
			if(rowNum < 1) {
				throw new Exception("데이터를 Db에 입력 X");
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
		response.sendRedirect("");
	%>

</body>
</html>