package service.member;

import java.util.List;

import dao.member.GymDAO;
import dao.member.GymDAOImpl;
import dto.member.GymDTO;

public class GymServiceImpl implements GymService {
    private GymDAO dao = new GymDAOImpl();

    @Override
    public List<GymDTO> getGymList(String keyword, String category, String sort, Double lat, Double lng) {
        return dao.getGymList(keyword, category, sort, lat, lng);
    }
}