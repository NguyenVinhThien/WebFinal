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

  <!-- Stylesheet -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS_ALL/ChiTietSanPham.css">

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-custom">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">Trang chủ<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Chủ đề
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <div class="row" id="dropContent">
            <div class="col-sm-6 col-lg-3 groupCatalog">
              <span class="nav-title">THẾ GIỚI</span>
              <a class="dropdown-item" href="#">Tư liệu</a>
              <a class="dropdown-item" href="#">Phân tích</a>
            </div>
            <div class="col-sm-6 col-lg-3">
              <span class="nav-title">XÃ HỘI</span>
              <a class="dropdown-item" href="#">Thời sự</a>
              <a class="dropdown-item" href="#">Giao thông</a>
            </div>
            <div class="col-sm-6 col-lg-3">
              <span class="nav-title">VĂN HÓA</span>
              <a class="dropdown-item" href="#">Ẩm thực</a>
              <a class="dropdown-item" href="#">Du lịch</a>
            </div>
            <div class="col-sm-6 col-lg-3">
              <span class="nav-title">KINH DOANH</span>
              <a class="dropdown-item" href="#">Doanh nghiệp</a>
              <a class="dropdown-item" href="#">Mua sắm</a>
            </div>
            <div class="col-sm-6 col-lg-3">
              <span class="nav-title">GIẢI TRÍ</span>
              <a class="dropdown-item" href="#">Âm nhạc</a>
              <a class="dropdown-item" href="#">Điện ảnh</a>
            </div>
            <div class="col-sm-6 col-lg-3">
              <span class="nav-title">GIÁO DỤC</span>
              <a class="dropdown-item" href="#">Tuyển sinh</a>
              <a class="dropdown-item" href="#">Chân dung nhà giáo</a>
            </div>
            <div class="col-sm-6 col-lg-3">
              <span class="nav-title">THỂ THAO</span>
              <a class="dropdown-item" href="#">Bóng đá quốc tế</a>
              <a class="dropdown-item" href="#">Bóng đá Việt Nam</a>
            </div>
            <div class="col-sm-6 col-lg-3">
              <span class="nav-title">ĐỜI SỐNG</span>
              <a class="dropdown-item" href="#">Dinh dưỡng- làm đẹp</a>
              <a class="dropdown-item" href="#">Sức khỏe- Y tế</a>
            </div>
            <div class="col-sm-6 col-lg-3">
              <span class="nav-title">PHÁP LUẬT</span>
              <a class="dropdown-item" href="#">An ninh- Trật tự</a>
              <a class="dropdown-item" href="#">Hình sự- Dân sự</a>
            </div>
            <div class="col-sm-6 col-lg-3">
              <span class="nav-title">KHOA HỌC</span>
            </div>
          </div>
        </div>
      </li>

    </ul>
  </div>
</nav>

<!-- ##### Post Details Title Area Start ##### -->
<div class="post-details-title-area bg-overlay clearfix" style="height: 250px; margin-top: 10px">
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
<!-- ##### Post Details Title Area End ##### -->

<!-- ##### Post Details Area Start ##### -->
<section class="post-news-area section-padding-100-0 mb-70">
  <div class="container">
    <div class="row justify-content-center">
      <!-- Post Details Content Area -->
      <div class="col-12 col-lg-8">
        <div class="post-details-content mb-100">
          <p>${articleDetails.content}</p>
        </div>
        <div class="comment_area clearfix mb-100">
          <h4 class="mb-50">Comments</h4>
          <ol>
            <!-- Single Comment Area -->
