<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 12/29/2022
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin Newspaper</title>

  <!-- Custom fonts for this template-->
  <link href="TemplateAdmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="TemplateAdmin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

  <!-- Sidebar -->
  <ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">Admin Newspaper <sup>2</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
      <a class="nav-link" href="index.jsp">
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
      <div id="collapseCategory" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Lựa chọn:</h6>
          <a class="collapse-item" href="Category.jsp">Thêm danh mục</a>
          <a class="collapse-item" href="ShowCategory">Danh sách danh mục chính</a>
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
          <a class="collapse-item" href="ThemTag.jsp">Thêm tag</a>
          <a class="collapse-item" href="ShowTag">Danh sách tag</a>
        </div>
      </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
      Quản lý danh sách người dùng
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
         aria-expanded="true" aria-controls="collapseTwo">
        <span>Phân công</span>
      </a>
      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <h6 class="collapse-header">Lựa chọn:</h6>
          <a class="collapse-item" href="ThemPhanCong.jsp">Thêm biên tập viên</a>
          <a class="collapse-item" href="Phancong.jsp">Danh sách biên tập viên</a>
        </div>
      </div>
    </li>

    <!-- Nav Item - Charts -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="Giahan.jsp"
         aria-expanded="true">
        <span>Gia hạn</span>
      </a>
    </li>

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
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
          <i class="fa fa-bars"></i>
        </button>


        <ul class="navbar-nav ml-auto">




          <div class="topbar-divider d-none d-sm-block"></div>

          <!-- Nav Item - User Information -->
          <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
              <img class="img-profile rounded-circle"
                   src="TemplateAdmin/img/undraw_profile.svg">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                Logout
              </a>
            </div>
          </li>

        </ul>

      </nav>
      <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <div class="container-fluid">

          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Thêm danh mục chính
                  </h4>
                </div>
                <div class="card-body">
                  <form class="form-valide-with-icon" action="AddCategory" method="POST" novalidate="novalidate">
                    <div class="form-group">
                    <div class="form-group">
                      <label class="text-label">Tên danh mục</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-header" aria-hidden="true"></i>
                                            </span>
                        </div>
                        <input type="text" class="form-control" id="#" name="name" placeholder="Tên danh mục chính" value="">
                      </div>
                    </div>
                    <div class="form-group">
                    </div>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                  </form>

                </div>
              </div>

            </div>

          </div>
        </div>
      </div>

    </div>
    <!-- /.container-fluid -->
    <div class="container-fluid">

      <!-- Page Heading -->

      <!-- DataTales Example -->
      <div class="container-fluid">

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">Thêm danh mục phụ
                </h4>
              </div>
              <div class="card-body">
                <form class="form-valide-with-icon" action="AddSubCategory" method="POST" novalidate="novalidate">
                  <div class="form-group">
                    <div class="form-group">
                      <label class="text-label">Mã danh mục chính</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-header" aria-hidden="true"></i>
                                            </span>
                        </div>
                        <input type="text" class="form-control" id="#" name="parent_id" placeholder="Mã danh mục chính" value="">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="form-group">
                        <label class="text-label">Tên danh mục phụ</label>
                        <div class="input-group">
                          <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-header" aria-hidden="true"></i>
                                            </span>
                          </div>
                          <input type="text" class="form-control" id="#" name="name" placeholder="Tên danh mục phụ" value="">
                        </div>
                      </div>
                      <div class="form-group">
                      </div>
                      <button type="submit" class="btn btn-primary">Thêm</button>
                </form>
              </div>
            </div>

          </div>

        </div>
      </div>
    </div>

  </div>
  <!-- /.container-fluid -->

</div>
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
          <a class="btn btn-primary" href="TrangChu.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>


  <!-- Bootstrap core JavaScript-->
  <script src="TemplateAdmin/vendor/jquery/jquery.min.js"></script>
  <script src="TemplateAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="TemplateAdmin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="TemplateAdmin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="TemplateAdmin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="TemplateAdmin/js/demo/chart-area-demo.js"></script>
  <script src="TemplateAdmin/js/demo/chart-pie-demo.js"></script>

</body>

</html>
