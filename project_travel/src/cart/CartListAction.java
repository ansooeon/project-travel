package cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Action;
import util.ActionForward;


public class CartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String userid = request.getParameter("userid");
		// TODO Auto-generated method stub
		CartListService listservice = new CartListService();
		ActionForward forward= new ActionForward();
		
		ArrayList<cartDTO> articleList=new ArrayList<cartDTO>();
		articleList = listservice.getArticleList(userid);
		
		request.setAttribute("cartlist", articleList);
		
		forward.setPath("/cart.jsp");
   		return forward;
		
	}

}
