package Mainpage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MainpagePrint {
	
	Connection conn = null;
	Statement stmt = null;
	
	public void connect() { //DB 연결을 간결화 시키기우ㅟ해서 메소드를 새로하나만들어서 함수화 시킨다 
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/time_ti_travel?characterEncoding=utf8", "root", "skrdh159");
		
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}
	
	public void disconnect() { //코드를 간결화 시키기 위해서 메소드를 새로 하나만들어서 함수화 시킨다.
		
		try {
			stmt.close();
			conn.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

	public ArrayList<MainpageDto> MainpagePrint() {
		
		
		ArrayList<MainpageDto> list = new ArrayList<>();
		
		try {
			connect();
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from travel");//쿼리문 쓰기위한 명령어
			
			while(rs.next()) {
				
				MainpageDto dto = new MainpageDto();
				
				dto.setTitle(rs.getString("title"));
				dto.setTitlesub(rs.getString("titlesub"));
				dto.setImgFile(rs.getString("img"));
				dto.setCategory(rs.getInt("category"));
				
				
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			disconnect();
			
		}
		
		return list;
	}
	

}
