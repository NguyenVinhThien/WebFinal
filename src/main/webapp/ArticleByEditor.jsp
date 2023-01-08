<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 08/01/2023
  Time: 8:47 CH
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="authUser" scope="session" type="Model.User"/>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>MainCategoryByEditor</title>
    <script src=
                    "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/TemplateAdmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/TemplateAdmin/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS_ALL/DuyetBaiEditor.css">

</head>
<body>
<div class="wrapper" style="width: 100%;">
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Bootstrap Sidebar</h3>
        </div>

        <ul class="list-unstyled components">
            <p>Dummy Heading</p>
            <li class="active">
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Bài Viết Của Tôi</a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li value="Tất cả">
                        <a href="/WebFinal/Writer/ShowArticle?id=${authUser.id}">Tất Cả Bài viết</a>
                    </li>
                    <li>
                        <a href="/WebFinal/Writer/ShowArticle/Draft?id=${authUser.id}">Bài Viết Draft</a>
                    </li>
                    <li>
                        <a href="/WebFinal/Writer/ShowArticle/Ok?id=${authUser.id}">Bài viết đã duyệt</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="/WebFinal/Writer/DangBai?id=${authUser.id}">Đăng Bài</a>
            </li>
        </ul>

    </nav>
    <!-- Page Content  -->
    <div id="content">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <div class="nav navbar-nav ml-auto">
                        <span>Info user</span>
                        <img class="editor-profileIcon" src="./images/PD01.jpg" alt="">
                    </div>
                </div>
            </div>
        </nav>

        <div class="container-fluid  ">

            <div class="row ">


                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4 ali">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Số bài viết draft
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${total1}</div>
                                </div>
                                <div class="col-auto">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pending Requests Card Example -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Danh sách bài viết Draft</h1>
                    <!-- DataTales Example -->
                    <div class="d-flex justify-content-end ">
                        <a href="ShowBaiViet" class="btn btn-outline-primary  align-content-center">
                            <span class="text">Tất cả</span>
                        </a>
                        <div class="col-auto">
                        </div>
                        <a href="ShowBaiVietDraft" class="btn btn-outline-success  align-content-center">
                            <span class="text">Draft</span>
                        </a>
                        <div class="col-auto">
                        </div>
                        <a href="ShowBaiVietOk" class="btn btn-outline-warning  align-content-center">
                            <span class="text">Đã Xuất Bản</span>
                        </a>
                    </div>
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Content</th>
                                        <th>Category id</th>
                                        <th>Premium</th>
                                        <th>Writer id</th>
                                        <th>Status</th>
                                        <th>Public Date</th>
                                        <th>Views</th>
                                        <th>
                                            <div class="d-flex justify-content-sm-center">Xuất bản</div>
                                        </th>
                                        <th>
                                            <div class="d-flex justify-content-sm-center">Xoá</div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="t">
                                        <tbody>
                                        <tr>
                                            <td>${t.id_article}</td>
                                            <td> ${t.title}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/ChiTietBao?articleId=${t.id_article}"
                                                   class="btn btn-info btn-icon-split">
                                                     <span class="icon text-white-50">
                                                    <i class="fas fa-info-circle"></i>
                                                     </span>
                                                    <span class="text">Xem chi tiết</span>
                                                </a></td>
                                            <td>${t.categories_id}</td>
                                            <td>${t.premium}</td>
                                            <td>${t.writer_id}</td>
                                            <td>${t.status}</td>
                                            <td>${t.publish_date}</td>
                                            <td>${t.views}</td>
                                            <td>
                                                <div class="d-flex justify-content-sm-center">
                                                    <a href="Ok?id=${t.id_article}"
                                                       class="btn btn-success btn-icon-split">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-check"></i>
                                                    </span>
                                                        <span class="text">Xuất bản</span>
                                                    </a>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex justify-content-sm-center">
                                                    <a href="DeleteArticle?id=${t.id_article}"
                                                       class="btn btn-danger btn-icon-split "
                                                       data-target="#deleteBaiviet" data-toggle="modal">
                                                        <span class="icon text-white-50 ">
                                                            <i class="fas fa-trash"></i>
                                                        </span>
                                                        <span class="text">Xoá</span>
                                                    </a>
                                                </div>
                                            </td>

                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <div class="col-sm-12 col-md-7">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                        <ul class="pagination">
                                            <c:if test="${page != 1}">
                                                <li class="paginate_button page-item" id="dataTable_previous">
                                                    <a href="${pageContext.request.contextPath}/Admin/BaiViet/ShowBaiVietDraft?keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>&page=${page - 1 }"
                                                       aria-controls="dataTable" data-dt-idx="0" tabindex="0"
                                                       class="page-link">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:forEach var="i" begin="1" end="${totalpage}">
                                                <c:choose>
                                                    <c:when test="${ page == i}">
                                                        <li class="paginate_button page-item active">
                                                            <a href="${pageContext.request.contextPath}/Admin/BaiViet/ShowBaiVietDraft?keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>&page=${i}"
                                                               aria-controls="dataTable" data-dt-idx="${ i}"
                                                               tabindex="0" class="page-link">${ i}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="paginate_button page-item">
                                                            <a href="${pageContext.request.contextPath}/Admin/BaiViet/ShowBaiVietDraft?keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>&page=${i}"
                                                               aria-controls="dataTable" data-dt-idx="${ i}"
                                                               tabindex="0" class="page-link">${ i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${page < totalpage}">
                                                <li class="paginate_button page-item next" id="dataTable_next">
                                                    <a href="${pageContext.request.contextPath}/Admin/BaiViet/ShowBaiVietDraft?keyword=<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>&page=${page + 1}"
                                                       aria-controls="dataTable" data-dt-idx="7" tabindex="0"
                                                       class="page-link">Next</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>

            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Bạn muốn đăng xuất ??</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Bạn chọn Logout sẽ đăng xuất ra hệ thống.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="TrangChu">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>

