<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
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

    <title>居民用户注册</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <form class="form-horizontal" action="UserReg.do" method="post">
      <h2 class="form-signin-heading" align="center">居民用户注册</h2>
      	  <div class="form-group">
		    <label class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="login_name" id="loginName" placeholder="UserName">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" name="login_password" id="pwd"  placeholder="Password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="pwd_confirm"  placeholder="Confirm Password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">手机号码</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="resident_telephone" id="phone_num" placeholder="Phone Number">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">电子邮箱</label>
		    <div class="col-sm-10">
		      <input type="email" class="form-control" name="resident_email" id="email" placeholder="Email">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">身份证号</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="resident_idnumber" id="credit_id" placeholder="Credit Identity Number">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">注册</button>
		    </div>
		  </div>
	</form>
	
    </div> <!-- /container -->
	<div class="mastfoot">
         <div class="inner">
             <p align="center">去<a href="UserLoginPage.do">登录</a>
             <a href="index.html">返回首页</a></p>
         </div>
    </div>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
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
