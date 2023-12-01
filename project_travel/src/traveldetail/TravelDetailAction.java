package traveldetail;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.travelDTO;
import util.Action;
import util.ActionForward;


public class TravelDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int travel_num = Integer.parseInt(request.getParameter("travel_num"));
		ActionForward forward = new ActionForward();

			TravelDetailService travelDetailService = new TravelDetailService();
			travelDTO article = travelDetailService.getArticle(travel_num);
			travelscheduleDTO schedule = travelDetailService.getSchedule(travel_num);
			ArrayList<travelDetailImgDTO> img =new ArrayList<travelDetailImgDTO>();
			img = travelDetailService.getImg(travel_num) ;
			
			request.setAttribute("article", article);
			request.setAttribute("schedule", schedule);
			request.setAttribute("img", img);
			
			forward.setPath("/traveldetail.jsp");
		
		return forward;
	}

	
}
