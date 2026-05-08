package service.gym;

public interface GymTossCancelService {
	boolean cancelPayment(String paymentKey, String cancelReason) throws Exception;
}
