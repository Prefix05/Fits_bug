package dao;

import java.util.List;

import dto.Membership;

public interface MembershipDao {
	List<Membership> selectMembershipByGym(int gymNum) throws Exception;
	
}
