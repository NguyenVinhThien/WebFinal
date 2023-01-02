<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 02/01/2023
  Time: 3:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Account Registration</title>
  <link rel="stylesheet" type="text/css" href="./CSS_ALL/DangKy.css">
</head>
<body>
<div class="form-container">
  <h1>Đăng Ký</h1>
  <form action="/register" method="post" onsubmit="return checkPassword();">
    <label for="account">Username</label>
    <input type="text" id="account" name="account" placeholder="Nhập tài khoản" required>
    <label for="full-name">Họ và Tên</label>
    <input type="text" id="full-name" name="full-name" placeholder="Nhập họ tên" required>
    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Nhập email" required>
    <label for="dob">Ngày sinh</label>
    <input type="date" id="dob" name="dob" placeholder="Nhập ngày sinh" required>
    <label for="password">Mật khẩu</label>
    <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
    <label for="confirm-password">Xác nhận mật khẩu</label>
    <input type="password" id="confirm-password" name="confirm-password" placeholder="Xác nhận mật khẩu" required>
    <div class="terms">
      Khi bấm tạo tài khoản bạn đã đồng ý với
      <a href="#" class="rule">quy định</a>
      của tòa soạn
    </div>
    <div id="password-error" class="error"></div>
    <input type="submit" value="Tạo tài khoản">
  </form>
</div>
<script>
  function checkPassword() {
    // Get the password and confirm password fields
    var password = document.getElementById('password');
    var confirmPassword = document.getElementById('confirm-password');

    // Get the error message element
    var errorMessage = document.getElementById('password-error');

    // Check if the password and confirm password fields are the same
    if (password.value !== confirmPassword.value) {
      // If they are not the same, display an error message
      errorMessage.innerHTML = 'The password and confirm password fields do not match';
      return false;
    } else {
      // If they are the same, clear the error message and allow the form to be submitted
      errorMessage.innerHTML = '';
      return true;
    }
  }
</script>
</body>
</html>
