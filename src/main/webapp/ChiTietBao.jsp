<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="articleDetails" scope="request" type="Model.Articles"/>
<jsp:useBean id="listCmt" scope="request" type="java.util.List<Model.Comment>" />
<jsp:useBean id="authUser" scope="session" type="Model.User"/>
<t:main>
  <jsp:body>
    <div class="post-details-title-area bg-gradient-light clearfix"  style="height: 280px; margin-top: 10px; position: relative">
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
    <div class="post-news-area section-padding-100-0 mb-70" style="position: relative">

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
<%--                <span class="like-count">100</span>--%>
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
    </div>

  </jsp:body>

</t:main>
<script>
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

