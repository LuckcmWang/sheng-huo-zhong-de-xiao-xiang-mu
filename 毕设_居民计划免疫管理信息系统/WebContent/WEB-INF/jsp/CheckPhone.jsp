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
						<h2>请先绑定您的手机</h2>
					</div>

					<form id="send" method="post" class="form-horizontal" action="sendMessage.do">
						<div class="form-group">
							<label class="col-lg-3 control-label">手机号码</label>
							<div class="col-lg-4">
								<input type="text" class="form-control"
									name="resident_telephone" id="resident_telephone"
									placeholder="Phone Number">
							</div>
							<div class="col-lg-4">
								<input id="sendMessageButton" type="button" class="btn btn-primary" onclick="sendMessage()" value="获取手机短信验证码">
							</div>
						</div>
					</form>
					<form id="defaultForm" method="post" class="form-horizontal" action="confirmMessage.do">
						<div class="form-group">
							<label class="col-lg-3 control-label">输入短信验证码</label>
							<div class="col-lg-4">
								<input type="text" class="form-control" name="confrim_message"
									id="confrim_message" placeholder="message">
							</div>
							<div class="col-lg-4">
								<input id="confirmButton" type="button" class="btn btn-primary" onclick="confirm()" value="提交验证码">
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
													resident_telephone : {
														validators : {
															notEmpty : {
																message : '手机号码不能为空'
															},
															stringLength : {
																min : 11,
																max : 11,
																message : '手机号码长度必须为11位'
															},
															regexp : {
																regexp : /^[0-9]+$/,
																message : '手机号码只包含数字0~9'
															}
														}
													},
													confrim_message : {
														validators : {
															notEmpty : {
																message : '验证码不能为空'
															},
															stringLength : {
																min : 4,
																max : 4,
																message : '长度应为4位'
															},
															regexp : {
																regexp : /^[0-9]+$/,
																message : '验证码只包含数字0~9'
															}
														}
													}
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
		function confirm() {
			var confrim_message = $("#confrim_message").val();
			$.ajax({
				url : "confirmCode.do",
				type : "post",
				dataType:"text",
				data : {
					"confrim_message":confrim_message,
				},
				success : function(responseText) {
					if(responseText=="ok"){
						top.location='gotoReg.do';
					}else{
						document.getElementById("confirmButton").value="验证码不正确"
					}
				},
				error : function() {
					alert("error");
				}
			});
		}
		
		function sendMessage() {
			var telephone_num = $("#resident_telephone").val();
			$.ajax({
				url : "sendMessage.do",
				type : "post",
				dataType:"text",
				data : {
					"telephone_num":telephone_num,
				},
				success : function(responseText) {
					if(responseText=="ok"){
						$("#sendMessageButton").attr('disabled',true);
						document.getElementById("sendMessageButton").value="短信已发送"
					}else{
					}
				},
				error : function() {
					alert("error");
				}
			});
		}
	</script>
</body>
</html>