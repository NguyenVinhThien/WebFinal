package Controller;

import DAO.DAOAdmin;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddCategory
 */
@WebServlet(name="DangBai",urlPatterns={"/DangBai"})
public class DangBai extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangBai() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//        response.getWriter().append("Served at: ").append(request.getContextPath());
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            String title= request.getParameter("title");
            String abstract_article= request.getParameter("Tom_tat");
            String content= request.getParameter("content");
            int categories_id= Integer.parseInt(request.getParameter("cate"));
            //int premium= Integer.parseInt(request.getParameter("premium"));
            //int writer_id= Integer.parseInt(request.getParameter("writer_id"));
            DAOAdmin d= new DAOAdmin();
            d.addArticle(title,abstract_article,content,categories_id);
            response.sendRedirect("DangArticle.jsp");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
