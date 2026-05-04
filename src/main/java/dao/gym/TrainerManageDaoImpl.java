package dao.gym;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.gym.TrainerAssign;
import dto.gym.TrainerList;
import dto.gym.TrainerMemberView;
import util.MybatisSqlSessionFactory;

public class TrainerManageDaoImpl implements TrainerManageDao {

	@Override
	public List<TrainerMemberView> selectCurrentMembers(int trainerId) throws Exception{
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return session.selectList("mapper.trainerManage.selectCurrentMembers", trainerId);
		}finally {
			session.close();
		}
	}

	@Override
	public List<TrainerMemberView> selectPastMembers(int trainerId) throws Exception{
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return session.selectList("mapper.trainerManage.selectPastMembers", trainerId);
		}finally {
			session.close();
		}
	}

	@Override
	public List<TrainerList> selectTrainerList(Map<String, Object> param) throws Exception{
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return session.selectList("mapper.trainerManage.selectTrainerList", param);
		}finally {
			session.close();
		}
	}

	@Override
	public List<TrainerAssign> selectTrainerAssignList(int gymId) throws Exception{
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return session.selectList("mapper.trainerManage.selectTrainerAssignList", gymId);
		}finally {
			session.close();
		}
	}

}
