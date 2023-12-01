package cart;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartService {
	
	public static boolean cartadd(int travel_num,String userid,HttpServletResponse response) throws Exception {
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		CartDAO cartdao = CartDAO.getInstance();
		cartdao.setConnection(con);
		
		int insertCheck = cartdao.insertCheck(travel_num,userid);
		
		if(insertCheck > 1) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니에 이미 추가 되었습니다!')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			int insertCount = cartdao.insertArticle(travel_num,userid);
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니에 추가 되었습니다!')");
			out.println("history.back();");
			out.println("</script>");
			
			if(insertCount > 0){
				commit(con);
				isWriteSuccess = true;
			}
			else{
				rollback(con);
			}
		}
		close(con);
		return isWriteSuccess;		
	}

}
