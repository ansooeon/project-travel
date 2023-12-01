package TravelInfo;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import util.Action;
import util.ActionForward;

public class InfoWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward=null;
		TravelDTO dto = null;
		String realFolder="";
		String saveFolder="/img";
		int fileSize=10*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		dto = new TravelDTO();
		dto.setMember_id(multi.getParameter("member_id"));
		dto.setTitle(multi.getParameter("title"));
		dto.setRegion(multi.getParameter("region"));
		dto.setContent(multi.getParameter("content"));
		dto.setMyplan(multi.getParameter("myplan"));
		dto.setImg(
				multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
	
		TravelInfoWriteService  writeService = new TravelInfoWriteService();
		boolean isWriteSuccess = writeService.registArticle(dto);
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력 실패!')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("travelinfoList.ti");
		}

		return forward;		
	
	}

}
