package Qboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javatest.SurvletDTO;

public class QboardDao {
	
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
	
	public int insert(QboardDTO dto)  {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		String sql = "insert into question_board values(?, ?, ?, ?, default)";
		
		try {
			
			connect();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getBoardnum());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public ArrayList<QboardDTO> selectOne() {
		
		ArrayList<QboardDTO> listid = new ArrayList<>(); // 여러개의 객체를 담아두기 위해서
		
		try {
			
			connect();
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from question_board ");//쿼리문 쓰기위한 명령어
			
			while(rs.next()) {
				
				QboardDTO obj = new QboardDTO();
				
				obj.setBoardnum(rs.getInt("board_num"));
				obj.setTitle(rs.getString("title"));
				obj.setWriter(rs.getString("member_id"));
				obj.setDate(rs.getString("created"));
				
				
				listid.add(obj); //arraylist에 셋팅된 한명을 더한다.
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		} finally {
			disconnect();
			
		}
		
		return listid;
		
	}

	public QboardDTO selectOneInfo(QboardDTO dto) {
		
		QboardDTO obj2 = new QboardDTO();
		
		int num = dto.getBoardnum();
		try {
			
			connect();
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from question_board where board_num =" + "'" + num +"'" +"");//쿼리문 쓰기위한 명령어
			
			if(rs.next()) {
				
				obj2.setContent(rs.getString("content"));
				obj2.setTitle(rs.getString("title"));
				obj2.setBoardnum(rs.getInt("board_num"));
				obj2.setWriter(rs.getString("member_id"));
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		} finally {
			disconnect();
			
		}
		
		return obj2;
		
	}
	
	public int updated(QboardDTO dto) {
		
		String title = dto.getTitle();
		String content = dto.getContent();
		
		int num = 0;
		try {
			
			connect();
			
			stmt = conn.createStatement();
			
			String result = String.format("update question_board set title ='%s', content = '%s'", title,content);
			
			num = stmt.executeUpdate(result);
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		} finally {
			disconnect();
			
		}
		
		return num;
	}
	
	public int deleted(QboardDTO dto) {
		
		int boardnum = dto.getBoardnum();
		
		int result = 0;
		
		try {
			
			connect();
			
			stmt = conn.createStatement();
			
			String sql = String.format("delete from question_board where board_num =%s", boardnum);
			
			result = stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			disconnect();
			
		}
		
		return result;
	}
	
}
