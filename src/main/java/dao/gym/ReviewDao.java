package dao;

import java.util.List;

import dto.Review;

public interface ReviewDao {
	List<Review> selectRecentReviewByGym(int gymId) throws Exception;
}
