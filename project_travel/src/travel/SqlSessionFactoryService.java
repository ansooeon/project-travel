package travel;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryService {
	
	private static SqlSessionFactory sqlSession;
	public static SqlSessionFactory getSqlSession(){
		return sqlSession;
	}

	static{
		try {
			String resource = "/travel/travel_mybatis.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
		} catch (Exception e) {
			
		}
	}
	
}
