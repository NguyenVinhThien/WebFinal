package Controller;


import DAO.DAOAdmin;
import DAO.DAOArticles;
import Model.Articles;
import Model.Categories;
import Uti.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name="Writer",urlPatterns = "/Writer/*")
public class WriterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOAdmin d = new DAOAdmin();
        DAOArticles da= new DAOArticles();
        String path = request.getPathInfo();
        switch (path) {
            case "/Home":
            case "/ShowArticle": {
                int author = Integer.parseInt(request.getParameter("id"));
                List<Articles> list = d.getArticleByAuthor(author);
                List<Categories> cate = d.getAllCategories();
                String name = d.getUserName(author);
                request.setAttribute("listA", list);
                request.setAttribute("listC", cate);
                request.setAttribute("name", name);
                request.setAttribute("writer", author);
                request.setAttribute("path","");
                request.getRequestDispatcher("/Writer.jsp").forward(request, response);
                break;
            }

            case "/ShowArticle/Ok": {
                int author = Integer.parseInt(request.getParameter("id"));
                List<Articles> list = d.getArticleOKByAuthor(author);
                List<Categories> cate = d.getAllCategories();
                String name = d.getUserName(author);
                request.setAttribute("listA", list);
                request.setAttribute("listC", cate);
                request.setAttribute("name", name);
                request.setAttribute("writer", author);
                request.setAttribute("path"," đã duyệt");
                request.getRequestDispatcher("/Writer.jsp").forward(request, response);
                break;
            }

            case "/ShowArticle/Draft": {
                int author = Integer.parseInt(request.getParameter("id"));
                List<Articles> list = d.getArticleDraftByAuthor(author);
                List<Categories> cate = d.getAllCategories();
                String name = d.getUserName(author);
                request.setAttribute("listA", list);
                request.setAttribute("listC", cate);
                request.setAttribute("name", name);
                request.setAttribute("writer", author);
                request.setAttribute("path","chưa được duyệt");
                request.getRequestDispatcher("/Writer.jsp").forward(request, response);
                break;
            }
            case "/DangBai": {
                String id = request.getParameter("id");
                int i = Integer.parseInt(id);
                List<Categories> cate = d.getAllCategories();
                request.setAttribute("listC", cate);
                request.setAttribute("author", i);
                ServletUtils.forward("/DangArticle.jsp", request, response);
                break;
            }
            case "/EditArticle": {
                String id = request.getParameter("id");
                int i = Integer.parseInt(id);
                Articles t = da.getArticle(i);
                String tag = d.getTagname(d.getTagbyArticle(i));
                System.out.println(tag);
                System.out.println(d.getTagbyArticle(i));
                List<Categories> cate = d.getAllCategories();
                request.setAttribute("listC", cate);
                request.setAttribute("article", t);
                request.setAttribute("tag", tag);
                request.getRequestDispatcher("/EditArticle.jsp").forward(request, response);
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
            request.setCharacterEncoding("UTF-8");
            String title = request.getParameter("title");
            String headline = request.getParameter("headline_image");
            String abstract_article = request.getParameter("Tom_tat");
            String content = request.getParameter("content");
            String tag = request.getParameter("Nhan");
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
            if (d.getTagID(tag) == 0 && tag != null)
                d.addTag(null,tag);
            d.addArticle(title, headline, abstract_article, content, categories_id, premium, writer_id);
            d.setTag(d.getTagID(tag),d.getNewestArticleId());
            response.sendRedirect("/Writer/Home?id=" + writer_id);
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
            String headline_image = request.getParameter("headline_image");
            String abstract_article = request.getParameter("Tom_tat");
            String tag = request.getParameter("Nhan");
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
            if (d.getTagID(tag) == 0 && tag != null)
                d.addTag(null,tag);
            d.editArticle(i, title, headline_image, content, abstract_article,categories_id,premium);
            d.editTagHasArticles(d.getTagID(tag),i);
            response.sendRedirect("/Writer/Home?id=" + writer_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

