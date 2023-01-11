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
            <h3>Editor Sidebar</h3>
        </div>

        <ul class="list-unstyled components">
            <li class="active">
                <a href="${pageContext.request.contextPath}/Editor/ShowCategory?id=${authUser.id}">Tất cả chuyên mục</a>
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

                <!-- Pending Requests Card Example -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1>Danh sách bài viết Draft</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Writer id</th>
                                        <th>
                                            <div class="d-flex justify-content-sm-center">Xét Duyệt</div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${listA}" var="t">
                                        <tbody>
                                        <tr>
                                            <td>${t.id_article}</td>
                                            <td>${t.title}</td>
                                            <td>${t.writer_id}</td>
                                            <td>
                                                <div class="d-flex justify-content-sm-center">
                                                    <a href="${pageContext.request.contextPath}/Editor/EditArticle?id=${t.id_article}"
                                                       class="btn btn-success btn-icon-split">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-check"></i>
                                                    </span>
                                                        <span class="text">Xem Chi Tiết</span>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
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

