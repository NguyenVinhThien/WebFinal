package Controller;

import Model.UserModel;
import Uti.ServletUtils;
import at.favre.lib.crypto.bcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


@WebServlet(name = "AccountServlet", urlPatterns = "/AccountServlet")
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */

    public AccountServlet(){
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String path = request.getPathInfo();
//        switch (path) {
//            case "/DangKy":
//                ServletUtils.forward("/DangKy.jsp", request, response);
//                break;
//
//            case "/DangNhap":
//                ServletUtils.forward("/DangNhap.jsp", request, response);
//                break;
//
//            case "/ThongTinCaNhan":
//                ServletUtils.forward("/ThongTinCaNhan.jsp", request, response);
//                break;
//
////            case "/IsAvailable":
////                String username = request.getParameter("user");
////                User user = null;
////                try {
////                    user = UserModel.findByUsername(username);
////                } catch (SQLException e) {
////                    throw new RuntimeException(e);
////                }
////                boolean isAvailable = (user == null);
////                PrintWriter out = response.getWriter();
////                response.setContentType("application/json");
////                response.setCharacterEncoding("utf-8");
////
////                out.print(isAvailable);
////                out.flush();
////                break;
//
//            default:
//                ServletUtils.forward("/404.jsp", request, response);
//                break;
//        }
//        // TODO Auto-generated method stub
//        response.getWriter().append("Served at: ").append(request.getContextPath());
        ServletUtils.forward("/DangKy.jsp", request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String path = request.getPathInfo();
//        switch (path) {
//            case "/DangKy":
//                registerUser(request, response);
//                break;
//
//            case "/DangNhap":
//                login(request, response);
//                break;
//
//            default:
//                ServletUtils.forward("/404.jsp", request, response);
//                break;
//        }
// TODO Auto-generated method stub
        try {
            String rawpwd = request.getParameter("rawpwd");
            String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

            String strDob = request.getParameter("dob") + " 00:00";
            DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
            LocalDateTime dob = LocalDateTime.parse(strDob, df);

            String username = request.getParameter("username");
            String name = request.getParameter("name");
//        String issue_at = null;
//        LocalDateTime issue_at = LocalDateTime.parse(str_issue_at, df);
//        int expiration = 0;
//        int role = 0;
//        String second_name = null;
            String email = request.getParameter("email");
//        String otp = null;
//        LocalDateTime otp_exp = null;

            UserModel c = new UserModel();
//        UserModel.add(c);
            c.addUser(username, bcryptHashString, name, dob, email);
            response.sendRedirect("/DangKy.jsp");
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

//    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }

//    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        User user = UserModel.findByUsername(username);
//        if (user != null) {
//            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
//            if (result.verified) {
//                HttpSession session = request.getSession();
//                session.setAttribute("auth", true);
//                session.setAttribute("authUser", user);
//                // response.addCookie(new Cookie("ecWebAppAuthUser", user.getUsername()));
//
//                String url = (String) session.getAttribute("retUrl");
//                if (url == null)
//                    url = "/Home";
//                ServletUtils.redirect(url, request, response);
//            } else {
//                request.setAttribute("hasError", true);
//                request.setAttribute("errorMessage", "Invalid login.");
//                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
//            }
//        } else {
//            request.setAttribute("hasError", true);
//            request.setAttribute("errorMessage", "Invalid login.");
//            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
//        }
//    }

}
