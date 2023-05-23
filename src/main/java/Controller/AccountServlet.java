package Controller;

import DAO.DAOAdmin;
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
                HttpSession session = request.getSession();
                if ((boolean) session.getAttribute("auth")) {
                    ServletUtils.redirect("/TrangChu", request, response);
                } else ServletUtils.forward("/DangNhap.jsp", request, response);
//                ServletUtils.forward("/DangNhap.jsp", request, response);
                break;

            case "/ThongTinCaNhan":
                ServletUtils.forward("/ThongTinCaNhan.jsp", request, response);
                break;

            case "/IsAvailable":
                String username = request.getParameter("user");
                User user = null;
                user = DAOAdmin.findByUsername(username);
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

    private void registerUser(HttpServletRequest request, HttpServletResponse response) {
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
            int role = Integer.parseInt(request.getParameter("role"));

            DAOAdmin c = new DAOAdmin();
            c.addUser(username, bcryptHashString, name, issue_at, role, dob, email);
            response.sendRedirect("/Account/DangNhap");


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = DAOAdmin.findByUsername(username);

            if (user != null) {

                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword().toCharArray());
                if (result.verified) {
                    HttpSession session = request.getSession();
                    session.setAttribute("auth", true);
                    session.setAttribute("authUser", user);
//                    if (user.getId() == 1) {
//                        response.sendRedirect("/Admin/BaiViet/ShowBaiViet");
//                    }
                    if (user.getRole() == 3) {
                        response.sendRedirect("/Admin/BaiViet/ShowBaiViet");
                    }
                    else if (user.getRole() == 2) {
                        response.sendRedirect("/Editor/Home?id="+user.getId());
                    }
                    else if (user.getRole() == 1) {
                        response.sendRedirect("/Writer/Home?id="+user.getId());
                    }
                    else {
                        String url = (String) session.getAttribute("retUrl");
                        if (url == null)
                            url = "/TrangChu";
                        ServletUtils.redirect(url, request, response);
//                    response.sendRedirect("/TrangChu");
                    }


//                    if (user.getRole() == 3) {
//                        String url1 = (String) session.getAttribute("retUrl");
//                        url1 = "/Admin/BaiViet/ShowBaiViet";
//                        ServletUtils.redirect(url1, request, response);
//                    }
//                    if (user.getRole() == 2) {
//                        String url2 = (String) session.getAttribute("retUrl");
//                        if (url2 == null)
//                            url2 = "/Editor/Home?id="+user.getId();
//                        ServletUtils.redirect(url2, request, response);
//                    }
//                    if (user.getRole() == 1) {
//                        String url3 = (String) session.getAttribute("retUrl");
//                        if (url3 == null)
//                            url3 = "/Writer/Home?id="+user.getId();
//                        ServletUtils.redirect(url3, request, response);
//                    }
//                    else {
//                        String url = (String) session.getAttribute("retUrl");
//                        if (url == null)
//                            url = "/TrangChu";
//                        ServletUtils.redirect(url, request, response);
////                    response.sendRedirect("/TrangChu");
//                    }
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

        try {
            request.setCharacterEncoding("UTF-8");
            String username = request.getParameter("username");

            String strDob = request.getParameter("dob");
            DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dob = LocalDateTime.parse(strDob, df);

            String name = request.getParameter("name");
            String second_name = request.getParameter("second_name");
            String email = request.getParameter("email");

            // Update the information here
            DAOAdmin c = new DAOAdmin();
            c.updateUser(username, name, second_name, dob, email);

            User user = DAOAdmin.findByUsername(username);
            HttpSession session = request.getSession();
            session.setAttribute("authUser", user);

            request.setAttribute("message", "Update Success Information");
            request.getRequestDispatcher("/ThongTinCaNhan.jsp").forward(request, response);
        } catch (Exception e) {
            // Send an error response to the client with an error message
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating the information: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
