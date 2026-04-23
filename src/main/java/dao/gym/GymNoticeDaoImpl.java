package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.GymNotice;
import util.MyBatisSqlSessionFactory;

public class GymNoticeDaoImpl implements GymNoticeDao {
	private SqlSession sqlSession;
	
	public GymNoticeDaoImpl() {
		sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public List<GymNotice> selectRecentNoticeByGym(int gymId) throws Exception {
		return sqlSession.selectList("mapper.notice.selectRecentNoticeByGym", gymId);
	}

}
