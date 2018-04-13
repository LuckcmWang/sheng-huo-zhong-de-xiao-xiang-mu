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

    <title>计划免疫·后台管理</title>

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
        </div>
      </div>
    </nav>

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
          <h1 class="page-header">疫苗管理</h1>
        </div>
         <div class="col-sm-8 col-sm-offset-2">
        	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage }"> 
			<input type="hidden" id="pageRowNum" name="pageRowNum" value="${page.pageRowNum }">
			<input type="hidden" id="allPageNum" name="allPageNum" value="${page.allPageNum }">
          	<table class="table table-bordered" id="va_record">
          		<tr class="info">
					<th>疫苗编号</th>
					<th>疫苗名称</th>
					<th>特殊说明</th>
					<th>接种反应</th>
					<th>用法用量</th>
				</tr>
			</table>
			<table class="table table-bordered">
				<tr><td colspan="5" align="center">
				<button data-toggle="modal" data-target="#add">添加疫苗种类</button>
				<button class="col-sm-offset-1" data-toggle="modal" data-target="#mod">修改疫苗种类</button>
				</td></tr>
			</table>
        </div>
        
         <!-- 添加疫苗 -->
        <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">添加疫苗种类</h4>
		      </div>
		      <div class="modal-body">
		        <form id="addRecord" action="AddVaccine.do" method="post">
		          <div class="form-group">
		            <label class="control-label">疫苗名称:</label>
		            <input type="text" class="form-control" id="va_name" name="va_name">
		          </div>
		          <div class="form-group">
		            <label class="control-label">特殊说明:</label>
		            <input type="text" class="form-control" id="va_indication" name="va_indication">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种反应:</label>
		            <input type="text" class="form-control" id="va_reaction" name="va_reaction">
		          </div>
		          <div class="form-group">
		            <label class="control-label">用法用量:</label>
		            <input type="text" class="form-control" id="va_usage" name="va_usage">
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" id="addRecordButton">保存修改</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 更新疫苗 -->
		<div class="modal fade" id="mod" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">修改接种记录</h4>
		      </div>
		      <div class="modal-body">
		        <form id="modRecord" action="ModVaccine.do" method="post">
		        <div class="form-group">
		            <label class="control-label">疫苗编号:</label>
		            <input type="text" class="form-control" id="va_id" name="va_id">
		          </div>
		          <div class="form-group">
		            <label class="control-label">疫苗名称:</label>
		            <input type="text" class="form-control" id="va_name" name="va_name">
		          </div>
		          <div class="form-group">
		            <label class="control-label">特殊说明:</label>
		            <input type="text" class="form-control" id="va_indication" name="va_indication">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种反应:</label>
		            <input type="text" class="form-control" id="va_reaction" name="va_reaction">
		          </div>
		          <div class="form-group">
		            <label class="control-label">用法用量:</label>
		            <input type="text" class="form-control" id="va_usage" name="va_usage">
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" id="modRecordButton">保存修改</button>
		      </div>
		    </div>
		  </div>
		</div>
		
      </div>
    </div>

    
    <script type="text/javascript">
  
    //页面刷新自动调用
    window.onload=function(){
	   	 	$.ajax({
					url:"ajax_GetVaccine.action",
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
								var vaccine = data.objList[index];
								var trObjStr=
									 '<tr><td>'+vaccine.va_id+'</td>'
									+'<td>'+vaccine.va_name+'</a></td>'
									+'<td>'+vaccine.va_indication+'</a></td>'
									+'<td>'+vaccine.va_reaction+'</td>'
									+'<td>'+vaccine.va_usage+'</td></tr>';
								$("#va_record").append(trObjStr);
							}
							var pageInfoStr = '<tr><td colspan="5" align="center">'
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
				url : "VaccinePageTurn.action",
				type : "post",
				data : {
					"currentPage":currentPage,
					"pageRowNum":pageRowNum,
					"allPageNum":allPageNum,
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
							var vaccine = data.objList[index];
							var trObjStr=
								 '<tr><td>'+vaccine.va_id+'</td>'
								+'<td>'+vaccine.va_name+'</a></td>'
								+'<td>'+vaccine.va_indication+'</a></td>'
								+'<td>'+vaccine.va_reaction+'</td>'
								+'<td>'+vaccine.va_usage+'</td></tr>';
							$("#va_record").append(trObjStr);
						}
						var pageInfoStr = '<tr><td colspan="5" align="center">'
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
	   
		//管理疫苗
    	$("#addRecordButton").click(function(){
			var date = document.getElementById("va_name").value;
			var va_id = document.getElementById("va_indication").value;
			var charge = document.getElementById("va_reaction").value;
			var result = document.getElementById("va_usage").value;
			if (date == null ||date  == "") {
				return false;
			}
			if (va_id == null ||va_id  == "") {
				return false;
			}
			if (charge == null ||charge  == "") {
				return false;
			}
			if (result == null ||result  == "") {
				return false;
			}
			document.getElementById("addRecord").submit();
		});
	    $("#modRecordButton").click(function(){
			document.getElementById("modRecord").submit();
		});
	</script>
  </body>
</html>
