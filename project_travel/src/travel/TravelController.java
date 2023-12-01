package travel;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;

//일반 jsp
//자바 파일(서블릿)
//자바 파일(마이바티스 라이브러리)
//

public class TravelController extends HttpServlet {

	@Override

	// @Requestbody 어노테이션으로 받는방법
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		TravelInterFace travelinter = null;
		TravelSelectIF travelSelectIt = null;

		req.setCharacterEncoding("utf-8");

		try {

			String category = req.getParameter("category");

			// 각각의 카테고리 리스트
			if (category.equals("package")) {
				// 패키지여행의 리스트
				travelinter = TravelSurvice.instance();
				
				List<travelDTO> list = travelinter.traveldb(req, res);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("packagePage.jsp");// 데이터를 데리고 이 페이지로 이동하는 페이지 넘기는 방법
																						
				dispatcher.forward(req, res);
			} else if (category.equals("thema")) {
				// 테마여행의 리스트
				travelinter = TravelthemaSurvice.instance();
				List<travelDTO> list = travelinter.traveldb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("themaPage.jsp");																	
				dispatcher.forward(req, res);
			} else if (category.equals("free")) {
				// 자유여행의 리스트
				travelinter = TravelFreeSurvice.instance();
				List<travelDTO> list = travelinter.traveldb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("freePage.jsp");														
				dispatcher.forward(req, res);
			}
			
			if (category.equals("regionpack")) {
				// 패키지 카테고리의 지역 필터
				travelSelectIt = TravelRegionSurvice.instance();
				List<travelDTO> listSelect = travelSelectIt.travelselectdb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("ajaxjsp/pricefilter.jsp");
				dispatcher.forward(req, res);
				
			} else if (category.equals("themaregion")) {
				travelSelectIt = TravelRegionSurvice.instance();
				List<travelDTO> listSelect = travelSelectIt.travelselectdb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("ajaxjsp/pricethemafilter.jsp");
				dispatcher.forward(req, res);
				
			} else if (category.equals("freeregion")) {
				travelSelectIt = TravelRegionSurvice.instance();
				List<travelDTO> listSelect = travelSelectIt.travelselectdb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("ajaxjsp/pricefreefilter.jsp");
				dispatcher.forward(req, res);
			}

			if (category.equals("pack")) {
				// 패키지 카테고리의 가격 필터
				travelSelectIt = TravelSelectSurvice.instance();
				List<travelDTO> listSelect = travelSelectIt.travelselectdb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("ajaxjsp/pricefilter.jsp");
				dispatcher.forward(req, res);
			} else if (category.equals("ajaxthema")) {
				// 테마 카테고리의 가격 필터
				travelSelectIt = TravelSelectSurvice.instance();
				List<travelDTO> listSelect = travelSelectIt.travelselectdb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("ajaxjsp/pricethemafilter.jsp");
				dispatcher.forward(req, res);
			} else if (category.equals("ajaxfree")) {
				// 자유여행 카테고리의 가격 필터
				travelSelectIt = TravelSelectSurvice.instance();
				List<travelDTO> listSelect = travelSelectIt.travelselectdb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("ajaxjsp/pricefreefilter.jsp");
				dispatcher.forward(req, res);
			}

			if (category.equals("startpack")) {
				// 자유여행 카테고리의 날짜 필터
				travelSelectIt = TravelStartSurvice.instance();
				List<travelDTO> listSelect = travelSelectIt.travelselectdb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("ajaxjsp/pricefilter.jsp");
				dispatcher.forward(req, res);
			} else if (category.equals("stratthema")) {
				// 자유여행 카테고리의 날짜 필터
				travelSelectIt = TravelStartSurvice.instance();
				List<travelDTO> listSelect = travelSelectIt.travelselectdb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("ajaxjsp/pricethemafilter.jsp");
				dispatcher.forward(req, res);
			} else if (category.equals("startfree")) {
				// 자유여행 카테고리의 날짜 필터
				travelSelectIt = TravelStartSurvice.instance();
				List<travelDTO> listSelect = travelSelectIt.travelselectdb(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("ajaxjsp/pricefreefilter.jsp");
				dispatcher.forward(req, res);
			} 

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
