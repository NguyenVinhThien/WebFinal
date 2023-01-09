<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="authUser" scope="session" type="Model.User"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thong Tin Ca Nhan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"
          integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS_ALL/ThongTinCaNhan.css">

</head>
<body>
<%----%>
<form action="" method="post">
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center ">
                    <img class="rounded-circle mt-5" width="150px"
                         src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                    <span class="font-weight-bold">${authUser.name}</span>
                    <span class="text-black-50">${authUser.email}</span>
                </div>
                <div class="join_date">
                    <p>Tham gia từ<br>
                        ${authUser.issue_at}</p>
                </div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-4">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Thông tin cá nhân</h4>
                    </div>


                    <div class="row mt-3">
                        <div class="col-md-12"><label class="labels">Username </label><input
                                type="text"
                                class="form-control"
                                name="username"
                                placeholder="Tên tài khoản"
                                value="${authUser.username}"
                                readonly>
                        </div>
                        <div class="col-md-12"><label class="labels">Họ và Tên</label><input
                                type="text"
                                class="form-control"
                                name="name"
                                placeholder="Họ và tên"
                                value="${authUser.name}">
                        </div>
                        <div class="col-md-12"><label class="labels">Bút danh</label><input
                                type="text"
                                class="form-control"
                                name="second_name"
                                placeholder="Bút danh"
                                value="${authUser.second_name}">
                        </div>
                        <div class="col-md-12"><label class="labels" >Ngày sinh</label><input
                                type="text"
                                class="form-control"
                                name="dob"
                                value="${authUser.dob}"
                                min="1922-12-31"
                                max="2022-12-31"></div>
                        <div class="col-md-12"><label class="labels">Email</label><input type="email"
                                                                                                        class="form-control"
                                                                                                        name="email"
                                                                                                        placeholder="Nhập Email"
                                                                                                        value="${authUser.email}">
                        </div>
                        <div class="col-md-12"><label class="labels">Mật khẩu</label><input type="password"
                                                                                            class="form-control"
                                                                                            value="********"
                                                                                            readonly>
                            <a href="#" class="btn_change_password">Đổi mật khẩu</a>
                        </div>
                    </div>
                    <div class="message">
                        <p>${message}</p>
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
                            <input type="text" class="form-control"
                                   placeholder="Tên tài khoản"
                            <c:if test="${authUser.role eq 0}">
                                   value="Subscriber"
                            </c:if>
                            <c:if test="${authUser.role eq 1}">
                                   value="Writer"
                            </c:if>
                            <c:if test="${authUser.role eq 2}">
                                   value="Editor"
                            </c:if>
                            <c:if test="${authUser.role eq 3}">
                                   value="Admin"
                            </c:if>
                                   readonly>
                        </div>
                    </div>
                    <div class="mt-3 text-center">
                        <a href="${pageContext.request.contextPath}/TrangChu" class="btn btn-primary profile-button">Về Trang Chủ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
        integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $(`#txtDOB`).datetimepicker({
        format: 'd/m/Y',
        timepicker: false,
        mask: true
    });
</script>
</body>
</html>
