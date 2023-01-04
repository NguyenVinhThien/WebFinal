package Controller;

import Model.UserModel;
import Uti.ServletUtils;
import at.favre.lib.crypto.bcrypt.BCrypt;
import beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "AccountServlet_Login", urlPatterns = "/Account_Login/*")
public class AccountServlet_Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */

    public AccountServlet_Login() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if ("/DangNhap".equals(path)) {
            ServletUtils.forward("/DangNhap.jsp", request, response);

//            case "/IsAvailable":
//                String username = request.getParameter("user");
//                User user = null;
//                user = UserModel.findByUsername(username);
//                boolean isAvailable = (user == null);
//
//                PrintWriter out = response.getWriter();
//                response.setContentType("application/json");
//                response.setCharacterEncoding("utf-8");
//
//                out.print(isAvailable);
//                out.flush();
//                break;
        } else {
            ServletUtils.forward("/404.jsp", request, response);
        }
////        // TODO Auto-generated method stub
////        response.getWriter().append("Served at: ").append(request.getContextPath());
//        ServletUtils.forward("/DangKy.jsp", request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // TODO Auto-generated method stub
//        try {
//            request.setCharacterEncoding("UTF-8");
//            String rawpwd = request.getParameter("rawpwd");
//            String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
//
//            String strDob = request.getParameter("dob") + " 00:00";
//            DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
//            LocalDateTime dob = LocalDateTime.parse(strDob, df);
//
//            String username = request.getParameter("username");
//            String name = request.getParameter("name");
//            String email = request.getParameter("email");
//
//            UserModel c = new UserModel();
//            c.addUser(username, bcryptHashString, name, dob, email);
//            response.sendRedirect("/WebFinal/Account/DangKy");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = UserModel.findByUsername(username);
            if (user != null) {
                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
                if (result.verified) {
//                HttpSession session = request.getSession();
//                session.setAttribute("auth", true);
//                session.setAttribute("authUser", user);
//                // response.addCookie(new Cookie("ecWebAppAuthUser", user.getUsername()));
//
//                String url = (String) session.getAttribute("retUrl");
//                if (url == null)
//                    url = "/WebFinal/TrangChu";
//                ServletUtils.redirect(url, request, response);
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
            e.printStackTrace();
        }
    }
}
