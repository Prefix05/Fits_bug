package dao.member;

import java.util.List;

import dto.member.GymDTO;

public interface GymDAO {
    List<GymDTO> getGymList(String keyword, String category, String sort, Double lat, Double lng);
}