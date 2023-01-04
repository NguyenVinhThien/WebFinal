package Controller;

import DAO.DAOAdmin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class EditCategory
 */
@WebServlet("/EditSubCategory")
public class EditSubCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSubCategory() {
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
            String parent_id = request.getParameter("parent_id");
            int i= Integer.parseInt(id);
            int pid = Integer.parseInt(parent_id);
            DAOAdmin d= new DAOAdmin();
            d.editSubCategory(i,name,pid);
            response.sendRedirect("ShowCategory");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }


}
