package DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Categories;
import Model.Tags;
import Uti.ConnectDB;

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
}

