package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Membership;
import util.MyBatisSqlSessionFactory;

public class MembershipDaoImpl implements MembershipDao {
	private SqlSession sqlSession;
	
	public MembershipDaoImpl() {
		sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public List<Membership> selectMembershipByGym(int gymNum) throws Exception {
		return sqlSession.selectList("mapper.membership.selectMembershipByGym", gymNum);
	}

}
