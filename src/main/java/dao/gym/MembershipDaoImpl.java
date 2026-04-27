package dao.gym;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.gym.main.MembershipDao;
import dto.gym.Membership;
import util.MybatisSqlSessionFactory;

public class MembershipDaoImpl implements MembershipDao {
	private SqlSession sqlSession;
	
	public MembershipDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public List<Membership> selectMembershipByGym(int gymNum) throws Exception {
		return sqlSession.selectList("mapper.membership.selectMembershipByGym", gymNum);
	}

}
