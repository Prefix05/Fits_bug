package dao.gym;

import java.util.List;

import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;

public interface GymPaymentDao {
	int insertMembershipRegistration(MembershipRegistration membershipRegistration);
    int insertPayment(Payment payment);
    MembershipRegistration selectMembershipRegistration(int mrNum);
    Payment selectPayment(int paymentNum);
    Membership selectMembership(int membershipNum);
    List<Payment> selectRefundRequestList(int gymId) throws Exception;
    int countRefundRequest(int gymId) throws Exception;
    void approveRefund(int paymentNum) throws Exception;
}
