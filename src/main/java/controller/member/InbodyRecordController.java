package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.InbodyRecordDTO;
import dto.member.LoginDTO;
import service.member.InbodyRecordService;
import service.member.InbodyRecordServiceImpl;

@WebServlet("/inbody")
public class InbodyRecordController extends HttpServlet {

    private InbodyRecordService service = new InbodyRecordServiceImpl();

    // ===== 조회 =====
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

    	LoginDTO user = (LoginDTO) request.getSession().getAttribute("loginUser");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        List<InbodyRecordDTO> list = service.getList(user.getEmail());

        response.setContentType("application/json;charset=UTF-8");

        StringBuilder json = new StringBuilder();
        json.append("[");

        for (int i = 0; i < list.size(); i++) {

            InbodyRecordDTO d = list.get(i);

            json.append("{");
            json.append("\"date\":\"").append(d.getRecordDate()).append("\",");
            json.append("\"weight\":").append(d.getWeight()).append(",");
            json.append("\"muscle\":").append(d.getMuscle()).append(",");
            json.append("\"fat\":").append(d.getFat());
            json.append("}");

            if (i != list.size() - 1) json.append(",");
        }

        json.append("]");

        response.getWriter().write(json.toString());
    }

    // ===== 저장 =====
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

    	LoginDTO user = (LoginDTO) request.getSession().getAttribute("loginUser");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        InbodyRecordDTO dto = new InbodyRecordDTO();

        dto.setEmail(user.getEmail());
        dto.setWeight(Double.parseDouble(request.getParameter("weight")));
        dto.setMuscle(Double.parseDouble(request.getParameter("muscle")));
        dto.setFat(Double.parseDouble(request.getParameter("fat")));

        // 선택값 (이미지 없을 수도 있음)
        String imagePath = request.getParameter("imagePath");
        dto.setImagePath(imagePath);

        int result = service.save(dto);

        if (result > 0) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
    }
}