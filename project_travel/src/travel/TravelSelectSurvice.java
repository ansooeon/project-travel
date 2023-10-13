package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TravelSelectSurvice implements TravelSelectIF {

	static TravelSelectSurvice tss = new TravelSelectSurvice();
	public static TravelSelectSurvice instance() {
		//singleton 팬턴
		return tss;
	}
	@Override
	public List<travelDTO> travelselectdb(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		TravelSelectDAO tsd = TravelSelectDAO.instance();
		
		List<travelDTO> listselect = tsd.travelselectAll(req,res);
		
		req.setAttribute("listselect", listselect);
		System.out.println("2");
		
		return listselect;
	}
	
	
	
}
