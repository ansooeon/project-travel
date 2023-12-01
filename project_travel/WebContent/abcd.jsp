<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
		String DB_URL = "jdbc:mysql://3.37.127.155:3306/time_ti_travel";
		String DB_USER = "test5";
		String DB_PASSWORD = "skrdh159";

		ResultSet rs = null;
		Connection conn;
		Statement stmt;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			stmt = conn.createStatement();
			out.println("MySQL Connection Success!");			
		}
		catch (Exception e) {
			out.println(e);
			System.out.println(e);
		}
	%>
</body>
</html>

