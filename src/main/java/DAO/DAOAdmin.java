package DAO;


import Model.Categories;
import Model.Tags;
import Uti.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
    public void addArticle(String title, String astract, String content)
    {
        String query="INSERT INTO articles (title,publish_date,views,abstract, content, categories_id, premium, writer_id, status) VALUES(?,null, 0, ?, ?, 11, 0, null, 0)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, astract);
            ps.setString(3, content);

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
}