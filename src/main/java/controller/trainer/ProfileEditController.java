package controller.trainer;

import dto.trainer.TrainerDTO;
import dto.trainer.UserDTO;
import service.trainer.SignupService;
import service.trainer.SignupServiceImpl;
import service.trainer.TrainerService;
import service.trainer.TrainerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet("/trainer/profileEdit")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize       = 1024 * 1024 * 10,
        maxRequestSize    = 1024 * 1024 * 50
)
public class ProfileEditController extends HttpServlet {

    private String uploadDir;

    @Override
    public void init() {
        uploadDir = getServletContext().getRealPath("/uploads");
        new File(uploadDir).mkdirs();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/trainer/login");
            return;
        }

        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        TrainerService trainerService = new TrainerServiceImpl();
        TrainerDTO trainer = trainerService.getTrainerByUserId(loginUser.getId());

        if (trainer != null) {
            int tid = trainer.getTrainerId();
            request.setAttribute("trainer", trainer);
            request.setAttribute("specializations", trainerService.getSpecializationsByTrainerId(tid));
            request.setAttribute("traits",          trainerService.getTraitsByTrainerId(tid));
            request.setAttribute("certifications",  trainerService.getCertificationsByTrainerId(tid));
        }

        request.getRequestDispatcher("/trainer/profileEdit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/trainer/login");
            return;
        }

        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        TrainerService trainerService = new TrainerServiceImpl();
        TrainerDTO trainer = trainerService.getTrainerByUserId(loginUser.getId());

        if (trainer == null) {
            response.sendRedirect(request.getContextPath() + "/trainer/profile");
            return;
        }

        try {
            // 1. Update user basic info (name, tel, nickname)
            UserDTO userUpdate = new UserDTO();
            userUpdate.setId(loginUser.getId());
            userUpdate.setName(request.getParameter("name"));
            userUpdate.setTel(request.getParameter("tel"));
            userUpdate.setNickname(request.getParameter("nickname"));

            SignupService signupService = new SignupServiceImpl();
            signupService.updateUserProfile(userUpdate);

            // Refresh session with updated user info
            loginUser.setName(userUpdate.getName());
            loginUser.setTel(userUpdate.getTel());
            loginUser.setNickname(userUpdate.getNickname());

            // 2. Handle profile image upload
            Part profileImagePart = request.getPart("profileImage");
            String profileImageFileName = null;
            if (profileImagePart != null && profileImagePart.getSize() > 0) {
                String original = Paths.get(profileImagePart.getSubmittedFileName()).getFileName().toString();
                profileImageFileName = "profile_" + loginUser.getId() + "_" + original;
                profileImagePart.write(uploadDir + File.separator + profileImageFileName);
//                loginUser.setProfileImg(profileImageFileName);
            }

            // 3. Update trainer description + specializations + traits + profile image
            trainer.setDescription(request.getParameter("description"));
            String[] specializations = request.getParameterValues("specializations");
            String[] traits = request.getParameterValues("traits");
            if (specializations == null) specializations = new String[0];
            if (traits == null) traits = new String[0];

            trainerService.updateProfileWithTagsAndImage(trainer, specializations, traits, profileImageFileName);

            // 4. Update certifications
            String[] certNames   = request.getParameterValues("certName");
            String[] issuingOrgs = request.getParameterValues("issuingOrg");
            String[] issueDates  = request.getParameterValues("issueDate");
            String[] expiryDates = request.getParameterValues("expiryDate");

            List<Part> fileParts = new ArrayList<>();
            Collection<Part> allParts = request.getParts();
            for (Part part : allParts) {
                if ("certFile".equals(part.getName())) {
                    fileParts.add(part);
                }
            }

            String[] fileNames = new String[certNames == null ? 0 : certNames.length];
            for (int i = 0; i < fileNames.length; i++) {
                if (i < fileParts.size()) {
                    Part part = fileParts.get(i);
                    if (part.getSize() > 0) {
                        String original = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                        String saved = "cert_" + loginUser.getId() + "_" + i + "_" + original;
                        part.write(uploadDir + File.separator + saved);
                        fileNames[i] = saved;
                    }
                }
            }

            if (certNames != null && certNames.length > 0) {
                trainerService.insertCertifications(
                        trainer.getTrainerId(), certNames, issuingOrgs, issueDates, expiryDates, fileNames);
            } else {
                // No cert rows submitted — clear existing certs
                trainerService.insertCertifications(trainer.getTrainerId(), new String[0], null, null, null, null);
            }

            response.sendRedirect(request.getContextPath() + "/trainer/profile?saved=1");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "저장에 실패했습니다. 다시 시도해 주세요.");
            // Reload data for the form
            UserDTO loginUser2 = (UserDTO) session.getAttribute("loginUser");
            TrainerService ts2 = new TrainerServiceImpl();
            TrainerDTO trainer2 = ts2.getTrainerByUserId(loginUser2.getId());
            if (trainer2 != null) {
                int tid = trainer2.getTrainerId();
                request.setAttribute("trainer", trainer2);
                request.setAttribute("specializations", ts2.getSpecializationsByTrainerId(tid));
                request.setAttribute("traits",          ts2.getTraitsByTrainerId(tid));
                request.setAttribute("certifications",  ts2.getCertificationsByTrainerId(tid));
            }
            request.getRequestDispatcher("/trainer/profileEdit.jsp").forward(request, response);
        }
    }
}
