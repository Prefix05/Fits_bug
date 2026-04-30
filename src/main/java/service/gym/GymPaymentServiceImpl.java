package service.gym;

import java.util.List;

import dao.gym.GymPaymentDao;
import dao.gym.GymPaymentDaoImpl;
import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;

public class GymPaymentServiceImpl implements GymPaymentService{
	private GymPaymentDao dao = new GymPaymentDaoImpl();

	@Override
	public int registerMembershipAndPayment(MembershipRegistration membershipRegistration, Payment payment) {
		int mrResult = dao.insertMembershipRegistration(membershipRegistration);
        payment.setMrNum(membershipRegistration.getMrNum());
        int paymentResult = dao.insertPayment(payment);
        return mrResult + paymentResult;
	}

	@Override
	public MembershipRegistration getMembershipRegistration(int mrNum) {
		return dao.selectMembershipRegistration(mrNum);
	}

	@Override
	public Payment getPayment(int paymentNum) {
		return dao.selectPayment(paymentNum);
	}

	@Override
	public Membership getMembership(int membershipNum) {
		return dao.selectMembership(membershipNum);
	}

	@Override
	public List<Payment> selectRefundRequestList(int gymId) throws Exception {
		return dao.selectRefundRequestList(gymId);
	}

	@Override
	public int countRefundRequest(int gymId) throws Exception {
		return dao.countRefundRequest(gymId);
	}

	@Override
	public void approveRefund(int paymentNum) throws Exception {
		dao.approveRefund(paymentNum);
	}

}
