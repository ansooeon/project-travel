package TravelInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Action;
import util.ActionForward;

public class InfoDetailAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int board_num=Integer.parseInt(request.getParameter("travel_num"));
		String page = request.getParameter("page");
		TravelInfoDetailService traveldetail = new TravelInfoDetailService();
		TravelDTO article = traveldetail.getArticle(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/travelinfodetail.jsp");
   		
   		return forward;
		
	}

}
