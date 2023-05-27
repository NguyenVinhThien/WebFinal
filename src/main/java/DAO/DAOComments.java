package DAO;

import Model.ArticleHasCategories;
import Model.ArticleHasTag;
import Uti.ConnectDB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOComments {

    public void addComment(int article_id, int user_id, String comment, Date date){
        String query= "insert into comments(article_id, user_id, comment, date) values(?, ?, ?, ?)";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps= con.prepareStatement(query);
            ps.setInt(1, article_id);
            ps.setInt(2, user_id);
            ps.setString(3, comment);
            ps.setDate(4, date);
            ps.executeUpdate();
            con.close();
        }catch(Exception e){
            e.getStackTrace();
        }
    }
    public List<ArticleHasCategories> searchTitle(String key_word){
        List<ArticleHasCategories> list= new ArrayList<>();
        String query="SELECT a.id, a.title, a.publish_date, a.views, a.abstract, a.content, a.categories_id, a.premium, a.writer_id, a.status, c.name, c.parent_id, a.headline_image FROM articles a inner join categories c on a.categories_id= c.id WHERE MATCH(title) AGAINST (?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,key_word);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                list.add(new ArticleHasCategories(
                        rs.getInt(1),
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
                        rs.getInt(12),
                        rs.getString(13)));
            }
        }catch(Exception e)
        {
            e.getMessage();
        }
        return list;
    }
}
