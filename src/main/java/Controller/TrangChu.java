package Controller;

import DAO.DAOAdmin;
import Model.ArticleHasCategories;
import Model.Categories;
import Model.Tags;
import Uti.ServletUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TrangChu", urlPatterns = "/TrangChu/*")
public class TrangChu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path= request.getPathInfo();
        if(path == null || path.equals("/"))
        {
            path= "/Index";
        }
        switch (path) {
            case "/Index":
                DAOAdmin d = new DAOAdmin();

                List<Categories> listMainCat = d.getAllMainCategories();
                request.setAttribute("listCat", listMainCat);

                List<Categories> listSubCat = d.getSubCategories();
                request.setAttribute("listSubCat", listSubCat);

                List<Tags> listTags = d.getAllTag();
                request.setAttribute("listTags", listTags);

                List<ArticleHasCategories> listTopHotArt = d.getTopHotArticle();
                request.setAttribute("listTopHotArt", listTopHotArt);

                List<ArticleHasCategories> listArtByView = d.getArticleByView();
                request.setAttribute("listArtByView", listArtByView);

                List<ArticleHasCategories> listNewArt = d.getNewArticle();
                request.setAttribute("listNewArt", listNewArt);

                List<ArticleHasCategories> listTopByCat = d.getTopByCat();
                request.setAttribute("listTopByCat", listTopByCat);

                RequestDispatcher rd = request.getRequestDispatcher("/TrangChu.jsp");
                rd.forward(request, response);
                break;

            case "/ShowArticleByCat":

                ServletUtils.forward("/ShowArticleByCat.jsp", request, response);
                break;

            default:
                ServletUtils.forward("/404.jsp", request, response);
                break;

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
