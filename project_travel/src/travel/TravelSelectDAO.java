package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TravelSelectDAO {
	
	//db를 직접적으로 연결
	
	static TravelSelectDAO tsd = new TravelSelectDAO();
	public static TravelSelectDAO instance() {
		return tsd;
	}

	SqlSessionFactory sqlFactory = SqlSessionFactoryService.getSqlSession();
	public List<travelDTO> travelselectAll(HttpServletRequest req, HttpServletResponse res) {
		
		travelDTO dto = new travelDTO();
		
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		
		SqlSession sqlSession = sqlFactory.openSession();//db 연결
		
		List<travelDTO> list = sqlSession.selectList("TravelMapper.selectInfo", dto);
		
		sqlSession.close();//db 통신 닫기
		
		return list;
		
	}
	
}
