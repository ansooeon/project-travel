package TravelInfo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Action;
import util.ActionForward;

@WebServlet("*.ti")
public class TravelinfoController extends HttpServlet {

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/infowrtieForm.ti")){
			forward=new ActionForward();
			forward.setPath("/travelinfowrite.jsp");
		}else if (command.equals("/infowrite.ti")) {
			action = new InfoWriteAction();
			try {
				forward = action.execute(req, resp);

			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/travelinfoList.ti")){			
			action = new InfoListAction();
			try{
				forward=action.execute(req, resp);
			}catch(Exception e){
				System.out.println(e);
			}
		}else if(command.equals("/travelinfodetail.ti")) {		
			
			action = new InfoDetailAction();			
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				resp.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	} 	
	
}
