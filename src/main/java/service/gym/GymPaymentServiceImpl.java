package service.gym;

import dao.gym.GymPaymentDao;
import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;

public class GymPaymentServiceImpl implements GymPaymentService{
	private GymPaymentDao dao;

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

}
