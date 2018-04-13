<!DOCTYPE html>
<html>
  <head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>后台管理·用户管理</title>

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
            <input type="text" id="resident_id" class="form-control" placeholder="用户编号或者账号" data-options="required:true">
            <input type="button" onclick="searchRe()" class="form-control" value="搜索用户" >
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
          <h1 class="page-header">用户信息</h1>
        </div>
        <div class="col-sm-8 col-sm-offset-2">
        	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage }"> 
			<input type="hidden" id="pageRowNum" name="pageRowNum" value="${page.pageRowNum }">
			<input type="hidden" id="allPageNum" name="allPageNum" value="${page.allPageNum }">
          	<table class="table table-bordered" id="va_record">
          		<tr class="info">
					<th>编号</th>
					<th>账号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>出生日期</th>
					<th>家庭住址</th>
					<th>手机号码	</th>
					<th>电子邮件</th>
					<th>身份证号</th>
					<th>籍贯</th>
				</tr>
			</table>
        </div>
      </div>
    </div>

<!--     Bootstrap core JavaScript
<!--     ================================================== --> -->
<!--     Placed at the end of the document so the pages load faster -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!--     <script>window.jQuery || document.write('<script src="${pageContext.request.contextPath }/assets/js/vendor/jquery.min.js"><\/script>')</script> -->
<%--     <script src="${pageContext.request.contextPath }/dist/js/bootstrap.min.js"></script> --%>
<!--     Just to make our placeholder images work. Don't actually copy the next line! -->
<%--     <script src="${pageContext.request.contextPath }/assets/js/vendor/holder.min.js"></script> --%>
<!--     IE10 viewport hack for Surface/desktop Windows 8 bug -->
<%--     <script src="${pageContext.request.contextPath }/assets/js/ie10-viewport-bug-workaround.js"></script> --%>
    
    <script type="text/javascript">
    //页面刷新自动调用
     window.onload=function(){
	   	 	$.ajax({
					url:"ajax_GetResident.action",
					type:"get",
					success:function(data){
						$('#currentPage').val(data.currentPage);
						$('#pageRowNum').val(data.pageRowNum);
						$('#allPageNum').val(data.allPageNum);
						//首先删除原表格数据
						var trArray = $("#va_record tr");
						var trArrayLen = trArray.length;
						if(trArrayLen>2){
							for(var index=1;index<trArrayLen;index++){
								trArray[index].remove();
							}						
						}
						//刷新表格，将新数据绘制出来
						if(data.objList.length>0){
							for(var index in data.objList){
								var resident = data.objList[index];
								var trObjStr=
									 '<tr><td>'+resident.resident_id+'</td>'
									+'<td>'+resident.login_name+'</a></td>'
									+'<td>'+resident.t_resident_detail.resident_name+'</a></td>'
									+'<td>'+resident.t_resident_detail.resident_sex+'</td>'
									+'<td>'+dateFormat(resident.t_resident_detail.birth_date)+'</td>'
									+'<td>'+resident.t_resident_detail.resident_address+'</td>'
									+'<td>'+resident.resident_telephone+'</td>'
									+'<td>'+resident.resident_email+'</td>'
									+'<td>'+resident.resident_idnumber+'</td>'
									+'<td>'+resident.t_resident_detail.resident_homeplace+'</td></tr>';
								$("#va_record").append(trObjStr);
							}
							var pageInfoStr = '<tr><td colspan="10" align="center">'
								+'<input type="button" value="首页" onclick="pageTurn_Ajax(1)"/> &nbsp;'
								+'<input type="button" value="上一页" onclick="pageTurn_Ajax(2)"/>&nbsp;'
								+'&nbsp;第'+data.currentPage+'页&nbsp;/&nbsp;共'+data.allPageNum+'页&nbsp;'
								+'<input type="button" value="下一页" onclick="pageTurn_Ajax(3)"/>&nbsp;'
								+'<input type="button" value="末页" onclick="pageTurn_Ajax(4)"/>&nbsp;'
								+'</td></tr>';
							$("#va_record").append(pageInfoStr);
						}
					},
					error:function(){
						alert("system error");
					}
			});
	    }
    
    //查找用户
     function searchRe(){
    	 var resident_id = $('#resident_id').val();
    	 $.ajax({
				url:"ResidentDetailSearch.action",
				type:"post",
				data : {
					"resident_id":resident_id
				},
				success:function(data){
					$('#currentPage').val(data.currentPage);
					$('#pageRowNum').val(data.pageRowNum);
					$('#allPageNum').val(data.allPageNum);
					//首先删除原表格数据
					var trArray = $("#va_record tr");
					var trArrayLen = trArray.length;
					if(trArrayLen>2){
						for(var index=1;index<trArrayLen;index++){
							trArray[index].remove();
						}						
					}
					//刷新表格，将新数据绘制出来
					if(data.objList.length>0){
						for(var index in data.objList){
							var resident = data.objList[index];
							var trObjStr=
								 	 '<tr><td>'+resident.resident_id+'</td>'
									+'<td>'+resident.login_name+'</a></td>'
									+'<td>'+resident.t_resident_detail.resident_name+'</a></td>'
									+'<td>'+resident.t_resident_detail.resident_sex+'</td>'
									+'<td>'+dateFormat(resident.t_resident_detail.birth_date)+'</td>'
									+'<td>'+resident.t_resident_detail.resident_address+'</td>'
									+'<td>'+resident.resident_telephone+'</td>'
									+'<td>'+resident.resident_email+'</td>'
									+'<td>'+resident.resident_idnumber+'</td>'
									+'<td>'+resident.t_resident_detail.resident_homeplace+'</td></tr>';
							$("#va_record").append(trObjStr);
						}
						var pageInfoStr = '<tr><td colspan="10" align="center">'
							+'<input type="button" value="首页" onclick="pageTurn_Ajax(1)"/> &nbsp;'
							+'<input type="button" value="上一页" onclick="pageTurn_Ajax(2)"/>&nbsp;'
							+'&nbsp;第'+data.currentPage+'页&nbsp;/&nbsp;共'+data.allPageNum+'页&nbsp;'
							+'<input type="button" value="下一页" onclick="pageTurn_Ajax(3)"/>&nbsp;'
							+'<input type="button" value="末页" onclick="pageTurn_Ajax(4)"/>&nbsp;'
							+'</td></tr>';
						$("#va_record").append(pageInfoStr);
					}
				},
				error:function(){
					alert("system error");
				}
    	 });
     }
    
    //翻页
     function pageTurn_Ajax(num) {
			var currentPage = $('#currentPage').val();//('${page.currentPage}' == ''?0:'${page.currentPage}');1
			var pageRowNum = $('#pageRowNum').val();//('${page.pageRowNum}' == ''?0:'${page.pageRowNum}');10
			var allPageNum = $('#allPageNum').val();//('${page.allPageNum}' == ''?0:'${page.allPageNum}');1
			var resident_id = $('#resident_id').val();
			switch (num) {
			case 1:	// 点击首页
				if(currentPage>1) currentPage = 1; 
				else return;
				break;
			case 2:	// 点击上一页
				if(currentPage>1) currentPage--; 
				else return;
				break;
			case 3:	// 点击下一页
				if(currentPage<allPageNum) currentPage++; 
				else return;
				break;
			case 4:	// 点击末页
				if(currentPage<allPageNum) currentPage = allPageNum; 
				else return;
				break;
			}
			
			$.ajax({
				url : "ResidentPageTurn.action",
				type : "post",
				data : {
					"currentPage":currentPage,
					"pageRowNum":pageRowNum,
					"allPageNum":allPageNum,
					"resident_id":resident_id
				},
				success : function(data) {
					//alert(data.currentPage);
					$('#currentPage').val(data.currentPage);
					$('#pageRowNum').val(data.pageRowNum);
					$('#allPageNum').val(data.allPageNum);
					
					//首先删除原表格数据
					var trArray = $("#va_record tr");
					var trArrayLen = trArray.length;
					if(trArrayLen>2){
						for(var index=1;index<trArrayLen;index++){
							trArray[index].remove();
						}
					}
					//刷新表格，将新数据绘制出来
					if(data.objList.length>0){
						for(var index in data.objList){
							var resident = data.objList[index];
							var trObjStr=
								 '<tr><td>'+resident.resident_id+'</td>'
								+'<td>'+resident.login_name+'</a></td>'
								+'<td>'+resident.t_resident_detail.resident_name+'</a></td>'
								+'<td>'+resident.t_resident_detail.resident_sex+'</td>'
								+'<td>'+dateFormat(resident.t_resident_detail.birth_date)+'</td>'
								+'<td>'+resident.t_resident_detail.resident_address+'</td>'
								+'<td>'+resident.resident_telephone+'</td>'
								+'<td>'+resident.resident_email+'</td>'
								+'<td>'+resident.resident_idnumber+'</td>'
								+'<td>'+resident.t_resident_detail.resident_homeplace+'</td></tr>';
							$("#va_record").append(trObjStr);
						}
						var pageInfoStr = '<tr><td colspan="10" align="center">'
							+'<input type="button" value="首页" onclick="pageTurn_Ajax(1)"/> &nbsp;'
							+'<input type="button" value="上一页" onclick="pageTurn_Ajax(2)"/>&nbsp;'
							+'&nbsp;第'+data.currentPage+'页&nbsp;/&nbsp;共'+data.allPageNum+'页&nbsp;'
							+'<input type="button" value="下一页" onclick="pageTurn_Ajax(3)"/>&nbsp;'
							+'<input type="button" value="末页" onclick="pageTurn_Ajax(4)"/>&nbsp;'
							+'</td></tr>';
						$("#va_record").append(pageInfoStr);
					}
				},
				error : function() {
					alert("error");
				}
			});
		}
	  	//时间格式转换
		function dateFormat(nS) {  
		    var date = new Date(nS);
		    var year = date.getFullYear();
		    var month = date.getMonth()+1;
		    month = month<10?"0"+month:month;
		    var day = date.getDate();
		    day = day <10?"0"+day:day;
		    return year+"-"+month+"-"+day;
		}
	</script>
  </body>
</html>
