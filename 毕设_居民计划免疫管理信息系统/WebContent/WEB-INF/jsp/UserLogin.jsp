<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>居民用户登录</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${pageContext.request.contextPath }/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <form class="form-signin" id="form" action="UserLogin.do" method="post">
        <h2 class="form-signin-heading">居民用户登录</h2>
        <label class="sr-only">用户名</label>
        <input type="text" id="loginName" name="login_name" class="form-control" placeholder="用户名 " required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="login_password" id="pwd" class="form-control" placeholder="密码" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住账户
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" onclick="cheak()">登录</button>
      </form>
    </div> <!-- /container -->
	<div class="mastfoot">
         <div class="inner">
             <p align="center">没有账号？去<a href="gotoCheck.do">注册</a> 
             <a href="index.html">返回首页</a></p>
         </div>
    </div>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath }/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript">
		function isLoginReturn() {
			var msg = "${error}";
			if (msg != null && msg.trim() != "") {
				alert(msg);
			}
		}
		function cheak() {
			var userName = document.getElementById("loginName").value;
			var password = document.getElementById("pwd").value;

			if (userName == null || userName == "") {
				return false;
			}
			if (password == null || password == "") {
				return false;
			}
			document.getElementById("form").submit();
		}
	</script>
  </body>
</html>
