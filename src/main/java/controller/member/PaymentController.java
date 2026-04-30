package controller.member;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.member.LoginDTO;
import dto.member.PaymentDTO;
import service.member.PaymentService;
import service.member.PaymentServiceImpl;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {

    private PaymentService service = new PaymentServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession();
        LoginDTO user = (LoginDTO) session.getAttribute("loginUser");

        resp.setContentType("application/json;charset=UTF-8");

        if(user == null){
            resp.getWriter().write("{\"error\":\"not_login\"}");
            return;
        }

        int amount = Integer.parseInt(req.getParameter("amount"));
        String productName = req.getParameter("productName");

        // ✔ Controller는 DTO만 만든다 (orderId X)
        PaymentDTO dto = new PaymentDTO();
        dto.setAmount(amount);
        dto.setProductName(productName);
        dto.setEmail(user.getEmail());

        // ✔ Service가 orderId 생성 + DB 저장 담당
        PaymentDTO result = service.createPayment(dto);

        // ✔ response는 result 기준
        String json = "{"
                + "\"orderId\":\"" + result.getOrderId() + "\","
                + "\"amount\":" + result.getAmount() + ","
                + "\"productName\":\"" + result.getProductName() + "\""
                + "}";

        resp.getWriter().write(json);
    }
}