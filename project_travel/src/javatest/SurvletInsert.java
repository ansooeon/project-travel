package javatest;

import java.sql.*;

public class SurvletInsert {

	public int insert(SurvletDTO dto)  {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		int result = 0;
		String sql = "insert into student values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?characterEncoding=utf8", "root", "skrdh159");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPid());
			pstmt.setString(2, dto.getPpwd());
			pstmt.setString(3, dto.getPname());
			pstmt.setInt(4, dto.getPyear());
			pstmt.setString(5, dto.getPsnum());
			pstmt.setString(6, dto.getPdepart());
			pstmt.setString(7, dto.getPmobile1());
			pstmt.setString(8, dto.getPmobile2());
			pstmt.setString(9, dto.getPaddress());
			pstmt.setString(10, dto.getPemail());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
}
