package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TravelFreeSurvice implements TravelInterFace {
	
	static TravelFreeSurvice ts = new TravelFreeSurvice();
	public static TravelFreeSurvice instance() {
		//singleton 팬턴
		return ts;
	}

	@Override
	public List<travelDTO> traveldb(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		TravelFreeDAO td = TravelFreeDAO.instance();// TeavelDAO 에서 메소드를 불러왔다.
		
		List<travelDTO> list = td.selectfreeAll();
		
		req.setAttribute("list", list);
		System.out.print("2");
		return list;
	}

}
