package controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.TrainerDTO;
import dto.member.TrainerPricingDTO;
import dto.member.TrainerSpecializationDTO;
import dto.member.TrainerCertificationDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

@WebServlet("/member/trainerDetail")
public class TrainerDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int trainerId = 0;
        try {
            trainerId = Integer.parseInt(req.getParameter("trainerId"));
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/member/trainerList");
            return;
        }

        TrainerDTO trainer = null;
        List<TrainerPricingDTO> pricingList = new ArrayList<>();
        List<TrainerSpecializationDTO> specList = new ArrayList<>();
        List<TrainerCertificationDTO> certList = new ArrayList<>();

        try (SqlSession sql = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            trainer = sql.selectOne("mapper.TrainerMapper.findById", trainerId);
            if (trainer != null) {
                pricingList = sql.selectList("mapper.TrainerPricingMapper.findByTrainerId", trainerId);
                specList    = sql.selectList("mapper.TrainerSpecializationMapper.findByTrainerId", trainerId);
                certList    = sql.selectList("mapper.TrainerCertificationMapper.findByTrainerId", trainerId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (trainer == null) {
            resp.sendRedirect(req.getContextPath() + "/member/trainerList");
            return;
        }

        req.setAttribute("trainer",     trainer);
        req.setAttribute("pricingList", pricingList);
        req.setAttribute("specList",    specList);
        req.setAttribute("certList",    certList);

        req.getRequestDispatcher("/member/trainerDetail.jsp").forward(req, resp);
    }
}
