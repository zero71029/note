<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <style>
    body {
      background-color: black;
    }
    #timeCenter {
      color: white;
      position: relative;
      margin: 20% auto;
      width: 40px;
    }
    form{
      position:absolute;
      left: 47%;
      bottom:10%;
      background-color: rgb(50, 142, 195);
    }
  </style>
</head>
<body>

<div id="timeCenter">Error</div>
<script src="time.js"></script>
<form action="/AAA/Servlet01" method="post">
  <input type="text" placeholder="帳號" name="userName"><br>
  <input type="password" placeholder="密碼"name="userPassword"><br>
  <input type="submit" value="登入">

</form>

<br/>
</body>
</html>