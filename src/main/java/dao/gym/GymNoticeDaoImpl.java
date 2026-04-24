package dao.gym;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.gym.GymNotice;
import util.MybatisSqlSessionFactory;

public class GymNoticeDaoImpl implements GymNoticeDao {
	private SqlSession sqlSession;
	
	public GymNoticeDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public List<GymNotice> selectRecentNoticeByGym(int gymId) throws Exception {
		return sqlSession.selectList("mapper.notice.selectRecentNoticeByGym", gymId);
	}

}
