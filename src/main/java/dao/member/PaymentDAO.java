package dao.member;

import dto.member.PaymentDTO;

public interface PaymentDAO {
    void insert(PaymentDTO dto);
    
    void updateStatus(String orderId, String status);
    
    PaymentDTO findActiveByEmail(String email);
}