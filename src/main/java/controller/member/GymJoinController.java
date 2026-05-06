package controller.member;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.member.GymDTO;
import dto.member.UserDTO;
import service.member.GymService;
import service.member.GymServiceImpl;

@WebServlet("/member/gymJoin")
public class GymJoinController extends HttpServlet {

    private GymService gymService = new GymServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ── 기본 회원 정보 ────────────────────────────────────
        String username     = request.getParameter("username");   // 이메일
        String password     = request.getParameter("password");
        String gymName      = request.getParameter("gymName");
        String phone        = request.getParameter("phone");
        String ceo          = request.getParameter("ceo");

        // ── 주소 (다음 우편번호 API → 카카오 지오코딩으로 취득) ─
        String postcode     = request.getParameter("postcode");       // 우편번호
        String address      = request.getParameter("address");        // 기본 주소
        String addressDetail = request.getParameter("addressDetail"); // 상세 주소

        // ── 위도/경도 (카카오 지오코딩 → JS에서 hidden input으로 전송) ─
        String latStr = request.getParameter("lat");
        String lngStr = request.getParameter("lng");

        double lat = 0.0, lng = 0.0;
        try {
            if (latStr != null && !latStr.isEmpty()) lat = Double.parseDouble(latStr);
            if (lngStr != null && !lngStr.isEmpty()) lng = Double.parseDouble(lngStr);
        } catch (NumberFormatException ignored) {}

        // ── GymDTO 구성 ───────────────────────────────────────
        GymDTO gym = new GymDTO();
        gym.setName(gymName);
        gym.setPhoneNum(phone);
        gym.setPostcode(postcode);
        gym.setAddress(address);
        gym.setAddressDetail(addressDetail);
        gym.setLatitude(lat);
        gym.setLongitude(lng);
        gym.setApprovalStatus("PENDING");

        // 로그인된 사용자가 있으면 user_id 연결
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loginUser") != null) {
            UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
            gym.setUserId(loginUser.getId());
        }

        // ── DB 저장 ───────────────────────────────────────────
        int result = gymService.insertGym(gym);

        if (result > 0) {
            // 승인 대기 안내 페이지로 이동
            response.sendRedirect(request.getContextPath() + "/member/gymVerify.jsp");
        } else {
            request.setAttribute("errorMsg", "헬스장 등록 중 오류가 발생했습니다.");
            request.getRequestDispatcher("/member/gymJoin.jsp").forward(request, response);
        }
    }
}
