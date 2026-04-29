package dao.member;

import dto.member.ReservationDTO;
import util.DBUtil;

import java.sql.*;

public class ReservationDAOImpl implements ReservationDAO {

    /**
     * 🔥 예약 저장
     */
    @Override
    public void insert(ReservationDTO dto) {

        String sql = "INSERT INTO reservation " +
                     "(member_email, trainer_email, class_time) " +
                     "VALUES (?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dto.getMemberEmail());
            ps.setString(2, dto.getTrainerEmail());
            ps.setTimestamp(3, dto.getClassTime());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 🔥 다음 수업 조회
     */
    @Override
    public ReservationDTO getNextReservation(String memberEmail, String trainerEmail) {

        String sql = "SELECT * FROM reservation " +
                     "WHERE member_email=? AND trainer_email=? " +
                     "AND class_time > NOW() " +
                     "ORDER BY class_time ASC LIMIT 1";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, memberEmail);
            ps.setString(2, trainerEmail);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ReservationDTO dto = new ReservationDTO();

                dto.setMemberEmail(rs.getString("member_email"));
                dto.setTrainerEmail(rs.getString("trainer_email"));
                dto.setClassTime(rs.getTimestamp("class_time"));

                return dto;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}