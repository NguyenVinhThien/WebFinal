<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="articleDetails" scope="request" type="Model.Articles"/>
<jsp:useBean id="listCmt" scope="request" type="java.util.List<Model.Comment>" />
<jsp:useBean id="authUser" scope="session" type="Model.User"/>
<t:main>
  <jsp:body>
    <div class="post-details-title-area bg-overlay clearfix"  style="height: fit-content;margin-top: 10px; position: relative">
        <div class="container-fluid">
          <div class="row align-items-center">
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
                  <span class="glyphicon glyphicon-thumbs-up"></span>Thích</button>
<%--                <span class="like-count">100</span>--%>
              </div>
              <div class="toolbar-item">
                <button class="comment-button" id="cmtBtn"><i class="fas fa-comment"></i> Bình luận</button>
                  <%--            <span class="comment-count">50</span>--%>
              </div>
              <div class="toolbar-item">
                <button id="shareBtn" type="button" class="share-button" data-toggle="modal" data-target="#exampleModalCenter"><i class="fas fa-share"></i> Chia sẻ</button>
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
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Chia sẻ</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <div>
                      <button id="shareFbBtn" class="fa fa-facebook"></button>
                    </div>
                    <div class="input-group mb-3">
                      <input id="shareUrl" type="text" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
                      <div class="input-group-append">
                        <button id="copyBtn" class="btn btn-outline-secondary" type="button">Copy</button>
                      </div>
                    </div>

                  </div>
<%--                  <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                    <button type="button" class="btn btn-primary">Save changes</button>--%>
<%--                  </div>--%>
                </div>
              </div>
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
  });
  document.getElementById("shareBtn").addEventListener("click", function (e){
    var url= window.location.href;
    var inputText= document.getElementById("shareUrl");
    inputText.value= url;
    document.getElementById("shareFbBtn").addEventListener("click", function (e){
      var shareURL = "https://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(url);
      window.open(shareURL, "_blank");
    })
    document.getElementById("copyBtn").addEventListener("click", function(e){
      navigator.clipboard.writeText(url);
      alert("Copied to clipboard");
    })
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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

