package TravelInfo;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

public class TravelInfoDetailService {
	
	public TravelDTO getArticle(int board_num) throws Exception{

		
		TravelDTO article = null;
		Connection con = getConnection();
		TravelInfoDAO traveldao = TravelInfoDAO.getInstance();
		traveldao.setConnection(con);
		
		article = traveldao.selectArticle(board_num);
		
		close(con);
		
		return article;
		
	}

}
