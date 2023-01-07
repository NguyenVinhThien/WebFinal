<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 02/01/2023
  Time: 3:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="authUser" scope="session" type="Model.User"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Thong Tin Ca Nhan</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <!--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS_ALL/ThongTinCaNhan.css">

</head>
<body>
<form action="">
  <div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
      <div class="col-md-3 border-right">
        <div class="d-flex flex-column align-items-center text-center ">
          <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
          <span class="font-weight-bold">Do Trung Duc</span>
          <span class="text-black-50">ducdt2192@gmail.com</span>
        </div>
        <div class="join_date">
          <p>Tham gia từ<br>27/12/2022</p>
        </div>
      </div>
      <div class="col-md-5 border-right">
        <div class="p-3 py-4">
          <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="text-right">Thông tin cá nhân</h4>
          </div>

          <div class="row mt-3">
            <div class="col-md-12"><label class="labels">Username</label><input type="text" class="form-control"
                                                                                placeholder="Tên tài khoản"
                                                                                value="${authUser.username}">
            </div>
            <div class="col-md-12"><label class="labels">Họ và Tên</label><input type="text"
                                                                                 class="form-control"
                                                                                 placeholder="Họ và tên"
                                                                                 value="${authUser.name}"></div>
            <div class="col-md-12"><label class="labels">Bút danh</label><input type="text"
                                                                                class="form-control"
                                                                                placeholder="Bút danh"
                                                                                value="${authUser.second_name}"></div>
            <div class="col-md-12"><label class="labels">Ngày sinh</label><input type="date"
                                                                                 class="form-control"
                                                                                 value="${authUser.dob}" min="1922-12-31" max="2022-12-31"></div>
            <div class="col-md-12"><label class="labels">Email</label><input type="email" class="form-control"
                                                                             placeholder="Nhập Email"
                                                                             value="${authUser.email}"></div>
            <div class="col-md-12"><label class="labels">Mật khẩu</label><input type="password"
                                                                                class="form-control"
                                                                                value="********" readonly>
              <a href="#" class="btn_change_password">Đổi mật khẩu</a>
            </div>
          </div>
          <div class="mt-3 text-center">
            <button class="btn btn-primary profile-button" type="submit">Lưu Thay Đổi</button>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="p-3 py-4">
          <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="text-right">Vai trò</h4>
          </div>
          <div class="row mt-3">
            <div class="col-md-12">
              <label class="labels">Vai trò người dùng</label>
              <select class="form-control">
                <option value="0">Reader</option>
                <option value="1">Writer</option>
                <option value="2">Editor</option>
                <option value="3">Admin</option>
              </select>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>

<!--<script src="https://code.jquery.com/jquery-3.6.1.min.js" crossorigin="anonymous"></script>-->
<!--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"-->
<!--        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"-->
<!--        crossorigin="anonymous"></script>-->
<!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"-->
<!--        integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"-->
<!--        crossorigin="anonymous"></script>-->
</body>
</html>