<%--            <li class="single_comment_area">--%>
<%--              <!-- Comment Content -->--%>
<%--              <div class="comment-content d-flex">--%>
<%--                <!-- Comment Author -->--%>
<%--                <div class="comment-author">--%>
<%--                  <img src="img/bg-img/32.jpg" alt="author">--%>
<%--                </div>--%>
<%--                <!-- Comment Meta -->--%>
<%--                <div class="comment-meta">--%>
<%--                  <div class="d-flex">--%>
<%--                    <a href="#" class="post-author">Maria Williams</a>--%>
<%--                    <a href="#" class="post-date">June 23, 2018 </a>--%>
<%--                    <a href="#" class="reply">Reply</a>--%>
<%--                  </div>--%>
<%--                  <p>Consectetur adipiscing elit. Praesent vel tortor facilisis, volutpat nulla placerat, tinci dunt mi. Nullam vel orci dui. Su spendisse sit amet laoreet neque. Fusce sagittis sus cipit sem a consequat.</p>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <ol class="children">--%>
<%--                <li class="single_comment_area">--%>
<%--                  <!-- Comment Content -->--%>
<%--                  <div class="comment-content d-flex">--%>
<%--                    <!-- Comment Author -->--%>
<%--                    <div class="comment-author">--%>
<%--                      <img src="img/bg-img/33.jpg" alt="author">--%>
<%--                    </div>--%>
<%--                    <!-- Comment Meta -->--%>
<%--                    <div class="comment-meta">--%>
<%--                      <div class="d-flex">--%>
<%--                        <a href="#" class="post-author">Christian Williams</a>--%>
<%--                        <a href="#" class="post-date">April 15, 2018</a>--%>
<%--                        <a href="#" class="reply">Reply</a>--%>
<%--                      </div>--%>
<%--                      <p>Consectetur adipiscing elit. Praesent vel tortor facilisis, Nullam vel orci dui. Su spendisse sit amet laoreet neque.</p>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                </li>--%>
<%--              </ol>--%>
<%--            </li>--%>
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
<%--                      <div class="comment-author">--%>
<%--                        <img src="img/bg-img/32.jpg" alt="author">--%>
<%--                      </div>--%>
                      <div class="comment-meta">
                        <div class="d-flex">
                          <a href="#" class="post-author">${lc.name}</a>
                          <a href="#" class="post-date">${lc.date}</a>
<%--                          <a href="#" class="reply">Reply</a>--%>
                        </div>
                        <p>${lc.comment}</p>
                      </div>
                    </div>
                  </li>

                </c:forEach>
              </c:otherwise>
            </c:choose>

            <!-- Single Comment Area -->
<%--            <li class="single_comment_area">--%>
<%--              <!-- Comment Content -->--%>
<%--              <div class="comment-content d-flex">--%>
<%--                <!-- Comment Author -->--%>
<%--                <div class="comment-author">--%>
<%--                  <img src="img/bg-img/32.jpg" alt="author">--%>
<%--                </div>--%>
<%--                <!-- Comment Meta -->--%>
<%--                <div class="comment-meta">--%>
<%--                  <div class="d-flex">--%>
<%--                    <a href="#" class="post-author">Lisa Moore</a>--%>
<%--                    <a href="#" class="post-date">June 23, 2018</a>--%>
<%--                    <a href="#" class="reply">Reply</a>--%>
<%--                  </div>--%>
<%--                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vel tortor facilisis, volutpat nulla placerat, tincidunt mi. Nullam vel orci dui. Su spendisse sit amet laoreet neque. Fusce sagittis suscipit.</p>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </li>--%>
          </ol>
        </div>

        <div class="post-a-comment-area mb-30 clearfix">
          <h4 class="mb-50">Leave a reply</h4>

          <!-- Reply Form -->
          <div class="contact-form-area">
            <form action="#" method="post">
              <div class="row">
                <div class="col-12 col-lg-6">
                  <input type="text" class="form-control" id="name" placeholder="Name*">
                </div>
                <div class="col-12 col-lg-6">
                  <input type="email" class="form-control" id="email" placeholder="Email*">
                </div>
                <div class="col-12">
                  <input type="text" class="form-control" id="subject" placeholder="Website">
                </div>
                <div class="col-12">
                  <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                </div>
                <div class="col-12">
                  <button class="btn newsbox-btn mt-30" type="submit">Submit Comment</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>

      <!-- Sidebar Widget -->
      <div class="col-12 col-sm-9 col-md-6 col-lg-4">
        <div class="sidebar-area">

          <!-- Newsletter Widget -->
