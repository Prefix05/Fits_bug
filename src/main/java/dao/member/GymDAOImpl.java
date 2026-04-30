package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.GymDTO;
import util.DBUtil;

public class GymDAOImpl implements GymDAO {
    @Override
    public List<GymDTO> getGymList(String keyword, String category, String sort, Double lat, Double lng) {

        List<GymDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM gym WHERE name LIKE ? ";

        if (!"전체".equals(category)) {
            sql += "AND specialty = ? ";
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");

            if (!"전체".equals(category)) {
                ps.setString(2, category);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                GymDTO g = new GymDTO();
                g.setGymId(rs.getInt("gym_id"));
                g.setName(rs.getString("name"));
                g.setAddress(rs.getString("address"));
                g.setImage(rs.getString("image"));
                g.setSpecialty(rs.getString("specialty"));
                g.setRating(rs.getDouble("rating"));
                g.setPrice(rs.getInt("price"));
                g.setLatitude(rs.getDouble("lat"));
                g.setLongitude(rs.getDouble("lng"));

                // 거리 계산
                if (lat != null && lng != null) {
                    double dist = distance(lat, lng, g.getLatitude(), g.getLongitude());
                    g.setDistance(dist);
                } else {
                    g.setDistance(0);
                }

                // 추천 점수 (조회수/최근성 제외 버전)
                double score = g.getRating() * 2 - (g.getPrice() / 100000.0);
                g.setScore(score);

                list.add(g);
            }

            // 정렬
            if ("distance".equals(sort)) {
                list.sort((a, b) -> Double.compare(a.getDistance(), b.getDistance()));
            } else if ("rating".equals(sort)) {
                list.sort((a, b) -> Double.compare(b.getRating(), a.getRating()));
            } else {
                list.sort((a, b) -> Double.compare(b.getScore(), a.getScore()));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Haversine 거리 계산
    private double distance(double lat1, double lon1, double lat2, double lon2) {
        double R = 6371;
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);

        double a = Math.sin(dLat/2) * Math.sin(dLat/2)
                + Math.cos(Math.toRadians(lat1))
                * Math.cos(Math.toRadians(lat2))
                * Math.sin(dLon/2) * Math.sin(dLon/2);

        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        return R * c;
    }
}