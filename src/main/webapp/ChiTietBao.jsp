<%--
  Created by IntelliJ IDEA.
  User: Huy-Pro
  Date: 03/01/2023
  Time: 5:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="articleDetails" scope="request" type="Model.Articles"/>
<jsp:useBean id="listCmt" scope="request" type="java.util.List<Model.Comment>" />
<jsp:useBean id="listCat" scope="request" type="java.util.List<Model.Categories>"/>
<jsp:useBean id="listSubCat" scope="request" type="java.util.List<Model.Categories>"/>
<jsp:useBean id="listTags" scope="request" type="java.util.List<Model.Tags>"/>
<jsp:useBean id="authUser" scope="session" type="Model.User"/>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <!-- Title -->
  <title>Newsbox - Modern Magazine &amp; Newspaper HTML Template</title>

  <!-- Favicon -->
  <link rel="icon" href="img/core-img/favicon.ico">
  <style><%@include file="/CSS_ALL/Trangchu.css"%></style>
  <style><%@include file="/CSS_ALL/DetailArticle.css"%></style>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS_ALL/ChiTietSanPham.css">

</head>

<body>
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
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Chủ đề
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
<!-- ##### Post Details Title Area Start ##### -->
<div class="post-details-title-area bg-overlay clearfix" style="height: 280px; margin-top: 10px">
  <div class="container-fluid h-100">
    <div class="row h-100 align-items-center">
      <div class="col-12 col-lg-8">
        <!-- Post Content -->
        <div class="post-content">

          <p class="post-title">${articleDetails.title}</p>
          <div class="d-flex align-items-center">
            <span class="post-date mr-30">${articleDetails.publish_date}</span>
            <span class="post-date">${articleDetails.writer_id}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ##### Post Details Area Start ##### -->
<section class="post-news-area section-padding-100-0 mb-70">

  <div class="container">
    <div class="row justify-content-center">
      <!-- Post Details Content Area -->
      <div class="col-12 col-lg-8">
        <div class="post-details-content mb-100">
          <p>${articleDetails.content}</p>
        </div>
        <div class="post-toolbar">
          <div class="toolbar-item">
            <button class="like-button"><i class="fas fa-thumbs-up"></i>
              <span class="glyphicon glyphicon-thumbs-up"></span>Like</button>
            <span class="like-count">100</span>
          </div>
          <div class="toolbar-item">
            <button class="comment-button" id="cmtBtn"><i class="fas fa-comment"></i> Comment</button>
<%--            <span class="comment-count">50</span>--%>
          </div>
          <div class="toolbar-item">
            <button class="share-button"><i class="fas fa-share"></i> Share</button>
