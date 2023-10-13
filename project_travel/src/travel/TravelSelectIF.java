package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TravelSelectIF {
	
	List travelselectdb(HttpServletRequest req, HttpServletResponse res) throws Exception;
}
