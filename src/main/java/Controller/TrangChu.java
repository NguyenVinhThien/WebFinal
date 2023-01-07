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
import java.util.Map;

@WebServlet(name = "TrangChu", value = "/TrangChu")
public class TrangChu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DAOAdmin d= new DAOAdmin();
        List<Categories> listMainCat= d.getAllCategories();
        request.setAttribute("listCat", listMainCat);

        List<Categories> listSubCat= d.getSubCategories();
        request.setAttribute("listSubCat", listSubCat);

        List<Tags> listTags= d.getAllTag();
        request.setAttribute("listTags", listTags);

        Map<Articles,String> listTopHotArt= d.getTopHotArticle();
        request.setAttribute("listTopHotArt", listTopHotArt);

        Map<Articles,String> listArtByView= d.getArticleByView();
        request.setAttribute("listArtByView", listArtByView);

        Map<Articles,String> listNewArt= d.getNewArticle();
        request.setAttribute("listNewArt", listNewArt);

        RequestDispatcher rd= request.getRequestDispatcher("TrangChu.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
