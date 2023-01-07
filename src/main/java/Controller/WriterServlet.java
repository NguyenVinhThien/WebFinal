package Controller;


import DAO.DAOAdmin;
import Model.Articles;
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
        String path = request.getPathInfo();
        switch (path) {
            case "/ShowArticle": {
                int author = Integer.parseInt(request.getParameter("id"));
                List<Articles> list = d.getArticleByAuthor(author);
                if (list != null){
                System.out.println(list.get(0).getId_article());}
                String name = d.getUserName(author);
                request.setAttribute("listA", list);
                request.setAttribute("name", name);
                request.setAttribute("writer", author);
                request.getRequestDispatcher("/Writer.jsp").forward(request, response);
                break;
            }
            case "/DangBai": {
                String id= request.getParameter("id");
                int i= Integer.parseInt(id);
                request.setAttribute("author", i);
                ServletUtils.forward("/DangArticle.jsp", request, response);
                break;
            }
            case "/EditArticle":{
                String id= request.getParameter("id");
                int i= Integer.parseInt(id);
                Articles t= d.getArticle(i);
                request.setAttribute("article", t);
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
                AddArticle(request,response);
                break;
            }
        }
    }
    private void AddArticle(HttpServletRequest request, HttpServletResponse response){
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

