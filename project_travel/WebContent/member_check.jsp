<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");//한글화

Connection conn = null;

Statement stmt = null;

String id =request.getParameter("userId");
System.out.print(id);

int result;

try {
	Class.forName("com.mysql.jdbc.Driver");
	
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/time_ti_travel", "root", "skrdh159");
	if (conn ==null ) {
		throw new Exception("데이터베이스에 연결할수 없습니다.<BR>");
		//throw //확인문
	}
	
	stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from member where member_id = " + "'" + id + "'" +";");//쿼리문 쓰기위한 명령어
	
	
	if(rs.next() == true) {
		result = 0;
		
	} else {
		result = 1;
		
	}
	
	System.out.print(result);
}finally {
	try {
		stmt.close();
	} catch (Exception ignored) {
		
	} 
	try {
		conn.close();
	} catch (Exception ignored) {
		
	}
}

out.print(result);
%>
