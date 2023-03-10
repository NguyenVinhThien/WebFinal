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
<jsp:useBean id="listTopHotArt" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<jsp:useBean id="listArtByView" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<jsp:useBean id="listNewArt" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<jsp:useBean id="listTopByCat" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<jsp:useBean id="authUser" scope="session" type="Model.User"/>
<%--<jsp:useBean id="auth" scope="session" type="Model.User"/>--%>

<%--<jsp:useBean id="article" scope="request" type="Model.Articles"/>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style><%@include file="/CSS_ALL/Trangchu.css"%></style>
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
            <img class="d-block w-100" src="https://toquoc.mediacdn.vn/280518851207290880/2022/12/26/e7015e56-f3af-41ad-85d1-be5adb241a54-16720772952291421497933.jpeg" alt="First slide" style="height: 250px;">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://toquoc.mediacdn.vn/280518851207290880/2022/12/26/31939488358112695089333688253323408624507656n-16720767972671513381080.png" alt="Second slide" style="height: 250px;">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://toquoc.mediacdn.vn/thumb_w/640/280518851207290880/2022/12/26/san-may-tam-dao-photo-doan-van-thang-16720776970141644702300.png" alt="Third slide" style="height: 250px;">
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
    <a class="navbar-brand" href="${pageContext.request.contextPath}/TrangChu">Trang ch???</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/TrangChu/ShowArticleAll">T???t c???<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Ch??? ?????
                </a>
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
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownLinkTag" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Tag
                </a>
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
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn customBtnSearch my-2 my-sm-0" type="submit">Search</button>
        </form>
        <ul class="navbar-nav">
            <c:choose>
                <c:when test="${auth}">
                    <form id="frmLogout" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>
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
            <h2>V??? Ch??ng T??i</h2>
            <p>...</p>
        </div>
        <div class="noi-dung links">
            <h2>???????ng D???n</h2>
            <ul>
                <li><a href="#">Trang Ch???</a></li>
                <li><a href="#">V??? Ch??ng T??i</a></li>
                <li><a href="#">Th??ng Tin Li??n L???c</a></li>
                <li><a href="#">D???ch V???</a></li>
                <li><a href="#">??i???u Ki???n Ch??nh S??ch</a></li>
            </ul>
        </div>
        <div class="noi-dung contact">
            <h2>Th??ng Tin Li??n H???</h2>
            <ul class="info">
                <li>
                    <span><i class="fa fa-map-marker"></i></span>
                    <span>01 V?? V??n Ng??n<br />
                      ?????i h???c S?? ph???m K??? Thu???t<br />
                      TP H??? Ch?? Minh</span>
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
