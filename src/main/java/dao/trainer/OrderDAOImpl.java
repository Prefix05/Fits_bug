package dao.trainer;

import dto.trainer.OrderDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public OrderDTO findByOrderId(String orderId) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            return session.selectOne("order.findByOrderId", orderId);
        }
    }

    @Override
    public void insertOrder(OrderDTO order) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            session.insert("order.insertOrder", order);
            session.commit();
        }
    }

    @Override
    public void updateStatus(String orderId, String status) {
        try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            OrderDTO param = new OrderDTO();
            param.setOrderId(orderId);
            param.setStatus(status);

            session.update("order.updateStatus", param);
            session.commit();
        }
    }
}