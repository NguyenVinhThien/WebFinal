package Model;

import Uti.ConnectDB;
import beans.User;
import org.sql2o.Connection;

import java.sql.SQLException;
import java.util.List;

public class UserModel {
    public static User findByUsername(String username) throws SQLException {
        final String query = "select * from users where username = :username";
        try (Connection con = (Connection) ConnectDB.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static void add(User c) {
        String insertSql = "INSERT INTO users (username, password, name, issue_at, expiration, role, second_name, dob, email, otp, otp_exp) " +
                "VALUES (:username,:password,:name,:issue_at, :expiration,:role,:second_name,:dob,:email,:otp,:otp_exp)";
        try (Connection con = (Connection) ConnectDB.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("username", c.getUsername())
                    .addParameter("password", c.getPassword())
                    .addParameter("name", c.getName())
                    .addParameter("issue_at", c.getIssue_at())
                    .addParameter("expiration", c.getExpiration())
                    .addParameter("role", c.getRole())
                    .addParameter("second_name", c.getSecond_name())
                    .addParameter("dob", c.getDob())
                    .addParameter("email", c.getEmail())
                    .addParameter("otp", c.getOtp())
                    .addParameter("otp_exp", c.getOtp_exp())
                    .executeUpdate();
        }
    }
}
