<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 02/01/2023
  Time: 9:40 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Error 404</title>
  <style>
    /* Add some style to the page */
    body {
      font-family: sans-serif;
      text-align: center;
      margin: 50px;
    }
    a{
      text-decoration: none;
    }
    button{
      cursor: pointer;

    }
    h1 {
      color: #a9a9a9;
      font-size: 180px;
      margin-bottom: 0;
    }
    p {
      color: #666666;
      font-size: 22px;
      margin-top: 5px;
    }
  </style>
</head>
<body>
<h1>404</h1>
<p>Sorry, the page you requested was not found.</p>
<!-- Add a back to home button -->
<a href="${pageContext.request.contextPath}/TrangChu">
  <button style="font-size: 18px; padding: 15px 30px; border-radius: 5px; background-color: #f1f1f1; border: 1px solid #cccccc; text-decoration: none;">
    Back to Home
  </button>
</a>
<!-- Add a contact us button -->
<a href="/ContactUs">
  <button style="font-size: 18px; padding: 15px 30px; border-radius: 5px; background-color: #f1f1f1; border: 1px solid #cccccc; margin-left: 20px;">
    Contact Us
  </button>
</a>
</body>
</html>
