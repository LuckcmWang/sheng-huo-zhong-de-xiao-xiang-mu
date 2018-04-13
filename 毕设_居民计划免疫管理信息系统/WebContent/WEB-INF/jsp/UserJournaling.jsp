<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import= "com.ssm.vaccinum.pojo.T_Resident"%>
<%@ page import= "com.ssm.vaccinum.pojo.T_Resident_Detail"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>免疫报表·居民免疫管理</title>
	
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumbotron-narrow.css" rel="stylesheet">
    
    <script
		src="${pageContext.request.contextPath }/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/bootstrap.js"></script>

  </head>

  <body>
	
	  <%
	  	T_Resident resident = (T_Resident)request.getSession().getAttribute("currentResident");
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	  %>
	
	<div class="container">
	  <div class="header clearfix">
	    <nav>
	      <ul class="nav nav-pills pull-right">
			<li role="presentation"><a href="gotoDetail.do?resident_id=<%out.println(resident.getResident_id());%>">个人信息</a></li>
			<li role="presentation"><a href="gotoUserVaRecord.do?resident_id=<%out.println(resident.getResident_id());%>">接种记录</a></li>
			<li role="presentation class="active""><a href="gotoUserJournling.do?resident_id=<%out.println(resident.getResident_id());%>">接种报表</a></li>
			<li role="presentation"><a href="gotoUserNews.do?resident_id=<%out.println(resident.getResident_id());%>">资讯浏览</a></li>
	     </ul>
	   </nav>
	   <h3 class="text-muted"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> 计划免疫管理信息系统</h3>
	 </div>
	 
	<!-- 表头 -->
	 	<div>
			<form class="form-horizontal">
				<div class="form-group">
				<label class="col-lg-3 control-label">疫苗名称</label>
				  <div class="col-lg-4">
			      	<input type="text" id="va_name" class="form-control" placeholder="疫苗名称" data-options="required:true">
			      </div>
			      <div class="col-lg-4">
			      	<input type="button" onclick="addQuestion()" class="btn btn-info" value="查看特定疫苗报表" >
			      </div>
		      	</div>
			</form>
			
	        <form class="form-horizontal">
		    	<div class="form-group">
		    	    <label for="exampleInputEmail1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp查看该时间区间报表&nbsp&nbsp&nbsp从</label>
		    		<input id="TimeZoneBegin" type="date"/>
		    		<label for="exampleInputEmail1" class=" control-label">&nbsp&nbsp&nbsp到</label>
		    		<input id="TimeZoneEnd" type="date"/>
		    		<label for="exampleInputEmail1" class=" control-label">&nbsp&nbsp&nbsp</label>
		    		<input id="confirmButton" type="button" value="确定" onclick="addQuestion()"/>
		    		<label for="exampleInputEmail1" class=" control-label">&nbsp&nbsp&nbsp</label>
		    		<input id="cancels" type="button" value="查看所有时间" onclick="refreshCurrentPage()"/>
		    	</div>
		    </form>
		     
	        <div>
	          	<table class="table table-bordered" id="va_record">
	          		<tr class="info">
						<th>疫苗名称</th>
						<th>应接种人数</th>
						<th>实接种人数</th>
						<th>当前接种率</th>
					</tr>
				</table>
	        </div>
	        
	        <footer class="footer">
        		<p>居民计划免疫管理信息系统 for毕业设计, &copy;王成蒙.</p>
      		</footer>
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
    //查找用户
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
