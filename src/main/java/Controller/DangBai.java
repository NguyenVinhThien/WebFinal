package Controller;

import DAO.DAOAdmin;
import Uti.ServletUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


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
        String id= request.getParameter("id");
        int i= Integer.parseInt(id);
        request.setAttribute("author", i);
        ServletUtils.forward("/DangArticle.jsp", request, response);
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
            int premium;
            try{
                premium= Integer.parseInt(request.getParameter("qq"));
            }
            catch (NumberFormatException e){
                premium = 0;
            }
            int writer_id= Integer.parseInt(request.getParameter("writer"));
            System.out.println(premium);
            DAOAdmin d= new DAOAdmin();
            d.addArticle(title,abstract_article,content,categories_id,premium,writer_id);
            response.sendRedirect("Writer.jsp");;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
