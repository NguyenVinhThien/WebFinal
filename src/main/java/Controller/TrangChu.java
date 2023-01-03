package Controller;

import DAO.DAOAdmin;
import Model.Articles;
import Model.Categories;
import Model.Tags;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TrangChu", value = "/TrangChu")
public class TrangChu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        Articles art= new Articles(1, "Nguyen Vinh Thine", "22/11", 3, "dh spk", 4, 0, 2, 0);
//        request.setAttribute("article", art);
        DAOAdmin d= new DAOAdmin();
        List<Categories> listMainCat= d.getAllCategories();
        request.setAttribute("listCat", listMainCat);
        List<Categories> listSubCat= d.getSubCategories();
        request.setAttribute("listSubCat", listSubCat);
        RequestDispatcher rd= request.getRequestDispatcher("TrangChu.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
