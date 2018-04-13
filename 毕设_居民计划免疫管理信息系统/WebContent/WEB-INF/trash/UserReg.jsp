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
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrapValidator.css" rel="stylesheet">
	
	<!-- validator JS -->
	<script src="${pageContext.request.contextPath }/js/jquery.min.js" charset="gbk"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" charset="gbk"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrapValidator.js" charset="gbk"></script>
	
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    
    <!-- core style  -->
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
      <form class="form-horizontal" id="form" action="UserReg.do" method="post">
      <h2 class="form-signin-heading" align="center">居民用户注册</h2>
          <div class="form-group">
            <label class="col-sm-2 control-label">手机号码</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="resident_telephone" id="phone_num" placeholder="Phone Number">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="button" class="btn btn-default">获取手机短信验证码</button>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">输入短信验证码</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="message" id="confrim_message" placeholder="message">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
				<button type="button" class="btn btn-default">提交验证码</button>
		    </div>
		  </div>
      	  <div class="form-group">
		    <label class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="login_name" id="loginName" placeholder="UserName" onblur="check()">
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
		      <button type="button" class="btn btn-lg btn-primary" id="reg" onclick="regist()">注册</button>
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
    $(document).ready(function() {
        $('form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	login_name: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '用户名长度必须在6到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含大写、小写、数字和下划线'
                        }
                    }
                },
                resident_email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱地址格式有误'
                        }
                    }
                }
            },
            submitHandler: function (validator, form, submitButton) {
                alert("submit");
            }
        });
    });
	function check(){
		var name = document.getElementById("loginName").value;
			$.ajax({
					url:"ajax_AccoutNumCheak.action",
					type:"post",
					dataType:"text",
					data:{
						login_name:name
					},
					success:function(responseText){
						var obj = document.getElementById("nameResul");
						var reg = document.getElementById("reg");
						if(responseText=="1"){
							reg.disabled=false;
						}else{
							reg.disabled=true;
							location.reload(true);
						}
					},
					error:function(){
						alert("system error");
					}
				});
	}
	function regist(){
		var name = document.getElementById("loginName").value;
		var password = document.getElementById("pwd").value;
		var password_confirm = document.getElementById("pwd_confirm").value;
		var phone = document.getElementById("phone_num").value;
		var email = document.getElementById("email").value;
		var id = document.getElementById("credit_id").value;
		if(name==null || name==""){
			return false;
		}
		if(password==null || password==""){
			return false;
		}
		if(password_confirm==null || password_confirm==""){
			return false;
		}
		if(password_confirm!=password){
			return false;
		}
		if(phone==null || phone==""){
			return false;
		}
		if(email==null || email==""){
			return false;
		}
		if(id==null || id==""){
			return false;
		}
		$.ajax({
				url:"ajax_Regist.action",
				type:"post",
				dataType:"text",
				data:{
					login_name:name,
					login_password:password,
					resident_telephone:phone,
					resident_email:email,
					resident_idnumber:id
				},
				success:function(responseText){
					if(responseText=="1"){
						alert("注册成功");
						top.location='UserLoginPage.do';
					}else{
						alert("用户名或密码不符合规范")
						top.location='gotoReg.do';
					}
				},
				error:function(){
					alert("system error");
				}
			});
		}
	</script>
  </body>
</html>
