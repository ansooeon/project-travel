package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TravelthemaSurvice implements TravelInterFace {
	
	static TravelthemaSurvice ts = new TravelthemaSurvice();
	public static TravelthemaSurvice instance() {
		//singleton 팬턴
		return ts;
	}

	@Override
	public List<travelDTO> traveldb(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		TravelThemaDAO td = TravelThemaDAO.instance();// TeavelDAO 에서 메소드를 불러왔다.
		
		List<travelDTO> list = td.selectthemaAll();
		
		req.setAttribute("list", list);
		System.out.print("2");
		return list;
	}

}
