package controller.member;

import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dto.member.InbodyLogDTO;
import dto.member.UserDTO;
import service.member.InbodyLogService;
import service.member.InbodyLogServiceImpl;

@WebServlet("/member/inbody")
public class InbodyRecordController extends HttpServlet {

    private InbodyLogService service = new InbodyLogServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");
        if (user == null) { response.setStatus(401); return; }

        List<InbodyLogDTO> list = service.getListByEmail(user.getEmail());

        response.setContentType("application/json;charset=UTF-8");
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < list.size(); i++) {
            InbodyLogDTO d = list.get(i);
            json.append("{")
                .append("\"date\":\"").append(d.getRecordDate()).append("\",")
                .append("\"weight\":").append(d.getWeight()).append(",")
                .append("\"muscle\":").append(d.getMuscleMass()).append(",")  // muscleMass
                .append("\"fat\":").append(d.getBodyFat())                    // bodyFat
                .append("}");
            if (i != list.size() - 1) json.append(",");
        }
        json.append("]");
        response.getWriter().write(json.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");
        if (user == null) { response.setStatus(401); return; }

        int memberId = user.getOtherId();

        InbodyLogDTO dto = new InbodyLogDTO();
        dto.setMemberId(memberId);
        dto.setRecordDate(new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
        dto.setWeight(Double.parseDouble(request.getParameter("weight")));
        dto.setMuscleMass(Double.parseDouble(request.getParameter("muscle")));  // muscleMass
        dto.setBodyFat(Double.parseDouble(request.getParameter("fat")));        // bodyFat
        dto.setImg(request.getParameter("img"));

        int result = service.save(dto);
        response.getWriter().write(result > 0 ? "success" : "fail");
    }
}
