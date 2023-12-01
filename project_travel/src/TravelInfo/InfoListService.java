package TravelInfo;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;



public class InfoListService {
	
	public int getListCount(HttpServletRequest req) throws Exception{
		
		int listCount = 0;
		try {
			
			Connection con = getConnection();
			TravelInfoDAO infoDAO = TravelInfoDAO.getInstance();
			infoDAO.setConnection(con);
			listCount = infoDAO.selectListCount(req);
			close(con);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return listCount;
	}

	public ArrayList<TravelDTO> getArticleList(int page, int limit,HttpServletRequest req) throws Exception{
		
		ArrayList<TravelDTO> articleList = null;
		try {
			
			Connection con = getConnection();
			TravelInfoDAO infoDAO = TravelInfoDAO.getInstance();
			infoDAO.setConnection(con);
			articleList = infoDAO.selectArticleList(page,limit,req);
			close(con);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return articleList;
	}

}
