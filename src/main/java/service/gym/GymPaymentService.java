package service.gym;

import java.util.List;

import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;

public interface GymPaymentService {
	int registerMembershipAndPayment(MembershipRegistration membershipRegistration, Payment payment);
    MembershipRegistration getMembershipRegistration(int mrNum);
    Payment getPayment(int paymentNum);
    Membership getMembership(int membershipNum);
    List<Payment> selectRefundRequestList(int gymId) throws Exception;
    int countRefundRequest(int gymId) throws Exception;
    void approveRefund(int paymentNum) throws Exception;
}
