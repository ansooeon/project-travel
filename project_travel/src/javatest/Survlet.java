package javatest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;



public class Survlet {
	
	Connection conn = null;
	Statement stmt = null;
	
	public void connect() { //DB 연결을 간결화 시키기우ㅟ해서 메소드를 새로하나만들어서 함수화 시킨다 
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?characterEncoding=utf8", "root", "skrdh159");
		
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
	
	public ArrayList<SurvletDTO> selectAll() {
		
		ArrayList<SurvletDTO> list = new ArrayList<>(); // 여러개의 객체를 담아두기 위해서
		
		try {
			
			connect();
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from student");//쿼리문 쓰기위한 명령어
			
			while(rs.next()) {
				
				SurvletDTO obj = new SurvletDTO();
				
				obj.setPid(rs.getString("id"));
				obj.setPpwd(rs.getString("passwd"));
				obj.setPname(rs.getString("name"));
				obj.setPyear(rs.getInt("year"));
				obj.setPsnum(rs.getString("snum"));
				obj.setPdepart(rs.getString("depart"));
				obj.setPmobile1(rs.getString("mobile1"));
				obj.setPmobile2(rs.getString("mobile2"));
				obj.setPaddress(rs.getString("address"));
				obj.setPemail(rs.getString("email"));
				
				list.add(obj); //arraylist에 셋팅된 한명을 더한다.
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		} finally {
			disconnect();
			
		}
		
		return list;
		
	}
	
	public int insert(SurvletDTO dto)  {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		String sql = "insert into student values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
			connect();
			
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
	
	public ArrayList<SurvletDTO> selectOne() {
		
		ArrayList<SurvletDTO> listid = new ArrayList<>(); // 여러개의 객체를 담아두기 위해서
		
		try {
			
			connect();
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select id from student ");//쿼리문 쓰기위한 명령어
			
			while(rs.next()) {
				
				SurvletDTO obj = new SurvletDTO();
				
				obj.setPid(rs.getString("id"));
				
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
	
	public SurvletDTO selectOneInfo(SurvletDTO dto) {
		
		SurvletDTO obj2 = new SurvletDTO();
		
		String id = dto.getPid();
		try {
			
			connect();
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from student where Id =" + "'" + id +"'" +"");//쿼리문 쓰기위한 명령어
			
			if(rs.next()) {
				
				obj2.setPid(rs.getString("id"));
				obj2.setPpwd(rs.getString("passwd"));
				obj2.setPname(rs.getString("name"));
				obj2.setPyear(rs.getInt("year"));
				obj2.setPsnum(rs.getString("snum"));
				obj2.setPdepart(rs.getString("depart"));
				obj2.setPmobile1(rs.getString("mobile1"));
				obj2.setPmobile2(rs.getString("mobile2"));
				obj2.setPaddress(rs.getString("address"));
				obj2.setPemail(rs.getString("email"));
			
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		} finally {
			disconnect();
			
		}
		
		return obj2;
		
	}
	
	public int updated(SurvletDTO dto) {
		
		String pwd = dto.getPpwd();
		
		int num = 0;
		try {
			
			connect();
			
			stmt = conn.createStatement();
			
			String result = String.format("update student set passwd :='%s';", pwd);
			
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
}
