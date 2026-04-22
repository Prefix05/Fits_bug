package dao.admin;

import java.util.List;
import java.util.Map;

import dto.admin.Member;

public interface MemberDAO {
	
	List<Member> selectAllGym() throws Exception;
	List<Member> selectAllTrainer() throws Exception;
	List<Member> selectAllClient() throws Exception;
	
	List<Member> selectGymList(Map<String, Integer> pagingMap) throws Exception;
	List<Member> selectTrainerList(Map<String, Integer> pagingMap) throws Exception;
	List<Member> selectClientList(Map<String, Integer> pagingMap) throws Exception;
 	
	Integer selectGymCnt() throws Exception;
	Integer selectTrainerCnt() throws Exception;
	Integer selectClientCnt() throws Exception;
}
