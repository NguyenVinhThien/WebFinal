<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 02/01/2023
  Time: 3:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Gia hạn tài khoản</title>
  <link rel="stylesheet" href="./CSS_ALL/GiaHanTaiKhoan.css">
</head>
<body>
<div class="account-renewal-container">
  <form>
    <h1>Gia hạn tài khoản</h1>
    <div class="form-group">
      <label for="username">Tài khoản</label>
      <input type="text" id="username" placeholder="Nhập tài khoản" required>
    </div>
    <div class="form-group">
      <label for="password">Mật khẩu</label>
      <input type="password" id="password" placeholder="Nhập mật khẩu" required>
    </div>
    <button type="submit" class="btn btn-primary btn-block" >Gia Hạn</button>
  </form>
</div>
</body>
</html>
