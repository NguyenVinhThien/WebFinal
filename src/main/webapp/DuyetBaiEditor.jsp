<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 1/3/2023
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Chi tiết duyệt</title>
    <style><%@include file="/CSS_ALL/DuyetBaiEditor.css"%></style>
    <script
            type="text/javascript"
            src='https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js'
            referrerpolicy="origin">
    </script>
    <script type="text/javascript">
        tinymce.init({
            selector: '#editor',
            width: 1000,
            height: 600,
            plugins: [
                'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'preview', 'anchor', 'pagebreak',
                'searchreplace', 'wordcount', 'visualblocks', 'visualchars', 'code', 'fullscreen', 'insertdatetime',
                'media', 'table', 'emoticons', 'template', 'help'
            ],
            toolbar: false,
            menu: false,
            menubar: false,
            content_css: 'css/content.css'
        });
    </script>
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
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li>
                        <a href="#">Home 1</a>
                    </li>
                    <li>
                        <a href="#">Home 2</a>
                    </li>
                    <li>
                        <a href="#">Home 3</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">About</a>
            </li>
            <li>
                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
                <ul class="collapse list-unstyled" id="pageSubmenu">
                    <li>
                        <a href="#">Page 1</a>
                    </li>
                    <li>
                        <a href="#">Page 2</a>
                    </li>
                    <li>
                        <a href="#">Page 3</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">Portfolio</a>
            </li>
            <li>
                <a href="#">Contact</a>
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
            <h2>Chi tiết bài viết</h2>
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="ArticleID">Mã bài viết</label>
                        <input type="text" class="form-control" id="ArticleID" placeholder="Mã bài viết">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="authorID">Mã tác giả</label>
                        <input type="text" class="form-control" id="authorID" placeholder="Mã tác giả">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputNameArticle">Tên bài viết</label>
                    <input type="text" class="form-control" id="inputNameArticle" placeholder="Tên bài viết">
                </div>
                <div>
                    <label>Nội dung bài viết</label>
                    <textarea id="editor" style="width: 100%" name="articlecontent">ABcd</textarea>
                </div>

                <div class="modal fade" id="duyetModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modelTitle">Duyệt bài viết</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <form>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="artID">Mã bài viết</label>
                                            <input type="text" class="form-control" id="artID" placeholder="Mã bài viết">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="authID">Mã tác giả</label>
                                            <input type="text" class="form-control" id="authID" placeholder="Mã tác giả">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="artName">Tên bài viết</label>
                                        <input type="text" class="form-control" id="artName" placeholder="Tên bài viết">
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-4">
                                            <label for="inputState">Hashtag</label>
                                            <select id="inputState" class="form-control">
                                                <option selected>Choose...</option>
                                                <option>...</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="inputZip">Ngày xuất bản</label>
                                            <input type="date" class="form-control" id="inputZip">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Quay về</button>
                                <button type="button" class="btn btn-success">Xác nhận</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="tuchoiModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Từ chối bài viết</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Mã bài viết</label>
                                            <input type="text" class="form-control" id="inputEmail4" placeholder="Mã bài viết">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Mã tác giả</label>
                                            <input type="text" class="form-control" id="inputPassword4" placeholder="Mã tác giả">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAddress">Tên bài viết</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="Tên bài viết">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Ghi chú</label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Quay về</button>
                                <button type="button" class="btn btn-danger">Xác nhận</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#tuchoiModalCenter">Từ chối</button>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#duyetModalCenter">Duyệt bài</button>

            </form>
        </div>
    </div>
</div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
