package service.admin;

import java.util.List;
import java.util.Map;

import dto.admin.Member;
import util.PageInfo;

public interface MemberService {
	List<Member> getGymlist() throws Exception;
	List<Member> getTrainerlist() throws Exception;
	List<Member> getClientlist() throws Exception;
	List<Member> gymList(Map<String, Object> paramMap) throws Exception;
	List<Member> trainerList(PageInfo pageInfo, String trainerName) throws Exception;
	List<Member> clientList(PageInfo pageInfo, String clientName) throws Exception;
	Integer totalCnt() throws Exception;
	Integer gymCnt() throws Exception;
	Integer trainerCnt() throws Exception;
	Integer clientCnt() throws Exception;
	List<Map<String, Object>> getPendingAuthList() throws Exception;
	Map<String, Object> getAuthDetail(String userId, String authType) throws Exception;
}