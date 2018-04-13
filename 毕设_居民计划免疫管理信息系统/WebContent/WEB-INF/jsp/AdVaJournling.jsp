<!DOCTYPE html>
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

    <title>后台管理·接种报表</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">

	<script
		src="${pageContext.request.contextPath }/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="DashBoard.do">计划免疫管理信息系统后台管理</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="DashBoardLogin.do">退出系统</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" id="va_name" class="form-control" placeholder="疫苗名称" data-options="required:true">
            <input type="button" onclick="addQuestion()" class="form-control" value="查看特定疫苗报表" >
          </form>
        </div>
      </div>
    </nav>
    
	<!-- 表头 -->
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="gotoAdUser.do">用户信息</a></li>
            <li><a href="gotoAdVaRecord.do">接种记录</a></li>
            <li><a href="gotoAdNotice.do">接种通知</a></li>
            <li><a href="gotoAdJournaling.do">接种报表</a></li>
            <li><a href="gotoAdNews.do">接种资讯</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">免疫报表</h1>
        </div>
        
        <form class="form-horizontal">
	    	<div class="form-group">
	    	    <label for="exampleInputEmail1" class="col-sm-4 control-label">查看该时间区间报表&nbsp&nbsp&nbsp从</label>
	    		<input id="TimeZoneBegin" type="date"/>
	    		<label for="exampleInputEmail1" class=" control-label">&nbsp&nbsp&nbsp到</label>
	    		<input id="TimeZoneEnd" type="date"/>
	    		<label for="exampleInputEmail1" class=" control-label">&nbsp&nbsp&nbsp</label>
	    		<input id="confirmButton" type="button" value="确定" onclick="addQuestion()"/>
	    		<label for="exampleInputEmail1" class=" control-label">&nbsp&nbsp&nbsp</label>
	    		<input id="cancels" type="button" value="查看所有时间" onclick="refreshCurrentPage()"/>
	    	</div>
	    </form>
	     
        <div class="col-sm-8 col-sm-offset-2">
          	<table class="table table-bordered" id="va_record">
          		<tr class="info">
					<th>疫苗名称</th>
					<th>应接种人数</th>
					<th>实接种人数</th>
					<th>当前接种率</th>
				</tr>
			</table>
        </div>
        
      </div>
    </div>

    
    <script type="text/javascript">
    //页面刷新自动调用
     window.onload=function(){
	   	 	$.ajax({
					url:"RefreshJournling.action",
					type:"get",
					success:function(data){
						//首先删除原表格数据
						var trArray = $("#va_record tr");
						var trArrayLen = trArray.length;
						if(trArrayLen>1){
							for(var index=1;index<trArrayLen;index++){
								trArray[index].remove();
							}						
						}
						//刷新表格，将新数据绘制出来
						if(data.length>0){
							for(var index in data){
								var journaling = data[index];
								var trObjStr=
									 '<tr><td>'+journaling.j_type+'</td>'
									+'<td>'+journaling.non_num+'</a></td>'
									+'<td>'+journaling.va_num+'</td>'
									+'<td>'+journaling.va_ratio+'%</td></tr>';
								$("#va_record").append(trObjStr);
							}
						}
					},
					error:function(){
						alert("system error");
					}
			});
	    }

    function addQuestion(){
    	 var va_name = $('#va_name').val();
    	 var TimeZoneBegin = $('#TimeZoneBegin').val();
    	 var TimeZoneEnd = $('#TimeZoneEnd').val();
    	 if(va_name == null || va_name == ""){
    		 va_name = "false";
    	 }
    	 if(TimeZoneBegin == null || TimeZoneBegin == ""){
    		 TimeZoneBegin = "false";
    	 }
    	 if(TimeZoneEnd == null || TimeZoneEnd == ""){
    		 TimeZoneEnd = "false";
    	 }
    	 $.ajax({
				url:"addQuestionRequest.action",
				type:"post",
				data : {
					"va_name":va_name,
					"TimeZoneBegin":TimeZoneBegin,
					"TimeZoneEnd":TimeZoneEnd
				},
				success:function(data){
					//首先删除原表格数据
					var trArray = $("#va_record tr");
					var trArrayLen = trArray.length;
					if(trArrayLen>1){
						for(var index=1;index<trArrayLen;index++){
							trArray[index].remove();
						}						
					}
					//刷新表格，将新数据绘制出来
					if(data.length>0){
						for(var index in data){
							var journaling = data[index];
							var trObjStr=
								 '<tr><td>'+journaling.j_type+'</td>'
								+'<td>'+journaling.non_num+'</a></td>'
								+'<td>'+journaling.va_num+'</td>'
								+'<td>'+journaling.va_ratio+'%</td></tr>';
							$("#va_record").append(trObjStr);
						}
					}
				},
				error:function(){
					alert("system error");
				}
    	 });
     }

    function refreshCurrentPage(){
    	 window.location.reload();
     }
	</script>
  </body>
</html>
