package Model;

import Uti.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


public class UserModel {
    public static User findByUsername(String username) {
        final String query = "SELECT * FROM users WHERE username = ?";
        try (Connection con = ConnectDB.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            List<User> list = new ArrayList<>();
            while (rs.next()) {
//                User user = new User();
//                // set user fields from ResultSet
//                user.setUsername(rs.getString("username"));
//                user.setPassword(rs.getString("password"));
//                user.setName(rs.getString("name"));
//                user.setSecond_name(rs.getString("second_name"));
//                user.setEmail(rs.getString("email"));
//                user.setOtp(rs.getString("otp"));
//                user.setIssue_at(rs.getTimestamp("issue_at").toLocalDateTime());
//                user.setDob(rs.getTimestamp("dob").toLocalDateTime());
//                user.setOtp_exp(rs.getTimestamp("otp_exp").toLocalDateTime());
//                user.setId(rs.getInt("id"));
//                user.setExpiration(rs.getInt("expiration"));
//                user.setRole(rs.getInt("role"));
//
//                list.add(user);
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        null,
                        rs.getInt(6),
                        rs.getInt(7),
                        null,
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
