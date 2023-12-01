package Mainpage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainprint.MainpageDto;

public class MainService implements MainInterface {

	static MainService ms = new MainService();

	public static MainService instance() {
		// singleton 팬턴
		return ms;
	}

	@Override
	public List<MainpageDto> mainsearch(HttpServletRequest req, HttpServletResponse res) throws Exception {

		MainDAO md = MainDAO.instance();

		List<MainpageDto> list = md.searchAll(req, res);

		req.setAttribute("searchlist", list);

		return list;
	}

}