<%--          <div class="single-widget-area newsletter-widget mb-30">--%>
<%--            <h4>Subscribe to our newsletter</h4>--%>
<%--            <form action="#" method="post">--%>
<%--              <input type="email" name="nl-email" id="nlemail" placeholder="Your E-mail">--%>
<%--              <button type="submit" class="btn newsbox-btn w-100">Subscribe</button>--%>
<%--            </form>--%>
<%--            <p class="mt-30">Nullam lacinia ex eleifend orci porttitor, suscipit interdum augue condimentum. Etiam pretium turpis eget nibh . volutpat lobortis.</p>--%>
<%--          </div>--%>

          <!-- Add Widget -->
<%--          <div class="single-widget-area add-widget mb-30">--%>
<%--            <a href="#">--%>
<%--              <img src="img/bg-img/add3.png" alt="">--%>
<%--            </a>--%>
<%--          </div>--%>

          <!-- Latest News Widget -->
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

            <!-- Single News Area -->
<%--            <div class="single-blog-post style-2 mb-5">--%>
<%--              <!-- Blog Thumbnail -->--%>
<%--              <div class="blog-thumbnail">--%>
<%--                <a href="#"><img src="img/bg-img/14.jpg" alt=""></a>--%>
<%--              </div>--%>

<%--              <!-- Blog Content -->--%>
<%--              <div class="blog-content">--%>
<%--                <span class="post-date">June 20, 2018</span>--%>
<%--                <a href="#" class="post-title">Elon Musk: Tesla worker admitted to sabotage</a>--%>
<%--                <a href="#" class="post-author">By Michael Smith</a>--%>
<%--              </div>--%>
<%--            </div>--%>

            <!-- Single News Area -->
<%--            <div class="single-blog-post style-2 mb-5">--%>
<%--              <!-- Blog Thumbnail -->--%>
<%--              <div class="blog-thumbnail">--%>
<%--                <a href="#"><img src="img/bg-img/15.jpg" alt=""></a>--%>
<%--              </div>--%>

<%--              <!-- Blog Content -->--%>
<%--              <div class="blog-content">--%>
<%--                <span class="post-date">June 20, 2018</span>--%>
<%--                <a href="#" class="post-title">Rachel Sm ith breaks down while discussing border crisis</a>--%>
<%--                <a href="#" class="post-author">By Michael Smith</a>--%>
<%--              </div>--%>
<%--            </div>--%>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- ##### Post Details Area End ##### -->

<!-- ##### Footer Area Start ##### -->
<footer class="footer-area">
  <!-- Footer Logo -->
  <div class="footer-logo mb-100">
    <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
  </div>
  <!-- Footer Content -->
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="footer-content text-center">
          <!-- Footer Nav -->
          <div class="footer-nav">
            <ul>
              <li><a href="#">Contact Us</a></li>
              <li><a href="#">Closed Captioning</a></li>
              <li><a href="#">Site Map</a></li>
            </ul>
          </div>
          <!-- Social Info -->
          <div class="footer-social-info">
            <a href="#" data-toggle="tooltip" data-placement="top" title="pinterest"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
            <a href="#" data-toggle="tooltip" data-placement="top" title="facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
            <a href="#" data-toggle="tooltip" data-placement="top" title="twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            <a href="#" data-toggle="tooltip" data-placement="top" title="dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
            <a href="#" data-toggle="tooltip" data-placement="top" title="behance"><i class="fa fa-behance" aria-hidden="true"></i></a>
            <a href="#" data-toggle="tooltip" data-placement="top" title="linkedin"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
          </div>

          <p class="mb-15">Nullam lacinia ex eleifend orci porttitor, suscipit interdum augue condimentum. Etiam pretium turpis eget nibh laoreet iaculis. Proin ac urna at lectus volutpat lobortis. Vestibulum venenatis iaculis diam vitae lobortis. Donec tincidunt viverra elit, sed consectetur est pr etium ac. Mauris nec mauris tellus. </p>

          <!-- Copywrite Text -->
          <p class="copywrite-text"><a href="#">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
        </div>
      </div>
    </div>
  </div>
</footer>
<!-- ##### Footer Area Start ##### -->

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
