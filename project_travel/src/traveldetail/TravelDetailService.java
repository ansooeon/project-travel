package traveldetail;

import java.sql.Connection;
import java.util.ArrayList;

import travel.travelDTO;
import static db.JdbcUtil.*;

public class TravelDetailService {

	public travelDTO getArticle(int travel_num) throws Exception {

		travelDTO article = null;
		
		Connection con = getConnection();

		TravelDetailDAO traveldao = TravelDetailDAO.getInstance();
		traveldao.setConnection(con);

		article = traveldao.selectArticle(travel_num);
		close(con);
			
		return article;
	}
	
	public travelscheduleDTO getSchedule(int travel_num) throws Exception {

		travelscheduleDTO article = null;
		
		Connection con = getConnection();

		TravelDetailDAO traveldao = TravelDetailDAO.getInstance();
		traveldao.setConnection(con);

		article = traveldao.selectSchedule(travel_num);
		close(con);
			
		return article;
	}

	public ArrayList<travelDetailImgDTO> getImg(int travel_num) throws Exception {

		ArrayList<travelDetailImgDTO> article = null;
		
		Connection con = getConnection();

		TravelDetailDAO traveldao = TravelDetailDAO.getInstance();
		traveldao.setConnection(con);

		article = traveldao.selectImg(travel_num);
		close(con);
			
		return article;
	}	
	
}
