package service.member;

import dto.member.PaymentDTO;

public interface PaymentService {

    // 🔥 결제 생성 (READY 상태)
    PaymentDTO createPayment(PaymentDTO dto);

    // 🔥 결제 성공 처리
    void success(String orderId, String email);
}