package Model;

import java.time.LocalDateTime;

public class User {
    private String username, password, name, second_name, email, otp;
    private LocalDateTime issue_at, dob, otp_exp;
    private int id, role;

    public User() {
    }

    public User(int id, String username, String password, String name, LocalDateTime issue_at,  int role
            , String second_name, LocalDateTime dob, String email, String otp, LocalDateTime otp_exp) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.second_name = second_name;
        this.email = email;
        this.otp = otp;
        this.issue_at = issue_at;
        this.dob = dob;
        this.otp_exp = otp_exp;
        this.id = id;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSecond_name() {
        return second_name;
    }

    public void setSecond_name(String second_name) {
        this.second_name = second_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public LocalDateTime getIssue_at() {
        return issue_at;
    }

    public void setIssue_at(LocalDateTime issue_at) {
        this.issue_at = issue_at;
    }

    public LocalDateTime getDob() {
        return dob;
    }

    public void setDob(LocalDateTime dob) {
        this.dob = dob;
    }

    public LocalDateTime getOtp_exp() {
        return otp_exp;
    }

    public void setOtp_exp(LocalDateTime otp_exp) {
        this.otp_exp = otp_exp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
