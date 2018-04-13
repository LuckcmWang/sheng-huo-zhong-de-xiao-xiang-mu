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

    <title>后台管理·接种记录</title>

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
            <input type="text" id="resident_id" class="form-control" placeholder="用户编号或者姓名" data-options="required:true">
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
          <h1 class="page-header">接种记录</h1>
        </div>
        <div class="col-sm-8 col-sm-offset-2">
        	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage }"> 
			<input type="hidden" id="pageRowNum" name="pageRowNum" value="${page.pageRowNum }">
			<input type="hidden" id="allPageNum" name="allPageNum" value="${page.allPageNum }">
          	<table class="table table-bordered" id="va_record">
          		<tr class="info">
					<th>编号</th>
					<th>接种居民编号</th>
					<th>接种居民姓名</th>
					<th>接种日期</th>
					<th>疫苗编号</th>
					<th>接种费用</th>
					<th>接种效果</th>
					<th>接种地点</th>
					<th>接种评价</th>
					<th>删除记录</th>
				</tr>
			</table>
			<table class="table table-bordered">
				<tr><td colspan="5" align="center">
				<button data-toggle="modal" data-target="#add">添加接种记录</button>
				<button class="col-sm-offset-1" data-toggle="modal" data-target="#mod">修改接种记录</button>
				</td></tr>
			</table>
        </div>
        
        <!-- 添加接种记录 -->
        <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">添加接种记录</h4>
		      </div>
		      <div class="modal-body">
		        <form id="addRecord" action="AddRecord.do" method="post">
		          <div class="form-group">
		            <label class="control-label">接种居民编号:</label>
		            <input type="text" class="form-control" id="resident_id2" name="resident_id">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种日期:</label>
		            <input type="text" class="form-control" id="vaccination_date" name="vaccination_date">
		          </div>
		          <div class="form-group">
		            <label class="control-label">疫苗编号:</label>
		            <input type="text" class="form-control" id="va_id" name="va_id">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种费用:</label>
		            <input type="text" class="form-control" id="vaccination_charge" name="vaccination_charge">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种效果:</label>
		            <input type="text" class="form-control" id="vaccination_result" name="vaccination_result">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种地点:</label>
		            <input type="text" class="form-control" id="vaccination_place" name="vaccination_place">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种评价:</label>
		            <input type="text" class="form-control" id="vaccination_remarks" name="vaccination_remarks">
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
		
		<!-- 更新接种记录 -->
		<div class="modal fade" id="mod" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">修改接种记录</h4>
		      </div>
		      <div class="modal-body">
		        <form id="modRecord" action="ModRecord.do" method="post">
		          <div class="form-group">
		            <label class="control-label">接种记录编号:</label>
		            <input type="text" class="form-control" id="vaccination_id2" name="vaccination_id">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种居民编号:</label>
		            <input type="text" class="form-control" id="resident_id2" name="resident_id">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种日期:</label>
		            <input type="text" class="form-control" id="vaccination_date2" name="vaccination_date">
		          </div>
		          <div class="form-group">
		            <label class="control-label">疫苗编号:</label>
		            <input type="text" class="form-control" id="va_id2" name="va_id">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种费用:</label>
		            <input type="text" class="form-control" id="vaccination_charge2" name="vaccination_charge">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种效果:</label>
		            <input type="text" class="form-control" id="vaccination_result2" name="vaccination_result">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种地点:</label>
		            <input type="text" class="form-control" id="vaccination_place2" name="vaccination_place">
		          </div>
		          <div class="form-group">
		            <label class="control-label">接种评价:</label>
		            <input type="text" class="form-control" id="vaccination_remarks2" name="vaccination_remarks">
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
					url:"ajax_GetRecords.action",
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
								var vaccination = data.objList[index];
								var trObjStr=
									 '<tr><td>'+vaccination.vaccination_id+'</td>'
									+'<td>'+vaccination.resident_id+'</a></td>'
									+'<td>'+vaccination.resident.login_name+'</a></td>'
									+'<td>'+dateFormat(vaccination.vaccination_date)+'</td>'
									+'<td>'+vaccination.va_id+'</td>'
									+'<td>'+vaccination.vaccination_charge+'</td>'
									+'<td>'+vaccination.vaccination_result+'</td>'
									+'<td>'+vaccination.vaccination_place+'</td>'
									+'<td>'+vaccination.vaccination_remarks+'</td>'
									+'<td>'+'&nbsp<input type="button" value="删除该记录" onclick="deleteRecords('+vaccination.vaccination_id+')"/>&nbsp;'+'</td></tr>';
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
				url:"ResidentSearch.action",
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
							var vaccination = data.objList[index];
							var trObjStr=
								 '<tr><td>'+vaccination.vaccination_id+'</td>'
								+'<td>'+vaccination.resident_id+'</a></td>'
								+'<td>'+vaccination.resident.login_name+'</a></td>'
								+'<td>'+dateFormat(vaccination.vaccination_date)+'</td>'
								+'<td>'+vaccination.va_id+'</td>'
								+'<td>'+vaccination.vaccination_charge+'</td>'
								+'<td>'+vaccination.vaccination_result+'</td>'
								+'<td>'+vaccination.vaccination_place+'</td>'
								+'<td>'+vaccination.vaccination_remarks+'</td>'
								+'<td>'+'&nbsp<input type="button" value="删除该记录" onclick="deleteRecords('+vaccination.vaccination_id+')"/>&nbsp;'+'</td></tr>';
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
				url : "PageTurn.action",
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
							var vaccination = data.objList[index];
							var trObjStr=
								 '<tr><td>'+vaccination.vaccination_id+'</td>'
								+'<td>'+vaccination.resident_id+'</a></td>'
								+'<td>'+vaccination.resident.login_name+'</a></td>'
								+'<td>'+dateFormat(vaccination.vaccination_date)+'</td>'
								+'<td>'+vaccination.va_id+'</td>'
								+'<td>'+vaccination.vaccination_charge+'</td>'
								+'<td>'+vaccination.vaccination_result+'</td>'
								+'<td>'+vaccination.vaccination_place+'</td>'
								+'<td>'+vaccination.vaccination_remarks+'</td>'
								+'<td>'+'&nbsp<input type="button" value="删除该记录" onclick="deleteRecords('+vaccination.vaccination_id+')"/>&nbsp;'+'</td></tr>';
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
	     $("#addRecordButton").click(function(){
	    		var id = document.getElementById("resident_id2").value;
				var date = document.getElementById("vaccination_date").value;
				var va_id = document.getElementById("va_id").value;
				var charge = document.getElementById("vaccination_charge").value;
				var result = document.getElementById("vaccination_result").value;
				var place = document.getElementById("vaccination_place").value;
				var remarks = document.getElementById("vaccination_remarks").value; 
				if (id == null ||id  == "") {
					return false;
				}
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
				if (place == null ||place  == "") {
					return false;
				}
				if (remarks == null || remarks == "") {
					return false;
				}
				document.getElementById("addRecord").submit();
	    	});
	     
	     function deleteRecords(vaccination_id){
				$.ajax({
					url : "DelRecord.do",
					type : "post",
					dataType:"text",
					data : {
						"vaccination_id":vaccination_id,
					},
					success:function(responseText){
						window.location.reload();
					},
					error : function() {
						alert("error");
					}
				});
	    	}
	     
	     $("#modRecordButton").click(function(){
				document.getElementById("modRecord").submit();
	    });
	</script>
  </body>
</html>
