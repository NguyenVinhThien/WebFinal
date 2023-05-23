package DAO;

import Uti.ConnectDB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

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
}
