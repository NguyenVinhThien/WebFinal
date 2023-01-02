package Controller;

import Uti.ServletUtils;
import at.favre.lib.crypto.bcrypt.BCrypt;
import beans.User;
import Model.UserModel;
import Uti.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "AccountServlet", value = "/Account/*")
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

            case "/ThongTinCaNhan":
                ServletUtils.forward("/ThongTinCaNhan.jsp", request, response);
                break;

            case "/IsAvailable":
                String username = request.getParameter("user");
                User user = null;
                try {
                    user = UserModel.findByUsername(username);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                boolean isAvailable = (user == null);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
                break;

            default:
                ServletUtils.forward("/", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/DangKy.jsp":
                registerUser(request, response);
                break;

            case "/DangNhap.jsp":
                login(request, response);
                break;

            default:
                ServletUtils.forward("/404.jsp", request, response);
                break;
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

        String strDob = request.getParameter("dob") + " 00:00";
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime dob = LocalDateTime.parse(strDob, df);

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String str_issue_at = request.getParameter("issue_at");
        LocalDateTime issue_at = LocalDateTime.parse(str_issue_at, df);
        int expiration = Integer.parseInt(request.getParameter("expiration"));
        int role = 0;
        String second_name = request.getParameter("second_name");
        String email = request.getParameter("email");
        String otp = null;
        LocalDateTime otp_exp = null;

        User c = new User(0, username, bcryptHashString, name, issue_at, expiration, role, second_name, dob,email, null, null);
        UserModel.add(c);
        ServletUtils.forward("/DangKy.jsp", request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
