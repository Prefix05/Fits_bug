package dao.gym.payment;

import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;

public interface GymPaymentDao {
	int insertMembershipRegistration(MembershipRegistration membershipRegistration);
    int insertPayment(Payment payment);
    MembershipRegistration selectMembershipRegistration(int mrNum);
    Payment selectPayment(int paymentNum);
    Membership selectMembership(int membershipNum);
}
