package controller.gym;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.gym.MemberManage;
import dto.gym.Payment;

/**
 * Servlet implementation class GymMemberManage
 */
@WebServlet("/gym/memberManage")
public class GymMemberManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GymMemberManage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		GymMemberManageService service = new GymMemberManageServiceImpl();

		try {
//			HttpSession session = request.getSession(false);

			
//			if (session == null || session.getAttribute("gymId") == null) {
//				response.sendRedirect(request.getContextPath() + "/login.jsp");
//			    return;
//			}
//			
//			Integer gymId = (Integer) session.getAttribute("gymId");
			
			// 검색 / 필터 값
			String keyword = request.getParameter("keyword");
			String type = request.getParameter("type"); // pt / month / day
			String status = request.getParameter("status"); // active / soon / expired
			
			
			// DB 연결 전 테스트용 더미 데이터
			int gymId = 1;
			List<MemberManage> memberList = new java.util.ArrayList<>();
			List<Payment> paymentList = new ArrayList<>();

			MemberManage  m1 = new MemberManage ();
			m1.setMemberName("김지수");
			m1.setMembershipType("pt");
			m1.setTypeRep(30);
			m1.setRemainPtCount(10);
			m1.setStatus("active");
			memberList.add(m1);

			MemberManage  m2 = new MemberManage ();
			m2.setMemberName("이민호");
			m2.setMembershipType("month");
			m2.setTypeRep(3);
			m2.setStartDate("2026-03-01");
			m2.setEndDate("2026-06-01");
			m2.setStatus("active");
			memberList.add(m2);

			MemberManage  m3 = new MemberManage ();
			m3.setMemberName("박서준");
			m3.setMembershipType("month");
			m3.setTypeRep(1);
			m3.setStartDate("2026-04-01");
			m3.setEndDate("2026-05-01");
			m3.setStatus("soon");
			memberList.add(m3);

			MemberManage  m4 = new MemberManage ();
			m4.setMemberName("한소희");
			m4.setMembershipType("pt");
			m4.setTypeRep(20);
			m4.setRemainPtCount(2);
			m4.setStatus("soon");
			memberList.add(m4);

			MemberManage  m5 = new MemberManage ();
			m5.setMemberName("정해인");
			m5.setMembershipType("month");
			m5.setTypeRep(6);
			m5.setStartDate("2025-10-01");
			m5.setEndDate("2026-04-01");
			m5.setStatus("expired");
			memberList.add(m5);

			MemberManage  m6 = new MemberManage ();
			m6.setMemberName("아이유");
			m6.setMembershipType("pt");
			m6.setTypeRep(50);
			m6.setRemainPtCount(25);
			m6.setStatus("active");
			memberList.add(m6);
			
			Payment p1 = new Payment();
			p1.setPaymentNum(101);
			p1.setUserEmail("test1@test.com");
			p1.setPaymentPrice(new java.math.BigDecimal(150000));
			p1.setReason("개인 사정으로 환불 요청");
			p1.setCanceledAt(new Timestamp(System.currentTimeMillis()));
			p1.setMemberName("김지수");
			p1.setMembershipName("PT 30회권");
			p1.setStatus("환불요청");
			p1.setPaymentDate(Timestamp.valueOf("2026-04-20 14:30:00"));
			paymentList.add(p1);

			Payment p2 = new Payment();
			p2.setPaymentNum(102);
			p2.setUserEmail("test2@test.com");
			p2.setPaymentPrice(new java.math.BigDecimal(90000));
			p2.setReason("이사로 인해 이용 불가");
			p2.setCanceledAt(new Timestamp(System.currentTimeMillis() - 86400000));
			p2.setMemberName("이민호");
			p2.setMembershipName("3개월 이용권");
			p2.setStatus("환불요청");
			p2.setPaymentDate(Timestamp.valueOf("2026-04-18 11:20:00"));
			paymentList.add(p2);

			Payment p3 = new Payment();
			p3.setPaymentNum(103);
			p3.setUserEmail("test3@test.com");
			p3.setPaymentPrice(new java.math.BigDecimal(50000));
			p3.setReason("건강 문제");
			p3.setCanceledAt(new Timestamp(System.currentTimeMillis() - 172800000));
			p3.setMemberName("박서준");
			p3.setMembershipName("1개월 이용권");
			p3.setStatus("환불요청");
			p3.setPaymentDate(Timestamp.valueOf("2026-04-15 16:10:00"));
			paymentList.add(p3);
			
			List<Payment> cancelPaymentList = new ArrayList<>();

			Payment c1 = new Payment();
			c1.setPaymentNum(201);
			c1.setUserEmail("cancel1@test.com");
			c1.setPaymentPrice(new java.math.BigDecimal(120000));
			c1.setReason("결제 후 바로 취소 요청");
			c1.setMemberName("최유리");
			c1.setMembershipName("헬스장 3개월 이용권");
			c1.setStatus("취소요청");
			c1.setPaymentDate(Timestamp.valueOf("2026-04-25 10:15:00"));
			cancelPaymentList.add(c1);

			Payment c2 = new Payment();
			c2.setPaymentNum(202);
			c2.setUserEmail("cancel2@test.com");
			c2.setPaymentPrice(new java.math.BigDecimal(50000));
			c2.setReason("상품 선택 실수");
			c2.setMemberName("강하늘");
			c2.setMembershipName("1개월 이용권");
			c2.setStatus("취소요청");
			c2.setPaymentDate(Timestamp.valueOf("2026-04-26 13:40:00"));
			cancelPaymentList.add(c2);

			int pendingCancelCount = cancelPaymentList.size();
			
			List<MemberManage> filteredList = new java.util.ArrayList<>();

			for (MemberManage m : memberList) {

			    boolean match = true;

			    // 🔍 검색
			    if (keyword != null && !keyword.trim().isEmpty()) {
			        String kw = keyword.trim();
			        if (!(m.getMemberName().contains(kw) || (m.getTel() != null && m.getTel().contains(kw)))) {
			            match = false;
			        }
			    }

			    // 🔥 타입 필터
			    if (type != null && !type.isEmpty()) {

			        if ("pt".equals(type)) {
			            if (!"pt".equals(m.getMembershipType())) {
			                match = false;
			            }
			        }

			        else if ("health".equals(type)) {
			            if ("pt".equals(m.getMembershipType())) {
			                match = false;
			            }
			        }
			    }

			    // 🔥 상태 필터
			    if (status != null && !status.isEmpty()) {
			        if (!status.equals(m.getStatus())) {
			            match = false;
			        }
			    }

			    if (match) {
			        filteredList.add(m);
			    }
			}

			// 최종 적용
			memberList = filteredList;

			int totalMemberCount = memberList.size();
			int newMemberCount = 2;
			//더미 데이터
			
			memberList.sort((a, b) -> {
			    int aPriority = "soon".equals(a.getStatus()) ? 0 :
			                    "active".equals(a.getStatus()) ? 1 : 2;

			    int bPriority = "soon".equals(b.getStatus()) ? 0 :
			                    "active".equals(b.getStatus()) ? 1 : 2;

			    if (aPriority != bPriority) {
			        return Integer.compare(aPriority, bPriority);
			    }

			    // 둘 다 만료 임박이면 종료일 빠른 순
			    if ("soon".equals(a.getStatus()) && "soon".equals(b.getStatus())) {
			        String aEnd = a.getEndDate();
			        String bEnd = b.getEndDate();

			        if (aEnd == null || "-".equals(aEnd)) return 1;
			        if (bEnd == null || "-".equals(bEnd)) return -1;

			        return aEnd.compareTo(bEnd);
			    }

			    return 0;
			});
			
			
			int pendingRefundCount = paymentList.size();
			String pageParam = request.getParameter("page");

			int page = 1;
			int pageSize = 5;
			int totalPage = (int) Math.ceil((double) totalMemberCount / pageSize);

			if (totalPage == 0) {
			    totalPage = 1;
			}

			if (pageParam != null && !pageParam.equals("")) {
			    page = Integer.parseInt(pageParam);
			}

			int start = (page - 1) * pageSize;

			int end = Math.min(start + pageSize, memberList.size());

			if (start < memberList.size()) {
			    memberList = memberList.subList(start, end);
			} else {
			    memberList = new java.util.ArrayList<>();
			}
			
			String refundPageParam = request.getParameter("refundPage");

			int refundPage = 1;
			int refundPageSize = 5;

			if (refundPageParam != null && !refundPageParam.equals("")) {
			    refundPage = Integer.parseInt(refundPageParam);
			}

			int refundTotalCount = paymentList.size();
			int refundTotalPage = (int) Math.ceil((double) refundTotalCount / refundPageSize);

			if (refundTotalPage == 0) {
			    refundTotalPage = 1;
			}

			int refundStart = (refundPage - 1) * refundPageSize;
			int refundEnd = Math.min(refundStart + refundPageSize, paymentList.size());

			if (refundStart < paymentList.size()) {
			    paymentList = paymentList.subList(refundStart, refundEnd);
			} else {
			    paymentList = new java.util.ArrayList<>();
			}
			
			int cancelPage = 1;
			int cancelPageSize = 5;

			if (request.getParameter("cancelPage") != null) {
			    cancelPage = Integer.parseInt(request.getParameter("cancelPage"));
			}

			int cancelStart = (cancelPage - 1) * cancelPageSize;
			int cancelEnd = Math.min(cancelStart + cancelPageSize, cancelPaymentList.size());

			if (cancelStart < cancelPaymentList.size()) {
			    cancelPaymentList = cancelPaymentList.subList(cancelStart, cancelEnd);
			} else {
			    cancelPaymentList = new ArrayList<>();
			}

//			List<Payment> cancelPaymentList =
//			        paymentService.selectCancelRequestList(gymId, cancelStartRow, cancelPageSize);
//
//			int pendingCancelCount = paymentService.countCancelRequest(gymId);

			int cancelTotalPage =
			        (int) Math.ceil((double) pendingCancelCount / cancelPageSize);
			
			// 파라미터 묶기
			Map<String, Object> param = new HashMap<>();
			param.put("gymId", gymId);
			param.put("keyword", keyword);
			param.put("type", type);
			param.put("status", status);
			param.put("start", start);
			param.put("pageSize", pageSize);
			
			// 데이터 조회
//			List<MemberManage> memberList = service.getMemberList(param);
//			int totalMemberCount = service.getTotalMemberCount(gymId);
//			int newMemberCount = service.getNewMemberCount(gymId);
//			List<Payment> paymentList = paymentService.selectRefundRequestList(gymId);
//			int pendingRefundCount = paymentService.countRefundRequest(gymId);

			// JSP 전달
			request.setAttribute("memberList", memberList);
			request.setAttribute("totalMemberCount", totalMemberCount);
			request.setAttribute("newMemberCount", newMemberCount);
			request.setAttribute("keyword", keyword);
			request.setAttribute("type", type);
			request.setAttribute("status", status);
			request.setAttribute("page", page);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("paymentList", paymentList);
			request.setAttribute("pendingRefundCount", pendingRefundCount);
			request.setAttribute("refundPage", refundPage);
			request.setAttribute("refundPageSize", refundPageSize);
			request.setAttribute("refundTotalPage", refundTotalPage);
			request.setAttribute("cancelPaymentList", cancelPaymentList);
			request.setAttribute("pendingCancelCount", pendingCancelCount);
			request.setAttribute("cancelPage", cancelPage);
			request.setAttribute("cancelTotalPage", cancelTotalPage);

			// 페이지 이동
			request.getRequestDispatcher("/gym/gym_memberManage.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}
