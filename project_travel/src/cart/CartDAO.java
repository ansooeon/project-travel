package cart;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.mysql.jdbc.Statement;

public class CartDAO {
	
	DataSource ds;
	Connection con;
	private static CartDAO boardDAO;

	private CartDAO() {
	}

	public static CartDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new CartDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con) throws ClassNotFoundException, SQLException{
		
		this.con = con;
	}
	
	public int insertCheck(int travel_num,String userid) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt= con.prepareStatement("select * from cart where travel_num = ? and member_id = ?");
			pstmt.setInt(1, travel_num);
			pstmt.setString(2, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next() == true) {
				result = 2; //중복
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}	
	
	public int insertArticle(int travel_num,String userid){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount=0;
		
		try {			
			pstmt=con.prepareStatement("insert into cart values(?,?,0)");
			pstmt.setInt(1, travel_num);
			pstmt.setString(2, userid);
			insertCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return insertCount;
	}
	
	public ArrayList<cartDTO> selectList(String userid) {
		
		ArrayList<cartDTO> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		cartDTO dto = null;
		
		try {			
			pstmt = con.prepareStatement(
					"select a.travel_num,a.member_id, " +
					"b.title,b.titlesub,b.StartDate,b.endDate,b.price,b.img " + 
					"from cart as a" + 
					"join travel as b on a.travel_num = b.travel_num " + 
					"where member_id =?");
			
			pstmt.setString(1, userid);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {				
				dto = new cartDTO();
				dto.setTitle(rs.getString("title"));
				dto.setTitlesub(rs.getString("titlesub"));
				dto.setStartdate(rs.getString("Startdate"));
				dto.setEnddate(rs.getString("endDate"));
				dto.setPrice(rs.getInt("price"));
				dto.setImg(rs.getString("img"));
				dto.setTravelNum(rs.getInt("travel_num"));				
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
		
	}

	public int deleteArticle(int travel_num, String userid) {

		PreparedStatement pstmt = null;
		String delete_sql="delete from cart where travel_num=? and member_id = ?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(delete_sql);
			pstmt.setInt(1, travel_num);
			pstmt.setString(2, userid);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
		}	finally{
			close(pstmt);
		}

		return deleteCount;
	}

	
}
