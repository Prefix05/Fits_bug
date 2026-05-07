package service.member;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import dao.gym.GymMainDao;
import dao.gym.GymMainDaoImpl;
import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dao.member.UserDAO;
import dao.member.UserDAOImpl;
import dao.trainer.TrainerDAO;
import dao.trainer.TrainerDAOImpl;
import dto.gym.Gym;
import dto.member.MemberDTO;
import dto.member.UserDTO;
import dto.trainer.TrainerDTO;
import util.MybatisSqlSessionFactory;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO = new UserDAOImpl();
    private GymMainDao gymMainDAO = new GymMainDaoImpl();
    private MemberDAO memberDAO = new MemberDAOImpl();
    private TrainerDAO trainerDAO = new TrainerDAOImpl();

    @Override
    public int register(UserDTO dto) {
        if (userDAO.isEmailExists(dto.getEmail())) return 0;
        
        // 기본 역할 설정
        if (dto.getRole() == null || dto.getRole().isEmpty()) {
            dto.setRole("MEMBER");
        }
        return userDAO.insert(dto);
    }

    @Override
    public int registerSocial(UserDTO dto) {
        if (userDAO.findByEmail(dto.getEmail()) != null) return 0;
        dto.setRole("MEMBER");
        return userDAO.insertSocial(dto);
    }

    @Override
    public UserDTO login(String email, String password) throws Exception {
        // 1. 이메일과 비밀번호로 사용자 조회
        UserDTO user = userDAO.findByEmailAndPassword(email, password);
        
        // 2. 사용자가 존재하고 삭제되지 않은 상태인지 확인 (is_deleted 필드에 맞춰 수정)
        if (user != null && !user.isIs_deleted()) {
            String role = user.getRole();
            
            // 3. 역할(Role)에 따라 각 테이블의 고유 ID(PK)를 가져와 otherId에 저장
            if ("GYM".equals(role)) {
                Gym gym = gymMainDAO.selectGymByUserId(user.getId());
                if (gym != null) user.setOtherId(gym.getId());
                
            } else if ("MEMBER".equals(role)) {
                MemberDTO member = memberDAO.selectMemberByUserId(user.getId());
                if (member != null) user.setOtherId(member.getId());
                
            } else if ("TRAINER".equals(role)) {
                try (SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
                    TrainerDTO trainer = trainerDAO.findByUserId(session, user.getId());
                    if (trainer != null) user.setOtherId(trainer.getTrainerId());
                }
            }
            return user;
        }
        return null;
    }

    @Override
    public boolean isEmailExists(String email) {
        if (email == null || email.trim().isEmpty()) return false;
        return userDAO.isEmailExists(email);
    }

    @Override
    public UserDTO findByEmail(String email) { 
        return userDAO.findByEmail(email); 
    }

    @Override
    public List<UserDTO> findAll() { 
        return userDAO.findAll(); 
    }

    @Override
    public int update(UserDTO dto) { 
        return userDAO.update(dto); 
    }

    @Override
    public int updatePassword(String email, String password) {
        return userDAO.updatePassword(email, password);
    }

    @Override
    public int delete(int id) { 
        return userDAO.delete(id); 
    }
}