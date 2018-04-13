<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>居民账号注册</title>

<link href="css/signin.css" rel="stylesheet">
<link href="bootstrapvalidator/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="bootstrapvalidator/dist/css/bootstrapValidator.css"
	rel="stylesheet">

<!-- Include the FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
<!--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />-->

<script
	src="${pageContext.request.contextPath }/bootstrapvalidator/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrapvalidator/vendor/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<!-- form: -->
			<section>
				<div class="col-lg-8 col-lg-offset-2">
					<div class="page-header">
						<h2>注册您的账号</h2>
					</div>

					<form id="defaultForm" method="post" class="form-horizontal">
					
						

						<div class="form-group">
							<label class="col-lg-3 control-label">用户名</label>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="login_name"
									id="loginName" placeholder="UserName" onblur="check()">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">密码</label>
							<div class="col-lg-5">
								<input type="password" class="form-control"
									name="login_password" id="pwd" placeholder="Password">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">确认密码</label>
							<div class="col-lg-5">
								<input type="password" class="form-control" id="pwd_confirm"
									placeholder="Confirm Password" name="confirm_password">
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label">手机号码</label>
							<div class="col-lg-5">
								<input type="text" class="form-control"
									name="resident_telephone" id="phone_num"
									placeholder="Phone Number">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">电子邮箱</label>
							<div class="col-lg-5">
								<input type="email" class="form-control" name="resident_email"
									id="email" placeholder="Email">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">身份证号</label>
							<div class="col-lg-5">
								<input type="text" class="form-control" name="resident_idnumber"
									id="credit_id" placeholder="Credit Identity Number">
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-3">
								<button type="button" class="btn btn-lg btn-primary" id="reg"
									onclick="regist()">注册</button>
							</div>
						</div>
					</form>
				</div>
			</section>
			<!-- :form -->
		</div>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// Generate a simple captcha
							function randomNumber(min, max) {
								return Math.floor(Math.random()
										* (max - min + 1) + min);
							}
							;
							$('#captchaOperation').html(
									[ randomNumber(1, 100), '+',
											randomNumber(1, 200), '=' ]
											.join(' '));

							$('#defaultForm')
									.bootstrapValidator(
											{
												//        live: 'disabled',
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													login_name : {
														validators : {
															notEmpty : {
																message : '用户名不能为空'
															},
															stringLength : {
																min : 3,
																max : 11,
																message : '用户名长度在3位到11位之间'
															},
															regexp : {
																regexp : /^[\u4e00-\u9fa5a-zA-Z0-9_]+$/,
																message : '用户名只能包含汉字，数字，字母以及下划线'
															},
															remote : {
																//这个属性应该封装了ajax的简单实现，只需要参数就可以实现ajax的判断
																//返回值默认为json，如{"valid",true}，string boolean
																type : 'POST',
																url : 'ajax_AccoutNumCheak.action',
																delay : 2000,
																message : '用户名已经被注册'
															},
															different : {
																field : 'login_password,confirm_password',
																message : '不建议密码和用户名一致'
															}
														}
													},
													login_password : {
														validators : {
															notEmpty : {
																message : '密码不能为空'
															},
															different : {
																field : 'login_name',
																message : '不建议密码和用户名一致'
															}
														}
													},
													confirm_password : {
														validators : {
															notEmpty : {
																message : '确认密码不能为空'
															},
															identical : {
																field : 'login_password',
																message : '两次输入密码不一致'
															},
															different : {
																field : 'login_name',
																message : '不建议密码和用户名一致'
															}
														}
													},
													resident_telephone : {
														validators : {
															notEmpty : {
																message : '手机号码不能为空'
															},
															regexp : {
																regexp : /^[0-9]+$/,
																message : '用户名只能包含数字'
															},
															stringLength : {
																min : 11,
																max : 11,
																message : '手机号码必须为11位数字'
															}
														}
													},
// 													username : {
// 														message : 'The username is not valid',
// 														validators : {
// 															notEmpty : {
// 																message : 'The username is required and cannot be empty'
// 															},
// 															stringLength : {
// 																min : 6,
// 																max : 30,
// 																message : 'The username must be more than 6 and less than 30 characters long'
// 															},
// 														}
// 													},
													resident_email : {
														validators : {
															emailAddress : {
																message : '这不是一个合法的邮箱地址'
															}
														}
													},
													resident_idnumber : {
														validators : {
															notEmpty : {
																message : '身份证号不能为空'
															},
															stringLength : {
																min : 18,
																max : 18,
																message : '身份证号长度必须为18位'
															},
															regexp : {
																regexp : /^[a-zA-Z0-9\.]+$/,
																message : '身份证号只能包含数字，字母'
															},
														}
													}
// 													birthday : {
// 														validators : {
// 															date : {
// 																format : 'YYYY/MM/DD',
// 																message : 'The birthday is not valid'
// 															}
// 														}
// 													}
													
												}
											});

							// Validate the form manually
							$('#validateBtn').click(
									function() {
										$('#defaultForm').bootstrapValidator(
												'validate');
									});

							$('#resetBtn').click(
									function() {
										$('#defaultForm').data(
												'bootstrapValidator')
												.resetForm(true);
									});
						});
		function regist(){
			var name = document.getElementById("loginName").value;
			var password = document.getElementById("pwd").value;
			var password_confirm = document.getElementById("pwd_confirm").value;
			var phone = document.getElementById("phone_num").value;
			var email = document.getElementById("email").value;
			var id = document.getElementById("credit_id").value;
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
							alert("由于系统错误，当前无法注册，请稍后再试")
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