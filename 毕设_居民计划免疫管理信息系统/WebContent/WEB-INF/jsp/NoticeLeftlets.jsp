<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
<title>接种通知单</title>
<style type="text/css">
html, body {
	padding: 5px;
	border: 0;
	position: absolute;
	text-align: center;
	width:650px;
}

#green {
	margin:50px 30px 0px 30px;
	text-align: left;
	line-height:50px;
}

#green2 {
	margin:50px 30px;
	text-align: right;
	line-height:50px;
	padding: 0px 30px;
}

.loginPanel {
	position: absolute;
	text-align: center;
	top: 50%;
	left: 50%;
	width: 340px;
	height: 200px;
	margin-left: -170px;
	margin-top: -100px;
	background-color: #eee;
}
</style>
</head>
<body>
<h1>《预防接种通知单》</h1>
<h3 id="green">接种居民您好：</h3>
<h3 id="green">&nbsp;&nbsp;&nbsp;&nbsp;为了您的健康，请按照规定的时间到辖区预防接种门诊接种<%out.println(request.getAttribute("va_name"));%>!</h3>
<h3 id="green">接种人姓名：<u><%out.println(request.getAttribute("resident_name"));%></u>&nbsp;出生日期：<u><%out.println(request.getAttribute("birth_date"));%></u>&nbsp;来源地：<u><%out.println(request.getAttribute("resident_homeplace"));%></u></h3>
<h3 id="green">现居住地：<u><%out.println(request.getAttribute("resident_address"));%></u></h3>
<h3 id="green">补种疫苗名称：<u><%out.println(request.getAttribute("va_name"));%></u></h3>
<h3 id="green">接种医疗场所：<u><%out.println(request.getAttribute("va_address"));%></u>&nbsp;接种时间：<u>到<%out.println(request.getAttribute("va_deadline"));%></u></h3>
<h3 id="green2"><%out.println(request.getAttribute("va_address"));%></h3>
</body>
</html>