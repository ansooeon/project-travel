package traveldetail;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.sql.DataSource;

import travel.travelDTO;



public class TravelDetailDAO {
	
	DataSource ds;
	Connection con;
	private static TravelDetailDAO  TravelDetailDAO;
	
	

	private TravelDetailDAO() {
	}

	public static TravelDetailDAO getInstance(){
		if(TravelDetailDAO == null){
			TravelDetailDAO = new TravelDetailDAO();
		}
		return TravelDetailDAO;
	}

	public void setConnection(Connection con) throws ClassNotFoundException, SQLException{
		
		this.con = con;
	}

	public travelDTO selectArticle(int travel_num){
		//글 상세보기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		travelDTO boardBean = null;

		try{
			pstmt = con.prepareStatement(
					"select * from travel where travel_num = ?");
			pstmt.setInt(1, travel_num);
			rs= pstmt.executeQuery();

			if(rs.next()){				
				boardBean = new travelDTO();
				boardBean.setTitle(rs.getString("title"));
				boardBean.setTitlesub(rs.getString("titlesub"));
				boardBean.setTravel_num(rs.getInt("travel_num"));
				boardBean.setAddress1(rs.getString("address1"));
				boardBean.setAddress2(rs.getString("address2"));
				boardBean.setAddress3(rs.getString("address3"));
				boardBean.setEnddate(rs.getString("endDate"));
				boardBean.setStartdate(rs.getString("StartDate"));
				boardBean.setLatitude(rs.getDouble("latitude"));
				boardBean.setLongtitude(rs.getDouble("longitude"));
				boardBean.setPrice(rs.getInt("price"));
				boardBean.setAirport(rs.getString("airport"));				
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}
	
	public travelscheduleDTO selectSchedule(int travel_num){
		//글 상세보기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		travelscheduleDTO boardBean = null;

		try{
			pstmt = con.prepareStatement(
					"select * from travel_schedule where travel_num = ?");
			pstmt.setInt(1, travel_num);
			rs= pstmt.executeQuery();

			if(rs.next()){				
				boardBean = new travelscheduleDTO();
				boardBean.setTitle(rs.getString("title"));
				boardBean.setSchedule_num(rs.getInt("schedule_num"));
				boardBean.setTravel_num(rs.getInt("travel_num"));
				boardBean.setContent(rs.getString("content"));
				boardBean.setDay(rs.getDate("day"));
								
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return boardBean;
		
	}
	
	public ArrayList<travelDetailImgDTO> selectImg(int travel_num){
		//글 상세보기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		travelDetailImgDTO boardBean = null;
		
		ArrayList<travelDetailImgDTO> arrayList = new ArrayList<travelDetailImgDTO>();

		try{
			pstmt = con.prepareStatement(
					"select * from traveldetail_img where travel_num = ?");
			pstmt.setInt(1, travel_num);
			rs= pstmt.executeQuery();

			while(rs.next()){				
				boardBean = new travelDetailImgDTO();
				boardBean.setTravel_num(rs.getInt("travel_num"));
				boardBean.setImg(rs.getString("img"));
				arrayList.add(boardBean);
								
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return arrayList;
		
	}
}
