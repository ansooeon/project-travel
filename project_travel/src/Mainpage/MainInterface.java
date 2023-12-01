package Mainpage;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainprint.MainpageDto;

public interface MainInterface {
	
	List<MainpageDto> mainsearch(HttpServletRequest req, HttpServletResponse res) throws Exception;

}
