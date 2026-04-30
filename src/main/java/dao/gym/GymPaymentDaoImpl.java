package dao.gym;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Payment> selectRefundRequestList(int gymId) throws Exception {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	    try {
	        return session.selectList("mapper.payment.selectRefundRequestList", gymId);
	    } finally {
	        session.close();
	    }
	}

	@Override
	public int countRefundRequest(int gymId) throws Exception {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	    try {
	        return session.selectOne("mapper.payment.countRefundRequest", gymId);
	    } finally {
	        session.close();
	    }
	}

	@Override
	public void approveRefund(int paymentNum) throws Exception {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	    try {
	        session.update("mapper.payment.approveRefund", paymentNum);
	        session.commit();
	    } finally {
	        session.close();
	    }
	}

	@Override
	public List<Payment> selectCancelRequestList(Map<String, Object> param) throws Exception {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	    try {
	        return session.selectList("mapper.payment.selectCancelRequestList", param);
	    } finally {
	        session.close();
	    }
	}

	@Override
	public int countCancelRequest(int gymId) throws Exception {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	    try {
	        return session.selectOne("mapper.payment.countCancelRequest", gymId);
	    } finally {
	        session.close();
	    }
	}

	@Override
	public void updateCancelApprove(int paymentNum) throws Exception {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	    try {
	        session.update("mapper.payment.updateCancelApprove", paymentNum);
	        session.commit();
	    } finally {
	        session.close();
	    }
	}
	
	@Override
	public void cancelPtSessionByPayment(int paymentNum) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			session.update("mapper.payment.cancelPtSessionByPayment", paymentNum);
			session.commit();
		}finally {
			session.close();
		}
		
	}

}
