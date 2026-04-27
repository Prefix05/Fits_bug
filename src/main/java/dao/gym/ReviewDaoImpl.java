package dao.gym;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.gym.main.ReviewDao;
import dto.gym.Review;
import util.MybatisSqlSessionFactory;

public class ReviewDaoImpl implements ReviewDao {
	private SqlSession sqlSession;
	
	public ReviewDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public List<Review> selectRecentReviewByGym(int gymId) throws Exception {
		return sqlSession.selectList("mapper.review.selectRecentReviewByGym", gymId);
	}
	
}
