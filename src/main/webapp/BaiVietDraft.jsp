<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="Model.User"/>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Newspaper</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/TemplateAdmin/vendor/fontawesome-free/css/all.min.css"
          rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/TemplateAdmin/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<c:if test="${authUser.role == 3}">
    <body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center"
               href="${pageContext.request.contextPath}/Admin/BaiViet/ShowBaiViet">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin Newspaper <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/Admin/BaiViet/ShowBaiViet">
                    <span>Quản lý bài viết</span></a>
            </li>


            <hr class="sidebar-divider">


            <div class="sidebar-heading">
                Quản lý category và tag
            </div>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCategory"
                   aria-expanded="true" aria-controls="collapseTwo">
                    <span>Danh Mục</span>
                </a>
                <div id="collapseCategory" class="collapse" aria-labelledby="headingTwo"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Lựa chọn:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/Category/ThemCategory">Thêm
                            danh mục</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/Category/ShowCategory">Danh
                            sách danh mục chính</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTag"
                   aria-expanded="true" aria-controls="collapseTwo">
                    <span>Tag</span>
                </a>
                <div id="collapseTag" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Lựa chọn:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/Tag/ThemTag">Thêm
                            tag</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/Tag/ShowTag">Danh sách
                            tag</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Quản lý danh sách người dùng
            </div>
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/Admin/User/ShowUser"
                   aria-expanded="true">
                    <span>Danh sách người dùng</span>
                </a>
            </li>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                   aria-expanded="true" aria-controls="collapseTwo">
                    <span>Phân công</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Lựa chọn:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/User/ThemEditor">Thêm
                            biên tập viên</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/Admin/User/ShowEditor">Danh
                            sách biên tập viên</a>
                    </div>
                </div>
            </li>

                <%--            <!-- Nav Item - Charts -->--%>
                <%--            <li class="nav-item">--%>
                <%--                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/Admin/User/UserExtend"--%>
                <%--                   aria-expanded="true">--%>
                <%--                    <span>Gia hạn</span>--%>
                <%--                </a>--%>
                <%--            </li>--%>

            <!-- Nav Item - Tables -->

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="d-none d-sm-inline-block form-inline navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                   aria-label="Search" aria-describedby="basic-addon2" name="keyword">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="col-auto">
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/Writer/DangBai?id=1"
                           class="btn btn-primary btn-icon-split ">
                            <span class="text">Đăng bài</span>
                        </a>
                    </div>


                    <ul class="navbar-nav ml-auto">


                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
                                <img class="img-profile rounded-circle"
                                     src="${pageContext.request.contextPath}/TemplateAdmin/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="userDropdown">
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Quay về trang chủ
                                </a>
                            </div>
                        </li>

                    </ul>

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
                                                            <a href="DeleteArticleDraft?id=${t.id_article}"
                                                               class="btn btn-danger btn-icon-split ">
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
                                            <div class="dataTables_paginate paging_simple_numbers"
                                                 id="dataTable_paginate">
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

                    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Bạn muốn thoát khỏi hệ thống ??</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">Bạn chọn xác nhận sẽ quay về trang chủ.</div>
                                <div class="modal-footer">
                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/TrangChu">Xác
                                        nhận</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/TemplateAdmin/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/TemplateAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/TemplateAdmin/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/TemplateAdmin/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="${pageContext.request.contextPath}/TemplateAdmin/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="${pageContext.request.contextPath}/TemplateAdmin/js/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/TemplateAdmin/js/demo/chart-pie-demo.js"></script>
    </div>
    </body>
</c:if>
</html>