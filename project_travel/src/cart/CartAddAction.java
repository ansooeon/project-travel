package cart;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Action;
import util.ActionForward;

public class CartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int travel_num = Integer.parseInt(request.getParameter("travel_num"));
		String userid = request.getParameter("userid");
		
		ActionForward forward = new ActionForward();
		
		CartService cart = new CartService();		
		boolean isWriteSuccess = CartService.cartadd(travel_num, userid,response);

		return forward;
		
		
	}

}
