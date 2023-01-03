package Model;

import Uti.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;

public class UserModel {
//    public static User findByUsername(String username) throws SQLException {
//        final String query = "select * from users where username = :username";
//        try (Connection con = (Connection) ConnectDB.getConnection()) {
//            List<User> list = con.createQuery(query)
//                    .addParameter("username", username)
//                    .executeAndFetch(User.class);
//
//            if (list.size() == 0) {
//                return null;
//            }
//
//            return list.get(0);
//        }
//    }

//    public static void add(User c) {
//        String insertSql = "INSERT INTO users (username, password, name, issue_at, expiration, role, second_name, dob, email, otp, otp_exp) " +
//                "VALUES (:username,:password,:name,:issue_at, :expiration,:role,:second_name,:dob,:email,:otp,:otp_exp)";
//        try (Connection con = (Connection) ConnectDB.getConnection()) {
//            con.createQuery(insertSql)
//                    .addParameter("username", c.getUsername())
//                    .addParameter("password", c.getPassword())
//                    .addParameter("name", c.getName())
//                    .addParameter("issue_at", c.getIssue_at())
//                    .addParameter("expiration", c.getExpiration())
//                    .addParameter("role", c.getRole())
//                    .addParameter("second_name", c.getSecond_name())
//                    .addParameter("dob", c.getDob())
//                    .addParameter("email", c.getEmail())
//                    .addParameter("otp", c.getOtp())
//                    .addParameter("otp_exp", c.getOtp_exp())
//                    .executeUpdate();
//        }
//    }
public void addUser(String username, String password, String name, LocalDateTime dob, String email)
{
    String query="INSERT INTO users (username, password, name, issue_at, expiration, role, second_name, dob, email, otp, otp_exp) VALUES(?, ?,?, null, 0, 0, null, ?, ?, null, null)";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = ConnectDB.getConnection();
        PreparedStatement ps= con.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, name);
        ps.setString(4, String.valueOf(dob));
        ps.setString(5, email);

        //ps.setInt(5,premium);
        ps.executeUpdate();
        con.close();
    }catch(Exception e)
    {
        e.getStackTrace();
    }
}
}
