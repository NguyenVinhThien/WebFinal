<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"
          integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS_ALL/DangKy.css">
</head>
<body>
<div class="form-container">
    <h1>Đăng Ký</h1>
    <form action="" method="POST" id="frmRegister" onsubmit="return checkPassword();">
        <label for="txtUsername">Username</label>
        <input type="text" id="txtUsername" name="username" placeholder="Nhập tài khoản" required>
        <label for="txtName">Họ và Tên</label>
        <input type="text" id="txtName" name="name" placeholder="Nhập họ tên" required>
        <label for="txtEmail">Email</label>
        <input type="email" id="txtEmail" name="email" placeholder="Nhập email" required>
        <label for="txtDOB">Ngày sinh</label>
        <input type="text" id="txtDOB" name="dob" placeholder="Nhập ngày sinh" required>
        <label for="txtPassword">Mật khẩu</label>
        <input type="password" id="txtPassword" name="rawpwd" placeholder="Nhập mật khẩu" required>
        <label for="txtConfirm">Xác nhận mật khẩu</label>
        <input type="password" id="txtConfirm" placeholder="Xác nhận mật khẩu" required>
        <label>Vai trò</label>
        <select style="width: 100%;
                padding: 12px 20px;
                color: #555;
                margin-bottom: 32px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                font-size: 16px" class="selectRole" name="role">
            <option value="0" selected>Subscriber</option>
            <option value="1">Writer</option>
        </select>
        <div class="terms">
            Khi bấm tạo tài khoản bạn đã đồng ý với
            <a href="#" class="rule">quy định</a>
            của tòa soạn
        </div>
        <div id="password-error" class="error"></div>
        <button type="submit">Tạo tài khoản</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
        integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $(`#frmRegister`).on('submit', function (e) {
        e.preventDefault();

        const username = $('#txtUsername').val();

        $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?user=' + username, function (data) {
            if (data === true) {
                $('#frmRegister').off('submit').submit();
            } else {
                alert('Tên tài khoản đã được sử dụng');
            }
        });
    });

    $(`#txtDOB`).datetimepicker({
        format: 'd/m/Y',
        timepicker: false,
        mask: true
    });

    $('#txtUsername').select();
</script>
<script>
    function checkPassword() {
        // Get the password and confirm password fields
        const password = document.getElementById('txtPassword');
        const confirmPassword = document.getElementById('txtConfirm');

        // Get the error message element
        const errorMessage = document.getElementById('password-error');

        // Check if the password and confirm password fields are the same
        if (password.value !== confirmPassword.value) {
            // If they are not the same, display an error message
            errorMessage.innerHTML = 'The password and confirm password fields do not match';
            return false;
        } else {
            // If they are the same, clear the error message and allow the form to be submitted
            errorMessage.innerHTML = '';
            return true;
        }
    }
</script>
</body>
</html>
