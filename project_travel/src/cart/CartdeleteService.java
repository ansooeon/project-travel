package cart;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

public class CartdeleteService {

	public boolean removeArticle(int travel_num, String userid) throws Exception {

		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		CartDAO dao = CartDAO.getInstance();
		
		dao.setConnection(con);
		int deleteCount = dao.deleteArticle(travel_num,userid);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}

}
