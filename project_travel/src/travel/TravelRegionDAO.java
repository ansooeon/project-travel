package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TravelRegionDAO {
	
	//db를 직접적으로 연결
	
	static TravelRegionDAO tsd = new TravelRegionDAO();
	public static TravelRegionDAO instance() {
		return tsd;
	}

	SqlSessionFactory sqlFactory = SqlSessionFactoryService.getSqlSession();
	public List<travelDTO> travelselectAll(HttpServletRequest req, HttpServletResponse res) {
		
		travelDTO dto = new travelDTO();
		
		dto.setAddress1(req.getParameter("region"));
		
		SqlSession sqlSession = sqlFactory.openSession();//db 연결
		
		List<travelDTO> list = sqlSession.selectList("TravelMapper.selectRegion", dto);
		
		sqlSession.close();//db 통신 닫기
		
		return list;
		
	}
	
}
