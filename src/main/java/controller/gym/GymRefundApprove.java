package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.gym.GymPaymentService;
import service.gym.GymPaymentServiceImpl;

/**
 * Servlet implementation class GymRefundApprove
 */
@WebServlet("/gym/refundApprove")
public class GymRefundApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymRefundApprove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GymPaymentService service = new GymPaymentServiceImpl();
		
		try {
            int paymentNum = Integer.parseInt(request.getParameter("paymentNum"));

            service.approveRefund(paymentNum);

            String ajax = request.getHeader("X-Requested-With");

            if ("XMLHttpRequest".equals(ajax)) {
                response.setContentType("text/plain; charset=UTF-8");
                response.getWriter().write("success");
            } else {
            	response.sendRedirect(request.getContextPath() + "/gym/memberManage");
            }
            

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
	}

}
