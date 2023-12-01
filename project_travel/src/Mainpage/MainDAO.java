package Mainpage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mainprint.MainpageDto;

public class MainDAO {

	static MainDAO md = new MainDAO();

	public static MainDAO instance() {
		return md;
	}

	SqlSessionFactory sqlFactory = SqlSessionFactorySearch.getSession();

	public List<MainpageDto> searchAll(HttpServletRequest req, HttpServletResponse res) throws Exception {

		List<MainpageDto> list = null;

		try {

			MainsearchDto dto = new MainsearchDto();

			dto.setSearch(req.getParameter("search"));
			dto.setCountry(req.getParameter("country"));
			dto.setDate(req.getParameter("mb_11"));

			SqlSession sqlSession = sqlFactory.openSession();// db 연결

			list = sqlSession.selectList("MainMapper.search", dto);

			sqlSession.close();// db 통신 닫기

		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}

}
