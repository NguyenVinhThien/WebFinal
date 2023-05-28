<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 1/2/2023
  Time: 12:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listCat" scope="request" type="java.util.List<Model.Categories>"/>
<jsp:useBean id="listSubCat" scope="request" type="java.util.List<Model.Categories>"/>
<jsp:useBean id="listTags" scope="request" type="java.util.List<Model.Tags>"/>
<jsp:useBean id="authUser" scope="session" type="Model.User"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="icon" href="img/core-img/favicon.ico">
    <style><%@include file="/CSS_ALL/DetailArticle.css"%></style>
    <style><%@include file="/CSS_ALL/Trangchu.css"%></style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS_ALL/ChiTietSanPham.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>HOME</title>
</head>
<body>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="https://couchclarity.com/wp-content/uploads/2015/10/sample-slide5.jpg" alt="Third slide" style="height: 250px;">
<%--            <img class="d-block w-100" src="https://toquoc.mediacdn.vn/280518851207290880/2022/12/26/e7015e56-f3af-41ad-85d1-be5adb241a54-16720772952291421497933.jpeg" alt="First slide" style="height: 250px;">--%>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://th.bing.com/th/id/OIP.wwxK07x0Umfnh0l-nrjxjgHaDg?pid=ImgDet&rs=1" alt="Third slide" style="height: 250px;">
<%--            <img class="d-block w-100" src="https://toquoc.mediacdn.vn/280518851207290880/2022/12/26/31939488358112695089333688253323408624507656n-16720767972671513381080.png" alt="Second slide" style="height: 250px;">--%>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://th.bing.com/th/id/R.7f34a70a5bee79488309934920d316cb?rik=IRJI6pSFo6OI%2fQ&riu=http%3a%2f%2fallpicts.in%2fwp-content%2fuploads%2f2018%2f03%2fNatural-Images-HD-1080p-Download-with-Keyhole-Arch-at-Pfeiffer-Beach.jpg&ehk=JPI0MFI04N62Xtd7MT1P2sw4vJgwODLsp1EcpgvuGFo%3d&risl=&pid=ImgRaw&r=0" alt="Third slide" style="height: 250px;">
<%--            <img class="d-block w-100" src="https://toquoc.mediacdn.vn/thumb_w/640/280518851207290880/2022/12/26/san-may-tam-dao-photo-doan-van-thang-16720776970141644702300.png" alt="Third slide" style="height: 250px;">--%>
        </div>
    </div>
    <div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-custom">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/TrangChu">Trang chủ</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/TrangChu/ShowArticleAll">Tất cả<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
<%--                nav-link--%>
                <button class="btn nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Chủ đề
                </button>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <div class="row" id="dropContent">
                        <c:forEach items="${listCat}" var="l">
                            <div class="col-sm-6 col-lg-3 groupCatalog">
                                <a href="${pageContext.request.contextPath}/TrangChu/ShowArticleByCat?cat_id=${l.id}">
                                    <span class="nav-title">${l.name}</span>
                                </a>
                                <c:forEach items="${listSubCat}" var="s">
                                    <c:if test="${l.id eq s.paren_ID}">
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/TrangChu/ShowArticleByCat?cat_id=${s.id}">${s.name}</a>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </li>
            <li class="nav-item dropdown" style="position: relative">
                <button class="btn nav-link dropdown-toggle" id="navbarDropdownLinkTag" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Tags
                </button>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownLinkTag">

                    <c:forEach items="${listTags}" var="t">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/TrangChu/ShowArticleByTag?tag_id=${t.id}">#${t.name}</a>
                    </c:forEach>
                </div>
            </li>
            <c:if test="${authUser.id == 1}">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Admin/BaiViet/ShowBaiViet">Admin</a>
                </li>
            </c:if>
        </ul>
        <form class="form-inline my-2 my-lg-0" method="get" action="${pageContext.request.contextPath}/TrangChu/search" >
            <input id="key_word" name="key_word" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn customBtnSearch my-2 my-sm-0" type="submit">Search</button>
        </form>
        <ul class="navbar-nav">
            <c:choose>
                <c:when test="${auth}">
                    <form id="frmLogout" accept-charset="UTF-8" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>
                    <li class="nav-item dropdown" style="position: relative">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownR" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Hi, <b>${authUser.name}!</b>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/Account/ThongTinCaNhan">
                                Profile
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="javascript: $('#frmLogout').submit()">
                                Sign Out
                            </a>
                        </div>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Account/DangKy">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Account/DangNhap">Login</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>

<jsp:doBody />

<footer>
    <div class="container">
        <div class="noi-dung about">
            <h2>Về Chúng Tôi</h2>
            <p>...</p>
        </div>
        <div class="noi-dung links">
            <h2>Đường Dẫn</h2>
            <ul>
                <li><a href="#">Trang Chủ</a></li>
                <li><a href="#">Về Chúng Tôi</a></li>
                <li><a href="#">Thông Tin Liên Lạc</a></li>
                <li><a href="#">Dịch Vụ</a></li>
                <li><a href="#">Điều Kiện Chính Sách</a></li>
            </ul>
        </div>
        <div class="noi-dung contact">
            <h2>Thông Tin Liên Hệ</h2>
            <ul class="info">
                <li>
                    <span><i class="fa fa-map-marker"></i></span>
                    <span>01 Võ Văn Ngân<br />
                      Đại học Sư phạm Kỹ Thuật<br />
                      TP Hồ Chí Minh</span>
                </li>

                <li>
                    <span><i class="fa fa-envelope"></i></span>
                    <p><a href="#">diachiemail@gmail.com</a></p>
                </li>
            </ul>
        </div>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
