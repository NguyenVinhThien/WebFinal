package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAOAdmin;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/AddSubCategory")
public class AddSubCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSubCategory() {
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
            String id= request.getParameter("id");
            String name= request.getParameter("name");
            String parent_id= request.getParameter("parent_id");
            DAOAdmin d= new DAOAdmin();
            d.addSubCategory(id,name,parent_id);
            response.sendRedirect("Category.jsp");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
