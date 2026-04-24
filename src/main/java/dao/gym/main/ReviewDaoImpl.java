package dao.gym.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Review;
import util.MybatisSqlSessionFactory;

public class ReviewDaoImpl implements ReviewDao {

	@Override
	public List<Review> selectRecentReviewByGym(int gymId) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList("mapper.review.selectRecentReviewByGym", gymId);
		}finally{
			sqlSession.close();
		}
	}
	
}
