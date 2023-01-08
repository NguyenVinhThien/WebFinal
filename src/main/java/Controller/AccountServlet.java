package Controller;

import DAO.UserModel;
import Model.User;
import Uti.ServletUtils;
import at.favre.lib.crypto.bcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Clock;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


@WebServlet(name = "AccountServlet", urlPatterns = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/DangKy":
                ServletUtils.forward("/DangKy.jsp", request, response);
                break;

            case "/DangNhap":
//                HttpSession session = request.getSession();
//                if ((boolean) session.getAttribute("auth")) {
//                    ServletUtils.redirect("/TrangChu", request, response);
//                } else ServletUtils.forward("/DangNhap.jsp", request, response);
                ServletUtils.forward("/DangNhap.jsp", request, response);
                break;

            case "/ThongTinCaNhan":
                ServletUtils.forward("/ThongTinCaNhan.jsp", request, response);
                break;

            case "/IsAvailable":
                String username = request.getParameter("user");
                User user = null;
                user = UserModel.findByUsername(username);
                boolean isAvailable = (user == null);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
                break;
            default:
                ServletUtils.forward("/404.jsp", request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/DangKy":
                registerUser(request, response);
                break;

            case "/DangNhap":
                login(request, response);
                break;

            case "/Logout":
                logout(request, response);
                break;

            case "/ThongTinCaNhan":
                updateProfile(request, response);
                break;

            default:
                ServletUtils.forward("/404.jsp", request, response);
                break;
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
            String rawpwd = request.getParameter("rawpwd");
            String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

            String strDob = request.getParameter("dob") + " 00:00";
            DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
            LocalDateTime dob = LocalDateTime.parse(strDob, df);

            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String email = request.getParameter("email");

            LocalDateTime issue_at = LocalDateTime.now(Clock.systemDefaultZone());

            UserModel c = new UserModel();
            c.addUser(username, bcryptHashString, name, issue_at, dob, email);
            response.sendRedirect("/WebFinal/Account/DangNhap");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = UserModel.findByUsername(username);
            if (user != null) {
                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword().toCharArray());
                if (result.verified) {
                    HttpSession session = request.getSession();
                    session.setAttribute("auth", true);
                    session.setAttribute("authUser", user);
                    String url = (String) session.getAttribute("retUrl");
                    if (url == null)
                        url = "/TrangChu";
                    ServletUtils.redirect(url, request, response);
//                    response.sendRedirect("/WebFinal/TrangChu");
                } else {
                    request.setAttribute("hasError", true);
                    request.setAttribute("errorMessage", "Invalid login.");
                    ServletUtils.forward("/DangNhap.jsp", request, response);
                }
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                ServletUtils.forward("/DangNhap.jsp", request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());

        String url = request.getHeader("referer");
        if (url == null)
            url = "/TrangChu";
        ServletUtils.redirect(url, request, response);
    }
    private void updateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("authUser");
//        int id = user.getId();
//        String username = user.getUsername();
//        String password = user.getPassword();
//        String name = user.getName();
//        LocalDateTime issue_at = user.getIssue_at();
//        int expiration = user.getExpiration();
//        int role = user.getRole();
//        String second_name = user.getSecond_name();
//        LocalDateTime dob = user.getDob();
//        String email = user.getEmail();
//        String otp = user.getOtp();;
//        LocalDateTime otp_exp = user.getOtp_exp();
//
//        request.setAttribute("username", username);

        try {
            request.setCharacterEncoding("UTF-8");
            String username = request.getParameter("username");

            String strDob = request.getParameter("dob");
            DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dob = LocalDateTime.parse(strDob, df);

            String name = request.getParameter("name");
            String second_name = request.getParameter("second_name");
            String email = request.getParameter("email");

            UserModel c = new UserModel();
            c.updateUser(username, name, second_name, dob, email);
//
//            User user = UserModel.findByUsername(username);
//            HttpSession session = request.getSession();
//            session.setAttribute("authUser", user);
//
//
            response.sendRedirect("/WebFinal/Account/DangNhap");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
