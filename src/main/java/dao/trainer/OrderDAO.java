package dao.trainer;

import dto.trainer.OrderDTO;

public interface OrderDAO {
    OrderDTO findByOrderId(String orderId);
    void insertOrder(OrderDTO order);
    void updateStatus(String orderId, String status);
}
