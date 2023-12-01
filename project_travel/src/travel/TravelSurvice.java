package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TravelSurvice implements TravelInterFace {
	
	static TravelSurvice ts = new TravelSurvice();
	public static TravelSurvice instance() {
		//singleton 팬턴
		return ts;
	}

	@Override
	public List<travelDTO> traveldb(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		TravelDAO td = TravelDAO.instance();// TeavelDAO 에서 메소드를 불러왔다.
		
		List<travelDTO> list = td.selectpackageAll();
		
		req.setAttribute("list", list);
		
		return list;
	}

}
