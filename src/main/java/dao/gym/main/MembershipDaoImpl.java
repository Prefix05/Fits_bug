package dao.gym.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Membership;
import util.MybatisSqlSessionFactory;

public class MembershipDaoImpl implements MembershipDao {
	
	@Override
	public List<Membership> selectMembershipByGym(int gymNum) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList("mapper.membership.selectMembershipByGym", gymNum);
		}finally{
			sqlSession.close();
		}
	}

}
