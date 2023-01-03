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
  <title>Đăng ký</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" type="text/css" href="./CSS_ALL/DangKy.css">
<%--  <style>--%>
<%--    /* Định dạng toàn trang */--%>
<%--    body {--%>
<%--      background-color: #f1f1f1;--%>
<%--      font-family: Arial, sans-serif;--%>
<%--    }--%>
<%--    .form-container {--%>
<%--      display: flex;--%>
<%--      flex-direction: column;--%>
<%--      justify-content: center;--%>
<%--      align-items: center;--%>
<%--      width: 500px;--%>
<%--      margin: 0 auto;--%>
<%--      padding: 20px;--%>
<%--      border: 1px solid #ccc;--%>
<%--      box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);--%>
<%--      border-radius: 5px;--%>
<%--      background-color: white;--%>
<%--    }--%>

<%--    .form-container h1{--%>
<%--      padding: 0;--%>
<%--      font-size: 26px;--%>
<%--      font-weight: normal;--%>
<%--      color: #555;--%>
<%--      text-align: center;--%>
<%--      margin: 0 0 20px;--%>
<%--    }--%>

<%--    .form-container label {--%>
<%--      display: block;--%>
<%--      margin-bottom: 8px;--%>
<%--      font-size: 16px;--%>
<%--      color: #555;--%>
<%--    }--%>
<%--    .form-container input[type="text"],--%>
<%--    .form-container input[type="email"],--%>
<%--    .form-container input[type="password"]--%>
<%--      /*.form-container input[type="date"] */--%>
<%--    {--%>
<%--      width: 100%;--%>
<%--      padding: 12px 20px;--%>
<%--      margin-bottom: 10px;--%>
<%--      box-sizing: border-box;--%>
<%--      border: 2px solid #ccc;--%>
<%--      border-radius: 4px;--%>
<%--      font-size: 16px;--%>
<%--    }--%>
<%--    .form-container button[type="submit"] {--%>
<%--      width: 100%;--%>
<%--      background-color: #2fa1b3;--%>
<%--      color: white;--%>
<%--      padding: 14px 20px;--%>
<%--      margin-bottom: 20px;--%>
<%--      border: none;--%>
<%--      border-radius: 4px;--%>
<%--      cursor: pointer;--%>
<%--      font-size: 16px;--%>
<%--    }--%>
<%--    .form-container button[type="submit"]:hover {--%>
<%--      background-color: #2fa1b3;--%>
<%--      transform: scale(1.03);--%>
<%--    }--%>
<%--    .form-container .terms {--%>
<%--      font-size: 14px;--%>
<%--      margin-bottom: 20px;--%>
<%--      color: darkgrey;--%>
<%--    }--%>

<%--    .terms a{--%>
<%--      color: #2D9CDB;--%>
<%--      text-decoration: none;--%>
<%--    }--%>

<%--    .error {--%>
<%--      color: red;--%>
<%--      font-size: 14px;--%>
<%--    }--%>

<%--  </style>--%>
</head>
<body>
<div class="form-container">
  <h1>Đăng Ký</h1>
  <form action="./TrangChu.jsp" method="post" id="frmRegister" onsubmit="return checkPassword();">
    <label for="txtUsername">Username</label>
    <input type="text" id="txtUsername" name="username" placeholder="Nhập tài khoản" required>
    <label for="txtName">Họ và Tên</label>
    <input type="text" id="txtName" name="name" placeholder="Nhập họ tên" required>
    <label for="txtEmail">Email</label>
    <input type="email" id="txtEmail" name="email" placeholder="Nhập email" required>
    <label for="txtDOB">Ngày sinh</label>
    <input type="text" id="txtDOB" name="dob" placeholder="Nhập ngày sinh" required>
    <label for="txtPassword">Mật khẩu</label>
    <input type="password" id="txtPassword" name="rawpdw" placeholder="Nhập mật khẩu" required>
    <label for="txtConfirm">Xác nhận mật khẩu</label>
    <input type="password" id="txtConfirm" placeholder="Xác nhận mật khẩu" required>
    <div class="terms">
      Khi bấm tạo tài khoản bạn đã đồng ý với
      <a href="#" class="rule">quy định</a>
      của tòa soạn
    </div>
    <div id="password-error" class="error"></div>
    <button type="submit">Tạo tài khoản</button>
  </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
  $(`#frmRegister`).on('submit', function (e) {
    e.preventDefault();

    // const username = $('#txtUsername').val();
    // if (username.length === 0) {
    //   alert('Invalid username.');
    //   return;
    // }

    $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?user=' + username, function (data) {
      if (data === true) {
        $('#frmRegister').off('submit').submit();
      } else {
        alert('Username is not available.');
      }
    });
  });

  $(`#txtDOB`).datetimepicker({
    format: 'd/m/Y',
    timepicker: false,
    mask: true
  });

  $('#txtUsername').select();
</script>
<script>
  function checkPassword() {
    // Get the password and confirm password fields
    const password = document.getElementById('txtPassword');
    const confirmPassword = document.getElementById('txtConfirm');

    // Get the error message element
    const errorMessage = document.getElementById('password-error');

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
