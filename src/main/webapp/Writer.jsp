<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 1/3/2023
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Chi tiết duyệt</title>
    <style><%@include file="/CSS_ALL/DuyetBaiEditor.css"%></style>

</head>

<body>
<div class="wrapper" style="width: 100%;">
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Bootstrap Sidebar</h3>
        </div>

        <ul class="list-unstyled components">
            <p>Dummy Heading</p>

            <li>
                <a href="#">Bài Viết Của Tôi</a>
            </li>

            <li>
                <a href="DangBai?id=${name}">Đăng Bài</a>
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

        <div class="container">
            <h2>Bài viết của tác giả ${name}</h2>
            <form>
                <table id="example" class="table table-bordered" style="min-width: 845px" role="grid" aria-describedby="example_info">
                    <thead>
                    <tr role="row">
                        <th class="sorting_desc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="descending" aria-label="Mã: activate to sort column ascending" style="width: 98.2969px;">ID bài viết</th>
                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Tên danh mục: activate to sort column ascending" style="width: 485.891px;">Tên Bài Viết</th>
                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Xóa: activate to sort column ascending" style="width: 171.672px;">Chỉnh Sửa</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listA}" var="o">
                    <tbody>
                    <tr class="odd" role="row">
                        <td class="sorting_1">${o.id_article}</td>
                        <td><a>${o.title}</a></td>
                        <td>
                            <a href ="EditArticle?id=${o.id_article}" >
                                <button class="btn btn-danger btn sweet-confirm destroy">Chỉnh sửa</button>
                            </a>
                        </td>
                    </tbody>
                    </c:forEach>
                    </tbody>
                </table>
<%--                <div class="modal fade" id="duyetModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
<%--                    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-header">--%>
<%--                                <h5 class="modal-title" id="modelTitle">Duyệt bài viết</h5>--%>
<%--                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                    <span aria-hidden="true">&times;</span>--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="modal-body">--%>

<%--                                <div class="card shadow mb-4">--%>
<%--                                    <div class="card-body">--%>
<%--                                        <div class="table-responsive">--%>
<%--                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">--%>
<%--                                                <thead>--%>
<%--                                                <tr>--%>
<%--                                                    <th>ID</th>--%>
<%--                                                    <th>Title</th>--%>
<%--                                                    <th>Content</th>--%>
<%--                                                    <th>Category_id</th>--%>
<%--                                                    <th>Premium</th>--%>
<%--                                                    <th>Writer_id</th>--%>
<%--                                                    <th>Status</th>--%>
<%--                                                    <th>Public Date</th>--%>
<%--                                                    <th>Views</th>--%>
<%--                                                    <th>Abstract</th>--%>
<%--                                                </tr>--%>
<%--                                                </thead>--%>
<%--                                                <tbody>--%>
<%--                                                <tr>--%>
<%--                                                    <td>1</td>--%>
<%--                                                    <td> Sữa Ông Thọ--%>
<%--                                                    </td>--%>
<%--                                                    <td>Chó QD ngu</td>--%>
<%--                                                    <td>1</td>--%>
<%--                                                    <td>Yes</td>--%>
<%--                                                    <td>1</td>--%>
<%--                                                    <td>Draft</td>--%>
<%--                                                    <td>28/12/2022</td>--%>
<%--                                                    <td>100</td>--%>
<%--                                                    <td></td>--%>
<%--                                                    <td>    <a href="#" class="btn btn-success btn-icon-split" data-target="#addBaiviet" data-toggle="modal">--%>
<%--                                                    <span class="icon text-white-50">--%>
<%--                                                        <i class="fas fa-check"></i>--%>
<%--                                                    </span>--%>
<%--                                                        <span class="text">Xuất bản</span>--%>
<%--                                                    </a></td>--%>
<%--                                                    <td><div class="d-flex justify-content-end">--%>
<%--                                                        <a href="#" class="btn btn-danger btn-icon-split align-items-center" data-target="#deleteBaiviet" data-toggle="modal" >--%>
<%--                                                        <span class="icon text-white-50 ">--%>
<%--                                                            <i class="fas fa-trash"></i>--%>
<%--                                                        </span>--%>
<%--                                                            <span class="text">Delete</span>--%>
<%--                                                        </a>--%>
<%--                                                    </div></td>--%>

<%--                                                </tr>--%>
<%--                                                </tbody>--%>
<%--                                            </table>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="modal-footer">--%>
<%--                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Quay về</button>--%>
<%--                                <button type="button" class="btn btn-success">Xác nhận</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="modal fade" id="tuchoiModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
<%--                    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-header">--%>
<%--                                <h5 class="modal-title" id="exampleModalLongTitle">Từ chối bài viết</h5>--%>
<%--                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                    <span aria-hidden="true">&times;</span>--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="modal-body">--%>
<%--                                <form>--%>
<%--                                    <div class="form-row">--%>
<%--                                        <div class="form-group col-md-6">--%>
<%--                                            <label for="inputEmail4">Mã bài viết</label>--%>
<%--                                            <input type="text" class="form-control" id="inputEmail4" placeholder="Mã bài viết">--%>
<%--                                        </div>--%>
<%--                                        <div class="form-group col-md-6">--%>
<%--                                            <label for="inputPassword4">Mã tác giả</label>--%>
<%--                                            <input type="text" class="form-control" id="inputPassword4" placeholder="Mã tác giả">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="inputAddress">Tên bài viết</label>--%>
<%--                                        <input type="text" class="form-control" id="inputAddress" placeholder="Tên bài viết">--%>
<%--                                    </div>--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="exampleFormControlTextarea1">Ghi chú</label>--%>
<%--                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                            <div class="modal-footer">--%>
<%--                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Quay về</button>--%>
<%--                                <button type="button" class="btn btn-danger">Xác nhận</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

            </form>
        </div>
    </div>
</div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>

    </script>
</body>

</html>
