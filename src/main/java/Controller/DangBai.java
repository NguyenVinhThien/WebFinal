package Controller;

import DAO.DAOAdmin;
import sun.tools.jconsole.JConsole;

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
        RequestDispatcher rd= request.getRequestDispatcher("DangArticle.jsp");
        rd.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            String title= request.getParameter("title");
            String abstract_article= request.getParameter("Tom_tat");
            String content= request.getParameter("editor");
            int categories_id= Integer.parseInt(request.getParameter("Chuyen_muc"));
            int premium= Integer.parseInt(request.getParameter("premium"));
            int writer_id= Integer.parseInt(request.getParameter("writer_id"));
            System.out.println(content);
            DAOAdmin d= new DAOAdmin();
            d.addArticle(title,abstract_article,content,categories_id,premium,writer_id);
            response.sendRedirect("DangArticle.jsp");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
