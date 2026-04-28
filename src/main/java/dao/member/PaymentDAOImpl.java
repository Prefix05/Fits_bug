package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dto.member.PaymentDTO;
import util.DBUtil;

public class PaymentDAOImpl implements PaymentDAO {

    @Override
    public void insert(PaymentDTO dto) {

        String sql = "INSERT INTO payment(order_id, email, amount, product_name, status) VALUES(?,?,?,?,?)";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, dto.getOrderId());
            ps.setString(2, dto.getEmail());
            ps.setInt(3, dto.getAmount());
            ps.setString(4, dto.getProductName());
            ps.setString(5, dto.getStatus());

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateStatus(String orderId, String status) {

        String sql = "UPDATE payment SET status=? WHERE order_id=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, status);
            ps.setString(2, orderId);

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}