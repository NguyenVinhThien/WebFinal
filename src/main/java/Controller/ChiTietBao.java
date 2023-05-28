package Controller;

import DAO.DAOAdmin;
import DAO.DAOArticles;
import DAO.DAOComments;
import Model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ChiTietBao", value = "/ChiTietBao")
public class ChiTietBao extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOAdmin d= new DAOAdmin();
        DAOArticles da= new DAOArticles();
        List<Categories> listMainCat = d.getAllMainCategories();
        request.setAttribute("listCat", listMainCat);
        List<Categories> listSubCat = d.getSubCategories();
        request.setAttribute("listSubCat", listSubCat);
        List<Tags> listTags = d.getAllTag();
        request.setAttribute("listTags", listTags);

        int articleId= Integer.parseInt(request.getParameter("articleId"));
        Articles art= da.getArticle(articleId);
        request.setAttribute("articleDetails", art);
        List<Comment> cmt= d.getCmtByArtId(articleId);
        request.setAttribute("listCmt", cmt);
        System.out.println(cmt.size());
        RequestDispatcher rd= request.getRequestDispatcher("ChiTietBao.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        addComment(request, response);
    }

    private void addComment(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            request.setCharacterEncoding("UTF-8");
            HttpSession session= request.getSession();
            User auth_user= (User) session.getAttribute("authUser");
            int user_id= auth_user.getId();
            int article_id= Integer.parseInt(request.getParameter("articleId"));

            String comment= request.getParameter("message");

            Date currentDate= new Date();
//            System.out.println(currentDate);

            java.sql.Date sqlDate= new java.sql.Date(currentDate.getTime());
            System.out.println(sqlDate);

            DAOComments dcmt= new DAOComments();
            dcmt.addComment(article_id, user_id, comment, sqlDate);
            response.sendRedirect("/ChiTietBao?articleId="+article_id);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

}
