
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS_ALL/DangNhap.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="login-container">
    <h1>Đăng nhập</h1>
    <c:if test="${hasError}">
        <div class="alert" role="alert">
            <strong>Login failed!</strong> ${errorMessage}
        </div>
    </c:if>
    <form action="" method="POST" id="frmLogin">
        <div class="form-group">
            <label for="txtUsername">Tài khoản</label>
            <input type="text" id="txtUsername" name="username" placeholder="Nhập tài khoản" required>
        </div>
        <div class="form-group">
            <label for="txtPassword">Mật khẩu</label>
            <input type="password" id="txtPassword" name="password" placeholder="Nhập mật khẩu" required>
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
        <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>

        <div class="form-group">
            <a href="${pageContext.request.contextPath}/Account/DangKy" class="signup-link">Chưa có tài khoản? Đăng ký ngay</a>
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
