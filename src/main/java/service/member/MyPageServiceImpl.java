package service.member;

import java.util.HashMap;
import java.util.Map;

import dao.member.MyPageDAO;
import dao.member.MyPageDAOImpl;
import dto.member.MemberDTO;
import dto.member.MyPageDTO;
import dto.member.UserDTO;

public class MyPageServiceImpl implements MyPageService {

    private MyPageDAO dao = new MyPageDAOImpl();

    @Override
    public MyPageDTO getMyPage(String email) {

        UserDTO userDto = dao.selectUser(email);

        Map<String, Object> member = dao.selectMember(email);

        if (member == null) {
            member = new HashMap<>();
        }

        // USER 정보 보완
        if (userDto != null) {

            if (member.get("email") == null) {
                member.put("email", userDto.getEmail());
            }

            if (member.get("nickname") == null) {
                member.put("nickname", userDto.getNickname());
            }

            if (member.get("profile_image") == null) {
                member.put("profile_image", userDto.getProfileImage());
            }

            if (member.get("role") == null) {
                member.put("role", userDto.getRole());
            }
        }

        MyPageDTO dto = new MyPageDTO();

        dto.setMember(member);

        return dto;
    }

    @Override
    public void updateMyPage(UserDTO user, MemberDTO member) {

        if (user != null) {
            dao.updateUser(user);
        }

        if (member != null) {
            dao.updateMemberPlan(member);
        }
    }

    @Override
    public void updateProfile_image(UserDTO user) {
        dao.updateProfileImg(user);
    }
}