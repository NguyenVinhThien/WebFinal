package Controller;


import DAO.DAOAdmin;
import Model.Categories;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name="ShowSubCategory",urlPatterns={"/ShowSubCategory"})
public class ShowSubCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSubCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        DAOAdmin d= new DAOAdmin();
        int parent_id = Integer.parseInt(request.getParameter("id"));
        String name = d.getCategoryName(parent_id);
        List<Categories> list= d.getAllSubCategories(parent_id);
        request.setAttribute("listS", list);
        request.setAttribute("name",name);
        request.getRequestDispatcher("SubCategory.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}

