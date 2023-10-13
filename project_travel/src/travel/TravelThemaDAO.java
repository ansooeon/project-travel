package travel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TravelThemaDAO {
	
	//db를 직접적으로 연결
	
	static TravelThemaDAO td = new TravelThemaDAO();
	public static TravelThemaDAO instance() {
		return td;
	}

	SqlSessionFactory sqlFactory = SqlSessionFactoryService.getSqlSession();
	public List<travelDTO> selectthemaAll() {
		
		SqlSession sqlSession = sqlFactory.openSession();//db 연결
		
		List<travelDTO> list = sqlSession.selectList("TravelMapper.selectthemaAll");
		
		sqlSession.close();//db 통신 닫기
		System.out.print("3");
		return list;
		
	}
	
}
