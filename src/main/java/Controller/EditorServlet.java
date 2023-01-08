package Controller;

import DAO.DAOAdmin;
import Model.Articles;
import Model.Categories;
import Model.User;
import Uti.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="Editor",urlPatterns = "/Editor/*")
public class EditorServlet  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOAdmin d = new DAOAdmin();
        String path = request.getPathInfo();
        switch (path) {
            case "/Home":
            case "/ShowCategory": {
                int editor = Integer.parseInt(request.getParameter("id"));
                List<Categories> list = d.getAllMainCategoriesByEditor(editor);
                String name = d.getUserName(editor);
                request.setAttribute("listC", list);
                request.setAttribute("name", name);
                request.getRequestDispatcher("/MainCategoryByEditor.jsp").forward(request, response);
                break;
            }

            case "/ShowCategory/SubCategory": {
                int parent_id = Integer.parseInt(request.getParameter("id"));
                String name = d.getCategoryName(parent_id);
                List<Categories> list = d.getAllSubCategories(parent_id);
                request.setAttribute("listS", list);
                request.setAttribute("name", name);
                request.getRequestDispatcher("/SubCategoryByEditor.jsp").forward(request, response);
                break;
            }

            case "/ShowArticle/ByMainCategory":
            case "/ShowArticle/BySubCategory": {
                int catID = Integer.parseInt(request.getParameter("id"));
                List<Articles> list = d.getArticleByCatId(catID);
                List<Categories> cate = d.getAllCategories();
                List<User> name = d.getAllUsers();
                request.setAttribute("listA", list);
                request.setAttribute("listC", cate);
                request.setAttribute("name", name);
                request.setAttribute("path","chưa được duyệt");
                request.getRequestDispatcher("/ArticleByEditor.jsp").forward(request, response);
                break;
            }

            case "/EditArticle": {
                String id = request.getParameter("id");
                int i = Integer.parseInt(id);
                Articles t = d.getArticle(i);
                List<Categories> cate = d.getAllCategories();
                request.setAttribute("listC", cate);
                request.setAttribute("article", t);
                request.getRequestDispatcher("/Editor.jsp").forward(request, response);
                break;
            }
            default: {
                ServletUtils.forward("/404.jsp", request, response);
                break;
            }
        }
        // TODO Auto-generated method stub

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String path = request.getPathInfo();
        switch (path) {
            case "/DangBai": {
                AddArticle(request, response);
                break;
            }
            case "/EditArticle": {
                EditArticle(request, response);
                break;
            }
        }
    }

    private void AddArticle(HttpServletRequest request, HttpServletResponse response) {
        try {
            String title = request.getParameter("title");
            String abstract_article = request.getParameter("Tom_tat");
            String content = request.getParameter("content");
            int categories_id = Integer.parseInt(request.getParameter("cate"));
            int premium;
            try {
                premium = Integer.parseInt(request.getParameter("qq"));
            } catch (NumberFormatException e) {
                premium = 0;
            }
            int writer_id = Integer.parseInt(request.getParameter("writer"));
            System.out.println(premium);
            DAOAdmin d = new DAOAdmin();
            d.addArticle(title, abstract_article, content, categories_id, premium, writer_id);
            response.sendRedirect("/WebFinal/Writer/ShowArticle?id=" + writer_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void EditArticle(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            String id = request.getParameter("id");
            int i = Integer.parseInt(id);
            String title = request.getParameter("title");
            String abstract_article = request.getParameter("Tom_tat");
            int categories_id = Integer.parseInt(request.getParameter("cate"));
            int premium;
            try {
                premium = Integer.parseInt(request.getParameter("qq"));
            } catch (NumberFormatException e) {
                premium = 0;
            }
            int writer_id = Integer.parseInt(request.getParameter("writer"));
            String content = request.getParameter("content");
            DAOAdmin d = new DAOAdmin();
            d.editArticle(i, title, content, abstract_article,categories_id,premium);
            response.sendRedirect("/WebFinal/Writer/ShowArticle?id=" + writer_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
