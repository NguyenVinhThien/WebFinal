<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 08/01/2023
  Time: 8:47 CH
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="authUser" scope="session" type="Model.User"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>SubCategoryByEditor</title>
    <script src=
                    "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/TemplateAdmin/vendor/fontawesome-free/css/all.min.css"
          rel="stylesheet" type="text/css">
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
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Bài Viết Của
                    Tôi</a>
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

        <div class="container-fluid">

            <!-- Page Heading -->

            <!-- DataTales Example -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">${name}</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div id="example_wrapper" class="dataTables_wrapper">
                                        <div id="example_wrapper" class="dataTables_wrapper">
                                            <div class="d-flex justify-content-end ">
                                                <a href="#"
                                                   class="btn btn-warning btn-icon-split align-content-center"
                                                   data-target="#editDanhMuc" data-toggle="modal">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-exclamation-triangle"></i>
                                        </span>
                                                    <span class="text">Chỉnh sửa</span>
                                                </a>
                                            </div>
                                            <table id="example" class="table table-bordered"
                                                   style="min-width: 845px" role="grid"
                                                   aria-describedby="example_info">
                                                <thead>
                                                <tr role="row">
                                                    <th class="sorting_desc" tabindex="0" aria-controls="example"
                                                        rowspan="1" colspan="1" aria-sort="descending"
                                                        aria-label="Mã: activate to sort column ascending"
                                                        style="width: 98.2969px;">Mã
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="example"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Tên danh mục: activate to sort column ascending"
                                                        style="width: 485.891px;">Tên danh mục phụ
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="example"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Xóa: activate to sort column ascending"
                                                        style="width: 171.672px;">Xóa
                                                    </th>
                                                </tr>
                                                </thead>
                                                <c:forEach items="${listS}" var="o">
                                                    <tbody>
                                                    <tr class="odd" role="row">
                                                        <td>${o.id}</td>
                                                        <td>${o.name}</td>
                                                        <td>
                                                            <a href="DeleteSubCategory?id=${o.id}">
                                                                <button class="btn btn-danger btn sweet-confirm destroy">
                                                                    Xóa
                                                                </button>
                                                            </a>
                                                        </td>
                                                    </tbody>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

