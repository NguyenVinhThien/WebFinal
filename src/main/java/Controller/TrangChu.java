package Controller;

import DAO.DAOAdmin;
import DAO.DAOComments;
import Model.ArticleHasCategories;
import Model.ArticleHasTag;
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
        DAOAdmin d = new DAOAdmin();
        DAOComments dcmt= new DAOComments();

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

        switch (path) {
            case "/Index":
                RequestDispatcher rd = request.getRequestDispatcher("/TrangChu.jsp");
                rd.forward(request, response);
                break;
            case "/ShowArticleByCat":
                int cat_id= Integer.parseInt(request.getParameter("cat_id"));
                List <ArticleHasCategories> listArtByCat= d.getArtByCatId(cat_id);
                request.setAttribute("listArtByCat", listArtByCat);
                ServletUtils.forward("/ShowArticleByCat.jsp", request, response);
                break;
            case "/ShowArticleByTag":
                int tag_id= Integer.parseInt(request.getParameter("tag_id"));
                List <ArticleHasTag> listArtByTags= d.getArticleByTagId(tag_id);
                request.setAttribute("listArtByTag", listArtByTags);
                ServletUtils.forward("/ShowArticleByTag.jsp", request, response);
                break;
            case "/ShowArticleAll":
                List <ArticleHasTag> listArtAll= d.getArticleAll();
                request.setAttribute("listArtAll", listArtAll);
                ServletUtils.forward("/ShowArticleAll.jsp", request, response);
                break;
            case "/search":
                request.setCharacterEncoding("UTF-8");
                String key_word= request.getParameter("key_word");
                List <ArticleHasCategories> listSearch= dcmt.searchTitle(key_word);
                request.setAttribute("listSearch", listSearch);
                ServletUtils.forward("/ShowSearchResult.jsp", request, response);
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
