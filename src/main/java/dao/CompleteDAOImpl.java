package dao;

import java.sql.*;
import java.util.*;

import util.DBUtil;

public class CompleteDAOImpl implements CompleteDAO {

    Connection conn;

    public CompleteDAOImpl() {
        conn = DBUtil.getConnection();
    }

    // 오늘 기록 저장
    @Override
    public void insertLog(String userId) {

        String sql = "INSERT INTO complete_log(user_id, workout_date) VALUES (?, NOW())";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userId);
            ps.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    // 이번주 기록
    @Override
    public List<String> getWeekLog(String userId) {

        List<String> list = new ArrayList<>();

        String sql = "SELECT DATE_FORMAT(workout_date, '%a') d FROM complete_log " +
                     "WHERE user_id=? AND YEARWEEK(workout_date)=YEARWEEK(NOW())";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                list.add(rs.getString("d")); // Mon Tue ...
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    // 연속일 계산 (간단버전)
    @Override
    public int getStreak(String userId) {

        int count = 0;

        String sql = "SELECT COUNT(*) FROM complete_log WHERE user_id=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userId);

            ResultSet rs = ps.executeQuery();
            if(rs.next()) count = rs.getInt(1);

        } catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

    // 최고 기록
    @Override
    public int getBestStreak(String userId) {
        return getStreak(userId); // 간단 버전
    }
}