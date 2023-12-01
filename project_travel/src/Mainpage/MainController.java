package Mainpage;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainprint.MainpageDto;
import travel.travelDTO;

public class MainController extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		MainInterface maininter = null; 
		req.setCharacterEncoding("utf-8");		
		
		try {								
			maininter = MainService.instance();
			List<MainpageDto> list = maininter.mainsearch(req, res);
			RequestDispatcher dispatcher = req.getRequestDispatcher("searchresult.jsp");
		
			dispatcher.forward(req, res);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
		
}
