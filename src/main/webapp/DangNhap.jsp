<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 02/01/2023
  Time: 3:08 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="./CSS_ALL/DangNhap.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="login-container">
    <form>
        <h1>Đăng nhập</h1>
        <div class="form-group">
            <label for="username">Tài khoản</label>
            <input type="text" id="username" placeholder="Nhập tài khoản" required>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" placeholder="Nhập mật khẩu" required>
        </div>
        <div class="forgot_change-password">
            <!-- Phần quên mật khẩu -->
            <div class="form-group">
                <a href="#" class="forgot-password">Quên mật khẩu</a>
            </div>
            <!-- Phần đổi mật khẩu -->
            <div class="form-group">
                <a href="#" class="forgot-password">Đổi mật khẩu</a>
            </div>
        </div>
        <button type="submit" class="btn btn-primary btn-block" onclick="validateLogin()">Đăng nhập</button>

        <div class="form-group">
            <a href="#" class="signup-link">Chưa có tài khoản? Đăng ký ngay</a>
        </div>
        <div class="or-separator">
            <span>hoặc</span>
        </div>
        <button class="btnn facebook" data-provider="facebook"><i class="fab fa-facebook-f"></i><span>Đăng nhập bằng Facebook</span></button>
        <button class="btnn google" data-provider="google"><i class="fab fa-google"></i><span>Đăng nhập bằng Google</span></button>
    </form>
</div>

</body>
</html>
