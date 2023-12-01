package cart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Action;
import util.ActionForward;


@WebServlet("*.ca")
public class CartController extends javax.servlet.http.HttpServlet {

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;

		String id = req.getParameter("userid");
		
		if (command.equals("/cartadd.ca")) {
			action = new CartAddAction();
			try {
				forward = action.execute(req, resp);

			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (command.equals("/cartpage.ca")) {
			
			action = new CartListAction();
			
			try {
				forward = action.execute(req, resp);

			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (command.equals("/cartdelete.ca")) {
			
			action = new CartdeleteAction();
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

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}	
	
}
