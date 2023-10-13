package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TravelInterFace {
	
	List traveldb(HttpServletRequest req, HttpServletResponse res) throws Exception;
}
