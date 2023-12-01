package cart;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Action;
import util.ActionForward;

public class CartdeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		int travel_num=Integer.parseInt(request.getParameter("travel_num"));
		String userid = request.getParameter("userid");
		
		CartdeleteService cartdelete = new CartdeleteService();
		boolean isDeleteSuccess = cartdelete.removeArticle(travel_num,userid);
		
		if(!isDeleteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("cartpage.ca?userid=" + userid);
		}
		
		
		return forward;
	}

}
