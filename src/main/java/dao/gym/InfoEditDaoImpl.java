package dao.gym;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Gym;
import dto.gym.GymPeakTime;
import dto.gym.Membership;
import dto.gym.Schedule;
import util.MybatisSqlSessionFactory;

public class InfoEditDaoImpl implements InfoEditDao{

	@Override
	public Gym selectGymMypage(int gymId) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne("mapper.infoEdit.selectGymMypage", gymId);
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int updateGym(Gym gym) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int res = sqlSession.update("mapper.infoEdit.updateGym", gym);
	        sqlSession.commit();
	        return res;
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int updateGymUser(Gym gym) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int res = sqlSession.update("mapper.infoEdit.updateGymUser", gym);
	        sqlSession.commit();
	        return res;
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int updatePassword(Map<String, Object> param) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int res = sqlSession.update("mapper.infoEdit.updatePassword", param);
	        sqlSession.commit();
	        return res;
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int countEmail(String emailId) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne("mapper.infoEdit.countEmail", emailId);
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public Schedule selectSchedule(int gymId) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne("mapper.infoEdit.selectSchedule", gymId);
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int res = sqlSession.update("mapper.infoEdit.updateSchedule", schedule);
	        sqlSession.commit();
	        return res;
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public List<Membership> selectMembershipList(int gymId) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList("mapper.infoEdit.selectMembershipList", gymId);
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int updateMembership(Membership membership) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int res = sqlSession.update("mapper.infoEdit.updateMembership", membership);
	        sqlSession.commit();
	        return res;
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int insertMembership(Membership membership) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int res = sqlSession.insert("mapper.infoEdit.insertMembership", membership);
	        sqlSession.commit();
	        return res;
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int deleteMembership(int membershipNum) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int res = sqlSession.delete("mapper.infoEdit.deleteMembership", membershipNum);
	        sqlSession.commit();
	        return res;
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public List<GymPeakTime> selectPeakTimeList(int gymId) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList("mapper.infoEdit.selectPeakTimeList", gymId);
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int deletePeakTimeByGymId(int gymId) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int res = sqlSession.delete("mapper.infoEdit.deletePeakTimeByGymId", gymId);
	        sqlSession.commit();
	        return res;
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public int insertPeakTime(GymPeakTime peakTime) {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int res = sqlSession.insert("mapper.infoEdit.insertPeakTime", peakTime);
	        sqlSession.commit();
	        return res;
		}finally{
			sqlSession.close();
		}
	}
	
}
