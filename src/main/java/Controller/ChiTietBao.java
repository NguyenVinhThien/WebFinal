package Controller;

import DAO.DAOAdmin;
import Model.Articles;
import Model.Comment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChiTietBao", value = "/ChiTietBao")
public class ChiTietBao extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOAdmin d= new DAOAdmin();
        int articleId= Integer.parseInt(request.getParameter("articleId"));
        Articles art= d.getArticle(articleId);
        request.setAttribute("articleDetails", art);
        List<Comment> cmt= d.getCmtByArtId(articleId);
        request.setAttribute("listCmt", cmt);
        RequestDispatcher rd= request.getRequestDispatcher("ChiTietBao.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
