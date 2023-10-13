package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TravelStartDAO {
	
	//db를 직접적으로 연결
	
	static TravelStartDAO tsd = new TravelStartDAO();
	public static TravelStartDAO instance() {
		return tsd;
	}

	SqlSessionFactory sqlFactory = SqlSessionFactoryService.getSqlSession();
	public List<travelDTO> travelselectAll(HttpServletRequest req, HttpServletResponse res) {
		
		travelDTO dto = new travelDTO();
		
		dto.setStartmonth(Integer.parseInt(req.getParameter("start")));
		
		SqlSession sqlSession = sqlFactory.openSession();//db 연결
		
		List<travelDTO> list = sqlSession.selectList("TravelMapper.selectStart", dto);
		
		sqlSession.close();//db 통신 닫기
		
		return list;
		
	}
	
}
