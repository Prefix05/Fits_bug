package dao.gym.payment;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;
import util.MybatisSqlSessionFactory;

public class GymPaymentDaoImpl implements GymPaymentDao {

	@Override
	public int insertMembershipRegistration(MembershipRegistration membershipRegistration) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int result =  session.insert("mapper.payment.insertMembershipRegistration", membershipRegistration);
			session.commit();
			return result;
		}finally {
			session.close();
		}
	}

	@Override
	public int insertPayment(Payment payment) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			int result = session.insert("mapper.payment.insertPayment", payment);
			session.commit();
			return result;
		}finally {
			session.close();
		}
	}

	@Override
	public MembershipRegistration selectMembershipRegistration(int mrNum) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return session.selectOne("mapper.payment.selectMembershipRegistration", mrNum);
		}finally {
			session.close();
		}
	}

	@Override
	public Payment selectPayment(int paymentNum) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return session.selectOne("mapper.payment.selectPayment", paymentNum);
		}finally {
			session.close();
		}
	}

	@Override
	public Membership selectMembership(int membershipNum) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	    try {
	        return session.selectOne("mapper.payment.selectMembership", membershipNum);
	    } finally {
	        session.close();
	    }
	}

}
