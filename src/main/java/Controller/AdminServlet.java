package Controller;


import DAO.DAOAdmin;
import Model.Articles;
import Model.Categories;
import Model.Tags;
import Model.User;
import Uti.ServletUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name="Admin",urlPatterns = "/Admin/*")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
            case "/User/UserExtend": {
                request.setCharacterEncoding("UTF-8");
                List<User> userList = d.getAllUsersByExTend();
                request.setAttribute("listU", userList);
                RequestDispatcher rd = request.getRequestDispatcher("/Giahan.jsp");
                rd.forward(request, response);
                break;
            }
            case "/User/ShowUser": {
                request.setCharacterEncoding("UTF-8");
                List<User> list = d.getAllUsers();
                request.setAttribute("list", list);
                request.getRequestDispatcher("/Users.jsp").forward(request, response);
                break;
            }
            case "/Category/ShowCategory": {
                request.setCharacterEncoding("UTF-8");
                List<Categories> list = d.getAllMainCategories();
                request.setAttribute("listP", list);
                request.getRequestDispatcher("/SuaCategory.jsp").forward(request, response);
                break;
            }
            case "/Category/ThemCategory": {
                request.getRequestDispatcher("/Category.jsp").forward(request, response);
                break;
            }
            case "/Tag/ThemTag": {
                request.getRequestDispatcher("/ThemTag.jsp").forward(request, response);
                break;
            }
            case "/Tag/ShowTag": {
                request.setCharacterEncoding("UTF-8");
                List<Tags> list = d.getAllTag();
                request.setAttribute("listT", list);
                request.getRequestDispatcher("/Tag.jsp").forward(request, response);
                break;
            }
            case "/Category/ShowSubCategory": {
                request.setCharacterEncoding("UTF-8");
                int parent_id = Integer.parseInt(request.getParameter("id"));
                String name = d.getCategoryName(parent_id);
                List<Categories> list = d.getAllSubCategories(parent_id);
                request.setAttribute("listS", list);
                request.setAttribute("name", name);
                request.getRequestDispatcher("/SubCategory.jsp").forward(request, response);
                break;
            }
            case "/Category/DeleteCategory":{
                DeleteCategory(request,response);
                break;
            }
            case "/Category/DeleteSubCategory":{
                DeleteSubCategory(request,response);
                break;
            }
            case "/Tag/DeleteTag":{
                DeleteTag(request,response);
                break;
            }
            case "/User/Expire":{
                ExpireUser(request,response);
                break;
            }
            case "/BaiViet/Ok":{
                Ok(request,response);
                break;
            }
            case "/BaiViet/DeleteArticle":{
                DeleteArticle(request,response);
                break;
            }
            case "/User/DeleteUser":{
                DeleteUser(request,response);
                break;
            }
            case "/BaiViet/ShowBaiVietDraft": {
                request.setCharacterEncoding("UTF-8");
                String keyword = request.getParameter("keyword");
                if(keyword == null)
                {
                    keyword ="";
                }
                int page = 1;
                if(request.getParameter("page") != null && request.getParameter("page") != "")
                {
                    page = Integer.parseInt(request.getParameter("page"));
                }
                int total1 = d.Count1(keyword);
                int totalpage = (int) Math.ceil((float)total1/(float)10);
                List<Articles> list = d.getAllArticleByDraft(keyword,page);
                request.setAttribute("list", list);
                request.setAttribute("total1", total1);
                request.setAttribute("totalpage", totalpage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("/BaiVietDraft.jsp").forward(request, response);
                break;
            }
            case "/BaiViet/ShowBaiViet": {
                request.setCharacterEncoding("UTF-8");
                String keyword = request.getParameter("keyword");
                if(keyword == null)
                {
                    keyword ="";
                }
                int page = 1;
                if(request.getParameter("page") != null && request.getParameter("page") != "")
                {
                    page = Integer.parseInt(request.getParameter("page"));
                }
                int total = d.Count(keyword);
                int total1 = d.Count1(keyword);
                int total2 = d.Count2(keyword);
                int totalpage = (int) Math.ceil((float)total/(float)10);
                List<Articles> list = d.getAllArticle(keyword,page);
                request.setAttribute("list", list);
                request.setAttribute("total", total);
                request.setAttribute("total1", total1);
                request.setAttribute("total2", total2);
                request.setAttribute("totalpage", totalpage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("/BaiViet.jsp").forward(request, response);
                break;
            }
            case "/BaiViet/ShowBaiVietOk": {
                request.setCharacterEncoding("UTF-8");
                String keyword = request.getParameter("keyword");
                if(keyword == null)
                {
                    keyword ="";
                }
                int page = 1;
                if(request.getParameter("page") != null && request.getParameter("page") != "")
                {
                    page = Integer.parseInt(request.getParameter("page"));
                }
                int total2 = d.Count2(keyword);
                int totalpage = (int) Math.ceil((float)total2/(float)10);
                request.setAttribute("total2", total2);
                request.setAttribute("total2", total2);
                List<Articles> list = d.getAllArticleByOk(keyword,page);
                request.setAttribute("list", list);
                request.setAttribute("totalpage", totalpage);
                request.setAttribute("page", page);
                request.getRequestDispatcher("/BaiVietOk.jsp").forward(request, response);
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
            case "/Category/AddCategory": {
                AddCategory(request,response);
                break;
            }
            case "/Category/EditCategory": {
               EditCategory(request,response);
               break;
            }
            case "/Tag/AddTag": {
                AddTag(request,response);
                break;
            }
            case "/Tag/EditTag": {
                EditTag(request,response);
                break;
            }
            case "/Category/AddSubCategory": {
                AddSubCategory(request,response);
                break;
            }
            case "/Category/EditSubCategory": {
                EditSubCategory(request,response);
                break;
            }
        }
    }
    private void AddCategory(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
            DAOAdmin d = new DAOAdmin();
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            d.addCategory(id, name);
            response.sendRedirect("/WebFinal/Admin/Category/ThemCategory");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void EditCategory(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
            DAOAdmin d = new DAOAdmin();
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            int i = Integer.parseInt(id);
            d.editCategory(i, name);
            response.sendRedirect("/WebFinal/Admin/Category/ShowCategory");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void DeleteCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id =request.getParameter("id");
        DAOAdmin dao = new DAOAdmin();
        dao.deleteCategory(id);
        response.sendRedirect("/WebFinal/Admin/Category/ShowCategory");
    }
    private void AddTag(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
            String id= request.getParameter("id");
            String name= request.getParameter("name");
            DAOAdmin d= new DAOAdmin();
            d.addTag(id, name);
            response.sendRedirect("/WebFinal/Admin/Tag/ThemTag");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    private void DeleteTag(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String id =request.getParameter("id");
        DAOAdmin dao = new DAOAdmin();
        dao.deleteTag(id);
        response.sendRedirect("/WebFinal/Admin/Tag/ShowTag");
    }
    private void EditTag(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
            String id= request.getParameter("id");
            String name= request.getParameter("name");
            int i= Integer.parseInt(id);
            DAOAdmin d= new DAOAdmin();
            d.editTag(i,name);
            response.sendRedirect("/WebFinal/Admin/Tag/ShowTag");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    private void DeleteSubCategory(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String id =request.getParameter("id");
        DAOAdmin dao = new DAOAdmin();
        dao.deleteCategory(id);
        response.sendRedirect("/WebFinal/Admin/Category/ShowCategory");
    }
    private void AddSubCategory(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
            String id= request.getParameter("id");
            String name= request.getParameter("name");
            String parent_id= request.getParameter("parent_id");
            DAOAdmin d= new DAOAdmin();
            d.addSubCategory(id,name,parent_id);
            response.sendRedirect("/WebFinal/Admin/Category/ThemCategory");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    private void EditSubCategory(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
            String id= request.getParameter("id");
            String name= request.getParameter("name");
            String parent_id = request.getParameter("parent_id");
            int i= Integer.parseInt(id);
            int pid = Integer.parseInt(parent_id);
            DAOAdmin d= new DAOAdmin();
            d.editSubCategory(i,name,pid);
            response.sendRedirect("/WebFinal/Admin/Category/ShowCategory");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    private void ExpireUser(HttpServletRequest request, HttpServletResponse response){
        try {
            String id= request.getParameter("id");
            int i= Integer.parseInt(id);
            DAOAdmin d= new DAOAdmin();
            d.UpdateUser(i);
            response.sendRedirect("/WebFinal/Admin/User/UserExtend");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    private void Ok(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
            String id= request.getParameter("id");
            int i= Integer.parseInt(id);
            DAOAdmin d= new DAOAdmin();
            d.Ok(i);
            response.sendRedirect("/WebFinal/Admin/BaiViet/ShowBaiVietDraft");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    private void DeleteArticle(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String id =request.getParameter("id");
        DAOAdmin dao = new DAOAdmin();
        dao.deleteArticle(id);
        response.sendRedirect("/WebFinal/Admin/BaiViet/ShowBaiViet");
    }
    private void DeleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String id =request.getParameter("id");
        DAOAdmin d = new DAOAdmin();
        d.deleteUser(id);
        response.sendRedirect("/WebFinal/Admin/User/ShowUser");
    }
}