<%--            <span class="share-count">20</span>--%>
          </div>
        </div>
        <div class="post-a-comment-area mb-30 clearfix" id="cmtDiv">
          <h5 class="mb-50">Leave a reply</h5>

          <!-- Reply Form -->
          <div class="contact-form-area">
            <form id="cmtForm" action="#" method="post">
              <div class="row">
                <%--                <div class="col-12 col-lg-6">--%>
                <%--                  <input type="text" class="form-control" id="name" placeholder="Name*">--%>
                <%--                </div>--%>
                <%--                <div class="col-12 col-lg-6">--%>
                <%--                  <input type="email" class="form-control" id="email" placeholder="Email*">--%>
                <%--                </div>--%>
                <%--                <div class="col-12">--%>
                <%--                  <input type="text" class="form-control" id="subject" placeholder="Website">--%>
                <%--                </div>--%>
                <div class="col-12">
                  <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                </div>
                <div class="col-12">
                  <button class="btn newsbox-btn mt-30" type="submit">Gửi</button>
                </div>
              </div>
            </form>
          </div>

        </div>

        <div class="comment_area clearfix mb-100">
          <h5 class="mb-50">Bình luận</h5>
          <ol>
            <c:choose>
              <c:when test="${listCmt.size() eq 0}">
                <tr>
                  <td>Bài viết chưa có bình luận nào</td>
                </tr>
              </c:when>
              <c:otherwise>
                <c:forEach items="${listCmt}" var="lc">
                  <li class="single_comment_area">
                    <div class="comment-content d-flex">
                      <div class="comment-meta">
                        <div class="d-flex">
                          <a href="#" class="post-author">${lc.name}</a>
                          <a href="#" class="post-date">${lc.date}</a>
                        </div>
                        <p>${lc.comment}</p>
                      </div>
                    </div>
                  </li>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </ol>
        </div>


      </div>

      <!-- Sidebar Widget -->
      <div class="col-12 col-sm-9 col-md-6 col-lg-4">
        <div class="sidebar-area">

          <div class="single-widget-area news-widget mb-30">
            <h4>Tin cùng chuyên mục</h4>

            <!-- Single News Area -->
            <div class="single-blog-post d-flex style-4 mb-30">
              <!-- Blog Thumbnail -->
              <div class="blog-thumbnail">
                <a href="#"><img src="img/bg-img/16.jpg" alt=""></a>
              </div>

              <!-- Blog Content -->
              <div class="blog-content">
                <span class="post-date">June 20, 2018</span>
                <a href="#" class="post-title">Nearly a quarter have no emergency savings</a>
              </div>
            </div>

            <!-- Single News Area -->
            <div class="single-blog-post d-flex style-4 mb-30">
              <!-- Blog Thumbnail -->
              <div class="blog-thumbnail">
                <a href="#"><img src="img/bg-img/17.jpg" alt=""></a>
              </div>

              <!-- Blog Content -->
              <div class="blog-content">
                <span class="post-date">June 20, 2018</span>
                <a href="#" class="post-title">Nearly a quarter have no emergency savings</a>
              </div>
            </div>

            <!-- Single News Area -->
            <div class="single-blog-post d-flex style-4 mb-30">
              <!-- Blog Thumbnail -->
              <div class="blog-thumbnail">
                <a href="#"><img src="img/bg-img/18.jpg" alt=""></a>
              </div>

              <!-- Blog Content -->
              <div class="blog-content">
                <span class="post-date">June 20, 2018</span>
                <a href="#" class="post-title">Top bitcoin exchange says over $30 million stolen</a>
              </div>
            </div>

            <!-- Single News Area -->
            <div class="single-blog-post d-flex style-4 mb-30">
              <!-- Blog Thumbnail -->
              <div class="blog-thumbnail">
                <a href="#"><img src="img/bg-img/19.jpg" alt=""></a>
              </div>

              <!-- Blog Content -->
              <div class="blog-content">
                <span class="post-date">June 20, 2018</span>
                <a href="#" class="post-title">Top bitcoin exchange says over $30 million stolen</a>
              </div>
            </div>

            <!-- Single News Area -->
            <div class="single-blog-post d-flex style-4 mb-30">
              <!-- Blog Thumbnail -->
              <div class="blog-thumbnail">
                <a href="#"><img src="img/bg-img/20.jpg" alt=""></a>
              </div>

              <!-- Blog Content -->
              <div class="blog-content">
                <span class="post-date">June 20, 2018</span>
                <a href="#" class="post-title">Dow falls 287 points as trade war fears escalate</a>
              </div>
            </div>
          </div>

          <!-- Single Widget Area -->
          <div class="single-widget-area">

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
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

<script>
  <%--document.getElementById("cmtForm").addEventListener("submit", function (event){--%>
  <%--  event.preventDefault();--%>
  <%--  var article_id= "<%=articleDetails.getId_article()%>>"--%>
  <%--  var user_id= "<%=authUser.getId()%>"--%>
  <%--  var formData= new FormData(event.target);--%>
  <%--  var comment= formData.get("message")--%>

  <%--  sendPostRequest(user_id, article_id, comment);--%>

  <%--})--%>
  var liscmt_size= "<%=listCmt.size()%>>"
  console.log(liscmt_size);
  document.getElementById("cmtBtn").addEventListener("click", function (event){
    var user_id= "<%=authUser.getId()%>"
    if(user_id ==0){
      alert("Vui lòng đăng nhập tài khoản trước khi binh luận!")
    } else{
      var x = document.getElementById("cmtDiv");
      if (x.style.display === "none") {
        x.style.display = "block";
      } else {
        x.style.display = "none";
      }
    }
  })

</script>


<!-- ##### All Javascript Script ##### -->
<!-- jQuery-2.2.4 js -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="js/active.js"></script>
</body>

</html>
