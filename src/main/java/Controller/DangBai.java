package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/DangBai")
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
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            String id_article= request.getParameter("id_article");
            String title= request.getParameter("title");
            String publish_date= request.getParameter("publish_date");
            int views= Integer.parseInt(request.getParameter("views"));
            String abstract_article= request.getParameter("abstract_article");
            String content= request.getParameter("content");
            int categories_id= Integer.parseInt(request.getParameter("categories_id"));
            int premium= Integer.parseInt(request.getParameter("premium"));
            int writer_id= Integer.parseInt(request.getParameter("writer_id"));
            int status= Integer.parseInt(request.getParameter("status"));

            response.sendRedirect("DangArticle.jsp");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
