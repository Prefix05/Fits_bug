package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Review;
import util.MyBatisSqlSessionFactory;

public class ReviewDaoImpl implements ReviewDao {
	private SqlSession sqlSession;
	
	public ReviewDaoImpl() {
		sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public List<Review> selectRecentReviewByGym(int gymId) throws Exception {
		return sqlSession.selectList("mapper.review.selectRecentReviewByGym", gymId);
	}
	
}
