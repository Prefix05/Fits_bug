package service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.admin.MemberDAO;
import dao.admin.MemberDAOImpl;
import dto.admin.Member;
import util.PageInfo;

public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO; //dao 가져오기.
	public MemberServiceImpl() {
		memberDAO = new MemberDAOImpl();
	}

	@Override
	public List<Member> getGymlist() throws Exception {
		return memberDAO.selectAllGym();
	}

	@Override
	public List<Member> getTrainerlist() throws Exception {
		return memberDAO.selectAllTrainer();
	}

	@Override
	public List<Member> getClientlist() throws Exception {
		return memberDAO.selectAllClient();
	}

	@Override
	public List<Member> gymList(PageInfo pageInfo) throws Exception {
		int pageRow = 4; // 한 페이지에 보여줄 데이터 수
		int btnCnt = 4; // 화면 하단에 보여줄 페이지 번호 버튼 갯수
		Integer gymCnt = memberDAO.selectGymCnt(); // db에 등록된 전체 헬스장 수
		Integer allPage = (int)Math.ceil((double)gymCnt/pageRow); // 전체 페이지 수 계산 ceil:올림
		Integer startPage = (pageInfo.getCurPage()-1)/btnCnt*btnCnt+1;
		Integer endPage = startPage+btnCnt-1;
		if(endPage>allPage) endPage = allPage;
		
		pageInfo.setAllPage(allPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		Integer row = (pageInfo.getCurPage()-1)*pageRow;
		
		Map<String, Integer> pagingMap = new HashMap<>();
		pagingMap.put("row", row);
		pagingMap.put("pageRow", pageRow);
		
		System.out.println(pageInfo.getCurPage());
		System.out.println(pageInfo.getAllPage());
		System.out.println(pagingMap.get("row"));
		System.out.println(pagingMap.get("pageRow"));
		
		return memberDAO.selectGymList(pagingMap);
	}

	@Override
	public List<Member> trainerList(PageInfo pageInfo) throws Exception {
		int pageRow = 4; // 한 페이지에 보여줄 데이터 수
		int btnCnt = 4; // 화면 하단에 보여줄 페이지 번호 버튼 갯수
		Integer trainerCnt = memberDAO.selectTrainerCnt(); // db에 등록된 전체 헬스장 수
		Integer allPage = (int)Math.ceil((double)trainerCnt/pageRow); // 전체 페이지 수 계산 ceil:올림
		Integer startPage = (pageInfo.getCurPage()-1)/btnCnt*btnCnt+1;
		Integer endPage = startPage+btnCnt-1;
		if(endPage>allPage) endPage = allPage;
		
		pageInfo.setAllPage(allPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		Integer row = (pageInfo.getCurPage()-1)*pageRow;
		
		Map<String, Integer> pagingMap = new HashMap<>();
		pagingMap.put("row", row);
		pagingMap.put("pageRow", pageRow);
		return memberDAO.selectTrainerList(pagingMap);
	}

	@Override
	public List<Member> clientList(PageInfo pageInfo) throws Exception {
		int pageRow = 4; // 한 페이지에 보여줄 데이터 수
		int btnCnt = 4; // 화면 하단에 보여줄 페이지 번호 버튼 갯수
		Integer clientCnt = memberDAO.selectClientCnt(); // db에 등록된 전체 헬스장 수
		Integer allPage = (int)Math.ceil((double)clientCnt/pageRow); // 전체 페이지 수 계산 ceil:올림
		Integer startPage = (pageInfo.getCurPage()-1)/btnCnt*btnCnt+1;
		Integer endPage = startPage+btnCnt-1;
		if(endPage>allPage) endPage = allPage;
		
		pageInfo.setAllPage(allPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		Integer row = (pageInfo.getCurPage()-1)*pageRow;
		
		Map<String, Integer> pagingMap = new HashMap<>();
		pagingMap.put("row", row);
		pagingMap.put("pageRow", pageRow);
		return memberDAO.selectClientList(pagingMap);
	}
}