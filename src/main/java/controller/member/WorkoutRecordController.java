/*
 * package controller;
 * 
 * import java.io.IOException; import java.io.PrintWriter; import
 * java.util.List;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.MultipartConfig; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession; import javax.servlet.http.Part;
 * 
 * import dto.MemberDTO; import dto.RecordDTO; import service.MyPageServiceImpl;
 * import service.RecordServiceImpl;
 * 
 * @WebServlet("/records") public class RecordController extends HttpServlet {
 * 
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws IOException {
 * 
 * HttpSession session = request.getSession(); MemberDTO user = (MemberDTO)
 * session.getAttribute("loginUser");
 * 
 * List<RecordDTO> list = new RecordServiceImpl().getRecords(user.getEmail());
 * 
 * response.setContentType("application/json;charset=UTF-8");
 * 
 * StringBuilder json = new StringBuilder(); json.append("[");
 * 
 * for(int i=0; i<list.size(); i++){ RecordDTO r = list.get(i);
 * 
 * json.append("{");
 * json.append("\"name\":\"").append(r.getName()).append("\",");
 * json.append("\"weight\":").append(r.getWeight()).append(",");
 * json.append("\"reps\":").append(r.getReps()); json.append("}");
 * 
 * if(i != list.size()-1){ json.append(","); } }
 * 
 * json.append("]");
 * 
 * response.getWriter().write(json.toString()); } }
 */
package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.MemberDTO;
import dto.member.WorkoutRecordDTO;
import service.member.WorkoutRecordService;
import service.member.WorkoutRecordServiceImpl;

@WebServlet("/member/records")
public class WorkoutRecordController extends HttpServlet {

    private WorkoutRecordService service = new WorkoutRecordServiceImpl();

    // ===== 조회 =====
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        MemberDTO user = (MemberDTO) request.getSession().getAttribute("loginUser");

        List<WorkoutRecordDTO> list = service.getRecords(user.getEmail());

        response.setContentType("application/json;charset=UTF-8");

        StringBuilder json = new StringBuilder();
        json.append("[");

        for (int i = 0; i < list.size(); i++) {

            WorkoutRecordDTO r = list.get(i);

            json.append("{");
            json.append("\"name\":\"").append(r.getName()).append("\",");
            json.append("\"weight\":").append(r.getWeight()).append(",");
            json.append("\"reps\":").append(r.getReps()).append(",");
            json.append("\"sets\":").append(r.getSets()).append(",");
            json.append("\"date\":\"").append(r.getDate()).append("\"");
            json.append("}");

            if (i != list.size() - 1) json.append(",");
        }

        json.append("]");

        response.getWriter().write(json.toString());
    }

    // ===== 저장 =====
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        MemberDTO user = (MemberDTO) request.getSession().getAttribute("loginUser");

        WorkoutRecordDTO dto = new WorkoutRecordDTO();

        dto.setEmail(user.getEmail());
        dto.setName(request.getParameter("name"));
        dto.setWeight(Integer.parseInt(request.getParameter("weight")));
        dto.setReps(Integer.parseInt(request.getParameter("reps")));
        dto.setSets(Integer.parseInt(request.getParameter("sets")));

        service.insertRecord(dto);

        response.getWriter().write("success");
    }
}