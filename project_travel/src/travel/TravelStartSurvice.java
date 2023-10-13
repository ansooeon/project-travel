package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TravelStartSurvice implements TravelSelectIF {

	static TravelStartSurvice tss = new TravelStartSurvice();
	public static TravelStartSurvice instance() {
		//singleton 팬턴
		return tss;
	}
	@Override
	public List<travelDTO> travelselectdb(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		TravelStartDAO tsd = TravelStartDAO.instance();
		
		List<travelDTO> listselect = tsd.travelselectAll(req,res);
		
		req.setAttribute("listselect", listselect);
		System.out.println("2");
		
		return listselect;
	}
	
	
	
}
