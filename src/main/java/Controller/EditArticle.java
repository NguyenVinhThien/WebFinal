package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.DAOAdmin;
import Model.Articles;


@WebServlet(name ="EditArticle",urlPatterns={"/EditArticle"})
public class EditArticle extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String id= request.getParameter("id");
        int i= Integer.parseInt(id);
        DAOAdmin d= new DAOAdmin();
        Articles t= d.getArticle(i);
        request.setAttribute("article", t);
        request.getRequestDispatcher("EditArticle.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
//        try {
//            String id= request.getParameter("id");
//            int i= Integer.parseInt(id);
//            String title= request.getParameter("title");
//            String abstract_article= request.getParameter("Tom_tat");
//            String content= request.getParameter("content");
//            DAOAdmin d= new DAOAdmin();
//            d.editArticle(i,title,content,abstract_article);
//            response.sendRedirect("EditArticle.jsp");
//        }catch(Exception e)
//        {
//            e.printStackTrace();
//        }
    }


}
