package service.gym;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.gym.GymPaymentDao;
import dao.gym.GymPaymentDaoImpl;
import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;

public class GymPaymentServiceImpl implements GymPaymentService{
	private GymPaymentDao dao = new GymPaymentDaoImpl();

	@Override
	public int registerMembershipAndPayment(MembershipRegistration membershipRegistration, Payment payment) throws Exception{
		int mrResult = dao.insertMembershipRegistration(membershipRegistration);
        payment.setMrNum(membershipRegistration.getMrNum());
        int paymentResult = dao.insertPayment(payment);
        return mrResult + paymentResult;
	}

	@Override
	public MembershipRegistration getMembershipRegistration(int mrNum) throws Exception{
		return dao.selectMembershipRegistration(mrNum);
	}

	@Override
	public Payment getPayment(int paymentNum) throws Exception{
		return dao.selectPayment(paymentNum);
	}

	@Override
	public Membership getMembership(int membershipNum) throws Exception{
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
	    dao.cancelPtSessionByPayment(paymentNum);
	}

	@Override
	public List<Payment> selectCancelRequestList(int gymId, int startRow, int pageSize) throws Exception {
		 Map<String, Object> param = new HashMap<>();
		    param.put("gymId", gymId);
		    param.put("startRow", startRow);
		    param.put("pageSize", pageSize);

		    return dao.selectCancelRequestList(param);
	}

	@Override
	public int countCancelRequest(int gymId) throws Exception {
		 return dao.countCancelRequest(gymId);
	}

	@Override
	public void approveCancel(int paymentNum) throws Exception {
		dao.updateCancelApprove(paymentNum);
		dao.cancelPtSessionByPayment(paymentNum);
	}

}
