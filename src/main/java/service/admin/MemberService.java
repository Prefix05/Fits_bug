package service.admin;

import java.util.List;
import dto.admin.Member;
import util.PageInfo;

public interface MemberService {
	List<Member> getGymlist() throws Exception;
	List<Member> getTrainerlist() throws Exception;
	List<Member> getClientlist() throws Exception;
	List<Member> gymList(PageInfo pageInfo) throws Exception;
	List<Member> trainerList(PageInfo pageInfo) throws Exception;
	List<Member> clientList(PageInfo pageInfo) throws Exception;
}