package dao.gym.main;

import java.util.List;

import dto.gym.Membership;

public interface MembershipDao {
	List<Membership> selectMembershipByGym(int gymNum) throws Exception;
	
}
