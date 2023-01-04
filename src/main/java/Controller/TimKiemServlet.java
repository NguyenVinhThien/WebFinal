package Controller;

import DAO.DAOAdmin;
import Model.Articles;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TimKiemServlet", value = "/TimKiemServlet")
public class TimKiemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOAdmin d= new DAOAdmin();
        int catId= Integer.parseInt(request.getParameter("catId"));
        List <Articles> list= d.getArticleByCatId(catId);
        request.setAttribute("listArticles", list);
        RequestDispatcher rd= request.getRequestDispatcher("TimKiem.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
