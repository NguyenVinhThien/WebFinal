package Controller;

import DAO.UserModel;
import Uti.ServletUtils;
import at.favre.lib.crypto.bcrypt.BCrypt;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
                ServletUtils.forward("/DangNhap.jsp", request, response);
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

//            case "/Logout":
//                logout(request, response);
//                break;

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

            UserModel c = new UserModel();
            c.addUser(username, bcryptHashString, name, dob, email);
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
                CharSequence charSeq = user.getPassword();
                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), charSeq);
                if (result.verified) {
                    response.sendRedirect("/WebFinal/TrangChu");
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
}
