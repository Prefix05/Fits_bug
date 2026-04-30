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
 * Servlet implementation class GymPaymentCancelApprove
 */
@WebServlet("/gym/paymentCancelApprove")
public class GymPaymentCancelApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymPaymentCancelApprove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain; charset=UTF-8");
		GymPaymentService service = new GymPaymentServiceImpl();

		try {
			int paymentNum = Integer.parseInt(request.getParameter("paymentNum"));

			service.approveCancel(paymentNum);

			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("success");

		} catch (Exception e) {
			e.printStackTrace();

			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("fail");
		}
	}

}
