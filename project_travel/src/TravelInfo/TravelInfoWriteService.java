package TravelInfo;

import static db.JdbcUtil.*;

import java.sql.Connection;

public class TravelInfoWriteService {

	public boolean registArticle(TravelDTO dto) throws Exception {
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		TravelInfoDAO dao = TravelInfoDAO.getInstance();
		dao.setConnection(con);
		int insertCount = dao.insertArticle(dto);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		
		return isWriteSuccess;
		
	}
	
}
