<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="Model.User"/>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 02/01/2023
  Time: 10:20 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng bài viết</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script
            type="text/javascript"
            src='https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js'
            referrerpolicy="origin">
    </script>
    <script type="text/javascript">
        tinymce.init({
            selector: '#editor',
            width: 1200,
            height: 600,
            plugins: [
                'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'preview', 'anchor', 'pagebreak',
                'searchreplace', 'wordcount', 'visualblocks', 'visualchars', 'code', 'fullscreen', 'insertdatetime',
                'media', 'table', 'emoticons', 'template', 'help'
            ],
            toolbar: 'undo redo | styles | bold italic | alignleft aligncenter alignright alignjustify | ' +
                'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
                'forecolor backcolor emoticons | help',
            menu: {
                favs: {title: 'My Favorites', items: 'code visualaid | searchreplace | emoticons'}
            },
            menubar: 'favs file edit view insert format tools table help',
            content_css: 'css/content.css'
        });
    </script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS_ALL/DangArticle.css">
</head>
<body>
<header>
    <h1>New Article E-Newspaper</h1>
</header>
<main>
    <form id="article-form" method="POST" novalidate="novalidate">
        <div class="row mb-2">
            <div class="col-md-4 mt-3">
                <label class="labels">Chuyên mục</label>
                <select id="select" class="form-control" name="cate">
                    <c:forEach items="${listC}" var="t">
                        <option value="${t.id}">${t.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4 mt-3"><label class="labels">Nhãn</label><input type="text"
                                                                                name="Nhan"
                                                                                class="form-control" value=""
                                                                                placeholder="Nhãn"></div>
            <div class="col-md-4 mt-3"><label class="labels">ID Author</label><input type="text"
                                                                                     name="writer"
                                                                                     class="form-control"
                                                                                     value="${authUser.id}"
                                                                                     placeholder="ID_Author"
                                                                                     readonly></div>
            <div class="col-md-12 mt-3"><label class="labels">Tiêu đề</label><input type="text"
                                                                                    name="title"
                                                                                    class="form-control" value=""
                                                                                    placeholder="Tiêu đề"></div>
          <div class="col-md-12 mt-3"><label class="labels">Hình ảnh tiêu đề</label><input type="text"
                                                                                  name="headline_image"
                                                                                  class="form-control" value=""
                                                                                  placeholder="Hình ảnh tiêu đề"></div>
            <div class="col-md-12 mt-3"><label class="labels">Tóm tắt nội dung</label><input type="text"
                                                                                             name="Tom_tat"
                                                                                             class="form-control"
                                                                                             value=""
                                                                                             placeholder="Tóm tắt">
            </div>
            <label class="col-md-12 mt-3">
                <input id="checkPremium" type="checkbox" name="qq" value="1">Premium</label>
        </div>
        <textarea id="editor" style="width: 100%" name="content">ABcd</textarea>
        <button type="submit">Đăng bài viết</button>
    </form>
</main>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
        integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
        crossorigin="anonymous"></script>
</body>
</html>
