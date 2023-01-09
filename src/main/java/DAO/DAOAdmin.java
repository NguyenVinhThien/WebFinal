package DAO;


import Model.*;
import Uti.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class DAOAdmin {
    public List<Categories> getAllMainCategories()
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
    public List<Categories> getAllMainCategoriesByEditor(int Editor_id)
    {
        List<Categories> list = new ArrayList<>();
        String query = "SELECT a.* \n"
                +"FROM categories a inner join editor_manage_categories b\n"
                +"on a.id = b.category_id\n"
                +"where a.parent_id is null and b.editor = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,Editor_id);
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
        public List<Categories> getAllCategories()
        {
            List<Categories> list = new ArrayList<>();
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = ConnectDB.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM categories");
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
    public List<ArticleHasCategories> getTopHotArticle(){
        List<ArticleHasCategories> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select a.*, c.name, c.parent_id from articles a inner join categories c on a.categories_id= c.id where yearweek(a.publish_date, 1)= yearweek(curdate() -7, 1) and a.publish_date<= current_date() order by a.views desc limit 3");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                list.add(new ArticleHasCategories(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getInt(12)));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
//    public Map<Articles,String> getArticleByView()
//    {
//        Map<Articles,String> list = new HashMap<>();
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = ConnectDB.getConnection();
//            PreparedStatement ps = con.prepareStatement("select * from (select a.*,b.name from articles a INNER JOIN categories b on a.categories_id = b.id) as c where current_date()>= c.publish_date order by views desc limit 10");
//            ResultSet rs = ps.executeQuery();
//            while(rs.next())
//            {
//                list.put(new Articles(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getInt(7),
//                        rs.getInt(8),
//                        rs.getInt(9),
//                        rs.getInt(10)),rs.getString(11));
//            }
//        }catch(Exception e)
//        {
//            e.getMessage();
//        }
//        return list;
//    }
    public List<ArticleHasCategories> getArticleByView()
    {
        List<ArticleHasCategories> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select a.*, c.name, c.parent_id from articles a inner join categories c on a.categories_id= c.id where a.publish_date <= current_date() order by a.views desc limit 10");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                list.add(new ArticleHasCategories(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getInt(12)));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;

    }

    public List<ArticleHasCategories> getNewArticle()
    {
        List<ArticleHasCategories> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select a.*, c.name, c.parent_id from articles a inner join categories c on a.categories_id= c.id where a.publish_date <= current_date() order by a.publish_date desc limit 10");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                list.add(new ArticleHasCategories(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getInt(12)));
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
    public void editTagHasArticles(int tag, int article)
    {
        String query="UPDATE tags_has_articles\n"
                + "SET tag_id = ?\r\n"
                + "WHERE article_id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,tag);
            ps.setInt(2,article);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public int getTagbyArticle(int i)
    {
        int id =0;
        String query="SELECT tag_id from tags_has_articles WHERE article_id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,i);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                id = rs.getInt(1);
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return id;
    }

    public int getTagID(String name)
    {
        int id =0;
        String query="SELECT id from tags WHERE value = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,name);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                id = rs.getInt(1);
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return id;
    }

    public String getTagname(int id)
    {
        String name = new String();
        String query="SELECT value from tags WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,id);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                name = rs.getString(1);
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return name;
    }

    public int getNewestArticleId()
    {
        int id = 0;
        String query="SELECT Max(id) from articles";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                id = rs.getInt(1);
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return id;
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
    public void setTag(int tag, int article)
    {
        String query="INSERT INTO tags_has_articles (article_id,tag_id) VALUES(?,?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,article);
            ps.setInt(2,tag);
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

    public void editArticle(int id, String title, String content, String abstract_article, int cate, int premium)
    {
        String query="UPDATE articles\n"
                + "SET content = ?, title = ?, abstract = ?, categories_id = ?, premium = ? \r\n "
                + "WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,content);
            ps.setString(2,title);
            ps.setString(3,abstract_article);
            ps.setInt(4,cate);
            ps.setInt(5,premium);
            ps.setInt(6,id);
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
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users where issue_at is null and role != 3");
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
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users where role != 3");
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
    public List<Articles> getAllArticle(String keyword,int page)
    {
        int offset = (page - 1) * 10;
        String query = "Select * from articles \n where title like \"%" + keyword + "%\"\n" + "and status = 0 or status = 2 " + "LIMIT 10" + " \n OFFSET " + Integer.toString(offset);
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
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
    public int Count(String keyword)
    {
        String query = "Select COUNT(*) as total from articles \n where title like \"%" + keyword + "%\"\n" + "and status = 0 or status = 2 " ;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt("total");
        }catch(Exception e)
        {
            e.getMessage();
        }
        return 0;
    }
    public List<Articles> getAllArticleByDraft(String keyword,int page)
    {
        int offset = (page - 1) * 10;
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("Select * from articles where title like \"%" + keyword + "%\"" + "and status = 0 \n" + "LIMIT 10" + " \n OFFSET " + Integer.toString(offset));
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
    public int Count1(String keyword)
    {
        String query = "Select COUNT(*) as total1 from articles \n where title like \"%" + keyword + "%\"\n" + "and status = 0";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt("total1");
        }catch(Exception e)
        {
            e.getMessage();
        }
        return 0;
    }
    public List<Articles> getAllArticleByOk(String keyword,int page)
    {
        int offset = (page - 1) * 10;
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("Select * from articles where title like \"%" + keyword + "%\"" + "and status = 2 \n" + "LIMIT 10" + " \n OFFSET " + Integer.toString(offset));
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
    public int Count2(String keyword)
    {
        String query = "Select COUNT(*) as total2 from articles \n where title like \"%" + keyword + "%\"\n" + "and status = 2";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt("total2");
        }catch(Exception e)
        {
            e.getMessage();
        }
        return 0;
    }
    public void Ok(int id)
    {
        String query="UPDATE  articles\n"
                + "SET status = 2 ,publish_date = CURRENT_TIMESTAMP()\r\n"
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
    public List<Articles> getArticleByAuthor(int authorID)
    {
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM articles where writer_id = ?");
            ps.setInt(1,authorID);
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

    public String getUserName(int id)
    {
        String name = new String();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT users.name FROM users where id = ?");
            ps.setInt(1,id);
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

    public List<Articles> getArticleOKByAuthor(int authorID)
    {
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM articles where writer_id = ? and status = 2");
            ps.setInt(1,authorID);
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

    public List<Articles> getArticleDraftByAuthor(int authorID)
    {
        List<Articles> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM articles where writer_id = ? and status != 2");
            ps.setInt(1,authorID);
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
    public List<Editor_Manage_Categories> getEditorCategories()
    {
        List<Editor_Manage_Categories> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT a.id,a.editor_id,a.category_id,b.name,c.name FROM ( editor_manage_categories a inner join users b ON a.editor_id = b.id ) inner join categories c ON a.category_id = c.id");
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                list.add(new Editor_Manage_Categories(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)
                ));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
    public void addEditor(String id, String editor_id,String category_id)
    {
        String query="INSERT INTO editor_manage_categories (id,editor_id,category_id) VALUES(?,?,?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,id);
            ps.setString(2,editor_id);
            ps.setString(3,category_id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public void deleteEditor(String id)
    {
        String query="DELETE FROM editor_manage_categories WHERE id = ? ";
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
    public void editEditor(int editor_id,int category_id,int id)
    {
        String query="UPDATE editor_manage_categories\n"
                + "SET category_id = ?,editor_id = ? \r\n"
                + "WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,category_id);
            ps.setInt(2,editor_id);
            ps.setInt(3,id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
    public static User findByUsername(String username) {
        final String query = "SELECT * FROM users WHERE username = ?";
        try (Connection con = ConnectDB.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            List<User> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5).toLocalDateTime(),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getTimestamp(9).toLocalDateTime(),
                        rs.getString(10),
                        null,
                        null
                ));
            }
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    public void addUser(String username, String password, String name, LocalDateTime issue_at, LocalDateTime dob, String email)
    {
        String query="INSERT INTO users (username, password, name, issue_at, expiration, role, second_name, dob, email, otp, otp_exp) VALUES(?, ?,?, ?, 0, 0, null, ?, ?, null, null)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, String.valueOf(issue_at));
            ps.setString(5, String.valueOf(dob));
            ps.setString(6, email);

            //ps.setInt(5,premium);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }

    public void updateUser(String username, String name, String second_name, LocalDateTime dob, String email)
    {
        String query="UPDATE  users\n"
                + "SET name = ?, second_name = ?, dob = ?, email = ?\r\n"
                + "WHERE username = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2,second_name);
            ps.setString(3, String.valueOf(dob));
            ps.setString(4,email);
            ps.setString(5,username);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }

    public void updateArticle(int id, LocalDateTime dt, String txt, int status)
    {
        String query="UPDATE  articles\n"
                + "SET status = ? ,publish_date = ?, note = ?\r\n"
                + "WHERE id = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1,status);
            ps.setString(2, String.valueOf(dt));
            ps.setString(3, txt);
            ps.setInt(4,id);
            ps.executeUpdate();
            con.close();
        }catch(Exception e)
        {
            e.getStackTrace();
        }
    }
}