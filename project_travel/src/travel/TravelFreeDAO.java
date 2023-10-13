package travel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TravelFreeDAO {
	
	//db를 직접적으로 연결
	
	static TravelFreeDAO td = new TravelFreeDAO();
	public static TravelFreeDAO instance() {
		return td;
	}

	SqlSessionFactory sqlFactory = SqlSessionFactoryService.getSqlSession();
	public List<travelDTO> selectfreeAll() {
		
		SqlSession sqlSession = sqlFactory.openSession();//db 연결
		
		List<travelDTO> list = sqlSession.selectList("TravelMapper.selectfreeAll");
		
		sqlSession.close();//db 통신 닫기
		System.out.print("3");
		return list;
		
	}
	
}
