package DAO;


import Model.Articles;
import Model.Categories;
import Model.Tags;
import Model.User;
import Uti.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DAOAdmin {
    public List<Categories> getAllCategories()
    {
        List<Categories> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categories where parent_id is null");
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new Categories(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public List<Categories> getSubCategories()
    {
        List<Categories> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categories where parent_id is not null");
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new Categories(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public List<Articles> getArticleByCatId(int catId)
    {
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM articles where  categories_id = ?");
            ps.setInt(1,catId);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new Articles(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public Map<Articles,String> getTopHotArticle()
    {
        Map<Articles,String> list = new HashMap<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from (select a.*, b.name  from articles a INNER JOIN categories b on a.categories_id = b.id) as c where yearweek(publish_date, 1)= yearweek(curdate(), 1) order by views desc limit 3");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                list.put(new Articles(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)),rs.getString(11));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public Map<Articles,String> getArticleByView()
    {
        Map<Articles,String> list = new HashMap<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from (select a.*,b.name from articles a INNER JOIN categories b on a.categories_id = b.id) as c where current_date()>= c.publish_date order by views desc limit 10");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                list.put(new Articles(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)),rs.getString(11));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }

    public Map<Articles,String> getNewArticle()
    {
        Map<Articles,String> list = new HashMap<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from (select a.*,b.name from articles a INNER JOIN categories b on a.categories_id = b.id) as c where current_date()>= c.publish_date order by publish_date desc limit 10");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                list.put(new Articles(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)),rs.getString(11));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }

    public void deleteCategory(String id)
    {
        String query="DELETE FROM categories WHERE id= ? ";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public void addCategory(String id, String name)
    {
        String query="INSERT INTO categories (id,name) VALUES(?,?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,id);
            ps.setString(2,name);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public void editCategory(int id,String name)
    {
        String query="UPDATE categories\n"
                + "SET name = ?\r\n"
                + "WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,name);
            ps.setInt(2,id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public List<Tags> getAllTag()
    {
        List<Tags> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM tags");
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new Tags(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public void deleteTag(String id)
    {
        String query="DELETE FROM tags WHERE id= ? ";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public void addTag(String id, String name)
    {
        String query="INSERT INTO tags (id,value) VALUES(?,?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,id);
            ps.setString(2,name);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public void editTag(int id,String name)
    {
        String query="UPDATE tags\n"
                + "SET value = ?\r\n"
                + "WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,name);
            ps.setInt(2,id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public void addArticle(String title, String astract, String content, int cate, int premium, int writer)
    {
        String query="INSERT INTO articles (title,publish_date,views,abstract, content, categories_id, premium, writer_id, status) VALUES(?,null, 0, ?, ?, ?, ?, ?, 0)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, astract);
            ps.setString(3, content);
            ps.setInt(4,cate);
            ps.setInt(5,premium);
            ps.setInt(6,writer);

            //ps.setInt(5,premium);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public List<Categories> getAllSubCategories(int parent_id)
    {
        List<Categories> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categories where parent_id = ?");
            ps.setInt(1,parent_id);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new Categories(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public void addSubCategory(String id, String name,String parent_id)
    {
        String query="INSERT INTO categories (id,name,parent_id) VALUES(?,?,?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,id);
            ps.setString(2,name);
            ps.setString(3,parent_id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public void editSubCategory(int id,String name,int parent_id)
    {
        String query="UPDATE categories\n"
                + "SET name = ?, parent_id = ?\r\n"
                + "WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,name);
            ps.setInt(2,parent_id);
            ps.setInt(3,id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }

    public String getCategoryName(int parent_id)
    {
        String name = new String();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT categories.name FROM categories where id = ?");
            ps.setInt(1,parent_id);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                name = new String(rs.getString(1));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return name;
    }

    public Articles getArticle(int id)
    {
        Articles name = new Articles();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM articles where id = ?");
            ps.setInt(1,id);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                name = new Articles(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getInt(4),
                                    rs.getString(5),
                                     rs.getString(6),
                                    rs.getInt(7),
                                    rs.getInt(8),
                                    rs.getInt(9),
                                    rs.getInt(10));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return name;
    }

    public void editArticle(int id, String title, String content, String abstract_article)
    {
        String query="UPDATE articles\n"
                + "SET content = ?, title = ?, abstract = ?\r\n"
                + "WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,content);
            ps.setString(2,title);
            ps.setString(3,abstract_article);
            ps.setInt(4,id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public List<User> getAllUsersByExTend()
    {
        List<User> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users where issue_at is null");
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new User(rs.getInt(1),
                        null,
                        null,
                        rs.getString(4),
                        null,
                        rs.getInt(6),
                        rs.getInt(7),
                        null,
                        null,
                        null,
                        null,
                        null
                ));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public void UpdateUser(int id)
    {
        String query="UPDATE  users\n"
                + "SET issue_at = CURDATE() , expiration = expiration + 7\r\n"
                + "WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public List<User> getAllUsers()
    {
        List<User> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users where role != 4");
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        null,
                        rs.getString(4),
                        null,
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        null,
                        rs.getString(10),
                        null,
                        null
                ));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public void deleteUser(String id)
    {
        String query="DELETE FROM users WHERE id= ? ";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public List<Articles> getAllArticle()
    {
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM articles where status = 0 or status = 3");
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new Articles(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)))
                ;
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public List<Articles> getAllArticleByDraft()
    {
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM articles where status = 0");
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new Articles(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)))
                ;
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public List<Articles> getAllArticleByOk()
    {
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM articles where status = 3");
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new Articles(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10)))
                ;
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public void Ok(int id)
    {
        String query="UPDATE  articles\n"
                + "SET status = 3\r\n"
                + "WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public void deleteArticle(String id)
    {
        String query="DELETE FROM articles WHERE id= ? ";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
}