package service.member;

import java.util.List;

import dao.gym.GymMainDao;
import dao.gym.GymMainDaoImpl;
import dao.member.UserDAO;
import dao.member.UserDAOImpl;
import dto.gym.Gym;
import dto.member.UserDTO;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO = new UserDAOImpl();
    private GymMainDao gymMainDAO = new GymMainDaoImpl();

    @Override
    public int register(UserDTO dto) {
        if (userDAO.isEmailExists(dto.getEmail())) return 0;
        if (dto.getRole() == null || dto.getRole().isEmpty()) dto.setRole("MEMBER");
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
        UserDTO user = userDAO.findByEmailAndPassword(email, password);
        if (user != null && !user.isDeleted()) {
        	String role = user.getRole();
        	if(role.equals("GYM")) {
        		Gym gym = gymMainDAO.selectGymByUserId(user.getId());
        		user.setOtherId(gym.getId()); // gymId  userDTO에 추가
        	} else if (role.equals("MEMBER")) {
        		
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
    public UserDTO findByEmail(String email) { return userDAO.findByEmail(email); }

    @Override
    public List<UserDTO> findAll() { return userDAO.findAll(); }

    @Override
    public int update(UserDTO dto) { return userDAO.update(dto); }

    @Override
    public int updatePassword(String email, String password) {
        return userDAO.updatePassword(email, password);
    }

    @Override
    public int delete(int id) { return userDAO.delete(id); }
}
