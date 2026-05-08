package service.member;

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

        MemberDTO member = dao.selectMember(email);

        if (member == null) {
            member = new MemberDTO();
        }

        // USER 정보를 member JOIN 필드에 보완 (null 방어)
        if (userDto != null) {
            if (member.getEmail() == null)      member.setEmail(userDto.getEmail());
            if (member.getNickname() == null)   member.setNickname(userDto.getNickname());
            if (member.getProfile_image() == null) member.setProfile_image(userDto.getProfileImage());
            if (member.getRole() == null)       member.setRole(userDto.getRole());
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
