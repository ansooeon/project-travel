package Mainpage;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactorySearch {
	
	private static SqlSessionFactory sqlSession;
	public static SqlSessionFactory getSession(){
		return sqlSession;
	}

	static{
		try {
			String resource = "Mainpage/main_mybatis.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
