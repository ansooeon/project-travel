package TravelInfo;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Action;
import util.ActionForward;
import util.PageInfo;



public class InfoListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward= new ActionForward();
		
		try {
			ArrayList<TravelDTO> articleList=new ArrayList<TravelDTO>();
			
		  	int page=1;
			int limit=5;
			
			if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			InfoListService listService = new InfoListService();  
			int listCount=listService.getListCount(request);
			articleList = listService.getArticleList(page,limit,request);
	   		int maxPage=(int)((double)listCount/limit+0.95); 
	   		int startPage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;
	   	    int endPage = startPage+5-1;
	   	    
	   	    if (endPage> maxPage) endPage= maxPage;
	   	    
	   		PageInfo pageInfo = new PageInfo();
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("articleList", articleList);
			
	   		forward.setPath("/travelinfo.jsp");
	   		
	   		
		} catch (Exception e) {
			System.out.println(e);
		}
		return forward;	
		
	}

}
