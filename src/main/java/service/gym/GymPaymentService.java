package service.gym;

import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;

public interface GymPaymentService {
	int registerMembershipAndPayment(MembershipRegistration membershipRegistration, Payment payment);
    MembershipRegistration getMembershipRegistration(int mrNum);
    Payment getPayment(int paymentNum);
    Membership getMembership(int membershipNum);
}
