package cart;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;


public class CartListService {
	
public ArrayList<cartDTO> getArticleList(String userid) throws Exception{
		
	
		ArrayList<cartDTO> articleList = null;
		Connection con = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);
		articleList = cartDAO.selectList(userid);
		close(con);
		return articleList;
		
	}

}
