package Controller;

import Model.UserModel;
import Uti.ServletUtils;
import at.favre.lib.crypto.bcrypt.BCrypt;
import Model.User;

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
        } else {
            ServletUtils.forward("/404.jsp", request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = UserModel.findByUsername(username);
            if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            System.out.println(result.verified);
//                if (result.verified) {
//                HttpSession session = request.getSession();
//                session.setAttribute("auth", true);
//                session.setAttribute("authUser", user);
//                // response.addCookie(new Cookie("ecWebAppAuthUser", user.getUsername()));
//
//                String url = (String) session.getAttribute("retUrl");
//                if (url == null)
//                    url = "/WebFinal/TrangChu";
//                ServletUtils.redirect(url, request, response);
                    System.out.println(result.verified);
                    System.out.println("1");
                    response.sendRedirect("TrangChu.jsp");
//                } else {
//                    request.setAttribute("hasError", true);
//                    request.setAttribute("errorMessage", "Invalid login.");
//                    ServletUtils.forward("/DangNhap.jsp", request, response);
//                }
//            } else {
//                request.setAttribute("hasError", true);
//                request.setAttribute("errorMessage", "Invalid login.");
//                ServletUtils.forward("/DangNhap.jsp", request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
