package TravelInfo;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class TravelInfoDAO {
	
	DataSource ds;
	Connection con;
	private static TravelInfoDAO travelInfoDAO;

	private TravelInfoDAO() {
	}

	public static TravelInfoDAO getInstance(){
		if(travelInfoDAO == null){
			travelInfoDAO = new TravelInfoDAO();
		}
		return travelInfoDAO;
	}

	public void setConnection(Connection con) throws ClassNotFoundException, SQLException{
		
		this.con = con;
	}	
	
	public int selectListCount(HttpServletRequest req) {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String title_list_sql="select count(*) from travelboard where title like ? ";
		String content_list_sql="select count(*) from travelboard where content like ?";

		String searchtitle = req.getParameter("searchCondition");
		String searchkeyward = req.getParameter("searchKeyword");
		
		String ListFromSearch = "N";
		
		try{
			if(searchtitle != null && searchkeyward != null) {
				ListFromSearch = "Y";
			}			
			if("Y".equals(ListFromSearch) && searchtitle.equals("TITLE")) {
				pstmt = con.prepareStatement(title_list_sql);
				pstmt.setString(1, "%"+searchkeyward+"%");				
			}else if("Y".equals(ListFromSearch) && searchtitle.equals("CONTENT")) {
				pstmt = con.prepareStatement(content_list_sql);
				pstmt.setString(1, "%"+searchkeyward+"%");				
			}else {			
				pstmt=con.prepareStatement("select count(*) from travelboard");				
			}			
			
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;
	}
	
	public ArrayList<TravelDTO> selectArticleList(int page,int limit,HttpServletRequest req){
		//페이징
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from travelboard "
				+ "order by travelboard_num desc limit ?,5";
		String title_list_sql="select * from travelboard "
				+ "where title like ? order by travelboard_num desc limit ?,5";
		String content_list_sql="select * from travelboard "
				+ "where content like ? order by travelboard_num desc limit ?,5";
		ArrayList<TravelDTO> List = new ArrayList<TravelDTO>();
		TravelDTO board = null;
		int startrow=(page-1)*5; 
		
		String searchtitle = req.getParameter("searchCondition");
		String searchkeyward = req.getParameter("searchKeyword");		
		String flagBoardListFromSearch = "N";
		try{
			if(searchtitle != null && searchkeyward != null) {
				flagBoardListFromSearch = "Y";
			}
			
			if("Y".equals(flagBoardListFromSearch) && searchtitle.equals("TITLE")) {
				pstmt = con.prepareStatement(title_list_sql);
				pstmt.setString(1, "%"+searchkeyward+"%");
				pstmt.setInt(2, startrow);
			}else if("Y".equals(flagBoardListFromSearch) && searchtitle.equals("CONTENT")) {
				pstmt = con.prepareStatement(content_list_sql);
				pstmt.setString(1, "%"+searchkeyward+"%");
				pstmt.setInt(2, startrow);
			}else {			
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setInt(1, startrow);
			}
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new TravelDTO();
				board.setTravelboard_num(rs.getInt("travelboard_num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setImg(rs.getString("img"));
				board.setMember_id(rs.getString("member_id"));
				
				List.add(board);
				
			}

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return List;

	}

	
	public int insertArticle(TravelDTO dto){		
		//글 등록
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(travelboard_num) from travelboard");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into travelboard values(?,?,?,?,now(),?,?,?)";					
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getMember_id());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());			
			pstmt.setString(5, dto.getRegion());
			pstmt.setString(6, dto.getMyplan());
			pstmt.setString(7, dto.getImg());
			insertCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	public TravelDTO selectArticle(int board_num){
		//글 상세보기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TravelDTO dto = null;

		try{
			pstmt = con.prepareStatement(
					"select * from travelboard where travelboard_num = ?");
			pstmt.setInt(1, board_num);
			rs= pstmt.executeQuery();
			
			if(rs.next()){				
				dto = new TravelDTO();
				dto.setTravelboard_num(rs.getInt("travelboard_num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setImg(rs.getString("img"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setRegion(rs.getString("region"));
				dto.setMyplan(rs.getString("myplan"));
				dto.setCreated(rs.getDate("created"));				
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return dto;

	}


}
