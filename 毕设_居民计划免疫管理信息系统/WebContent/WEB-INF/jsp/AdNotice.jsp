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

    <title>后台管理·接种通知</title>

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
          <h1 class="page-header">接种报名清单</h1>
        </div>
        <div class="col-sm-8 col-sm-offset-2">
        	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage }"> 
			<input type="hidden" id="pageRowNum" name="pageRowNum" value="${page.pageRowNum }">
			<input type="hidden" id="allPageNum" name="allPageNum" value="${page.allPageNum }">
          	<table class="table table-bordered" id="va_record">
          		<tr class="info">
					<th>居民编号</th>
					<th>计划接种疫苗编号</th>
					<th>计划接种日期</th>
					<th>通知接种</th>
					<th>生成通知单</th>
					<th>确认通知状况</th>
				</tr>
			</table>
        </div>
        
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">已通知未接种</h1>
        </div>
        <div class="col-sm-8 col-sm-offset-2">
        	<input type="hidden" id="currentPageNotice" name="currentPageNotice" value="${page.currentPage }"> 
			<input type="hidden" id="pageRowNumNotice" name="pageRowNumNotice" value="${page.pageRowNum }">
			<input type="hidden" id="allPageNumNotice" name="allPageNumNotice" value="${page.allPageNum }">
          	<table class="table table-bordered" id="va_notice">
          		<tr class="info">
					<th>居民编号</th>
					<th>计划接种疫苗编号</th>
					<th>接种截止日期</th>
					<th>接种通知发送时间</th>
				</tr>
			</table>
        </div>
        
        <form id="generateLeftlets" action="GenerateLeftlets.action" method="post">
			<input type="hidden" id="resident_id" name="resident_id" value="${page.currentPage }">
		 	<input type="hidden" id="va_id" name="va_id" value="${page.currentPage }">
		</form>
		
      </div>
    </div>

    <script type="text/javascript">
    //页面刷新自动调用
     window.onload=function(){
	   	 	$.ajax({
					url:"ajax_GetNotice.action",
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
								var planning = data.objList[index];
								var trObjStr=
									 '<tr><td>'+planning.resident_id+'</td>'
									+'<td>'+planning.va_id+'</a></td>'
									+'<td>'+dateFormat(planning.va_date)+'</td>'
									+'<td>'+'&nbsp<input type="button" value="短信通知" onclick="smsNotice('+planning.resident_id+','+planning.va_id+')"/>&nbsp;'+'</td>'
									+'<td>'+'&nbsp<input type="button" value="生成通知单" onclick="geneLeftlets('+planning.resident_id+','+planning.va_id+')"/>&nbsp;'+'</td>'
									+'<td>'+'&nbsp<input type="button" value="已通知" onclick="transport('+planning.resident_id+','+planning.va_id+')"/>&nbsp;'+'</td></tr>';
								$("#va_record").append(trObjStr);
							}
							var pageInfoStr = '<tr><td colspan="6" align="center">'
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
	   	 	
		   	 $.ajax({
					url:"ajax_GetNoticed_PreVaccine.action",
					type:"get",
					success:function(data){
						$('#currentPageNotice').val(data.currentPage);
						$('#pageRowNumNotice').val(data.pageRowNum);
						$('#allPageNumNotice').val(data.allPageNum);
						//首先删除原表格数据
						var trArray = $("#va_notice tr");
						var trArrayLen = trArray.length;
						if(trArrayLen>2){
							for(var index=1;index<trArrayLen;index++){
								trArray[index].remove();
							}						
						}
						//刷新表格，将新数据绘制出来
						if(data.objList.length>0){
							for(var index in data.objList){
								var notice = data.objList[index];
								var trObjStr=
									 '<tr><td>'+notice.resident_id+'</td>'
									+'<td>'+notice.va_id+'</a></td>'
									+'<td>'+dateFormat(notice.va_deadline)+'</td>'
									+'<td>'+dateFormat(notice.send_time)+'</td></tr>';
								$("#va_notice").append(trObjStr);
							}
							var pageInfoStr = '<tr><td colspan="4" align="center">'
								+'<input type="button" value="首页" onclick="noticepageTurn_Ajax(1)"/> &nbsp;'
								+'<input type="button" value="上一页" onclick="noticepageTurn_Ajax(2)"/>&nbsp;'
								+'&nbsp;第'+data.currentPage+'页&nbsp;/&nbsp;共'+data.allPageNum+'页&nbsp;'
								+'<input type="button" value="下一页" onclick="noticepageTurn_Ajax(3)"/>&nbsp;'
								+'<input type="button" value="末页" onclick="noticepageTurn_Ajax(4)"/>&nbsp;'
								+'</td></tr>';
							$("#va_notice").append(pageInfoStr);
						}
					},
					error:function(){
						alert("system error");
					}
			});
	 }
     
   //已通知按钮响应事件
     function geneLeftlets(a,b){
    	 $('#resident_id').val(a);
    	 $('#va_id').val(b);
    	 document.getElementById("generateLeftlets").submit();
     }
   
     //已通知按钮响应事件
     function transport(a,b){
    	 $.ajax({
				url : "ManagerPlanningVaccine.action",
				type : "post",
				dataType:"text",
				data : {
					"a":a,
					"b":b,
				},
				success:function(responseText){
					window.location.reload(); 
				},
				error : function() {
					alert("error");
				}
			});
     }
     
     function smsNotice(a,b){
    	 $.ajax({
				url : "smsSendAction.action",
				type : "post",
				dataType:"text",
				data : {
					"a":a,
					"b":b,
				},
				success:function(responseText){
					alert("短信已发送");
				},
				error : function() {
					alert("短信第三方提供商出错，暂时无法发送");
				}
			});
     }
     
     //通知的翻页
     function noticepageTurn_Ajax(num) {
			var currentPageNotice = $('#currentPageNotice').val();//('${page.currentPage}' == ''?0:'${page.currentPage}');1
			var pageRowNumNotice = $('#pageRowNumNotice').val();//('${page.pageRowNum}' == ''?0:'${page.pageRowNum}');10
			var allPageNumNotice = $('#allPageNumNotice').val();//('${page.allPageNum}' == ''?0:'${page.allPageNum}');1
			switch (num) {
			case 1:	// 点击首页
				if(currentPageNotice>1) currentPageNotice = 1; 
				else return;
				break;
			case 2:	// 点击上一页
				if(currentPageNotice>1) currentPageNotice--; 
				else return;
				break;
			case 3:	// 点击下一页
				if(currentPageNotice<allPageNumNotice) currentPageNotice++; 
				else return;
				break;
			case 4:	// 点击末页
				if(currentPageNotice<allPageNumNotice) currentPageNotice = allPageNumNotice; 
				else return;
				break;
			}
			
			$.ajax({
				url : "NoticePageTurn_PreVaccine.action",
				type : "post",
				data : {
					"currentPageNotice":currentPageNotice,
					"pageRowNumNotice":pageRowNumNotice,
					"allPageNumNotice":allPageNumNotice,
				},
				success : function(data) {
					//alert(data.currentPage);
					$('#currentPageNotice').val(data.currentPage);
					$('#pageRowNumNotice').val(data.pageRowNum);
					$('#allPageNumNotice').val(data.allPageNum);
					
					//首先删除原表格数据
					var trArray = $("#va_notice tr");
					var trArrayLen = trArray.length;
					if(trArrayLen>2){
						for(var index=1;index<trArrayLen;index++){
							trArray[index].remove();
						}						
					}
					//刷新表格，将新数据绘制出来
					if(data.objList.length>0){
						for(var index in data.objList){
							var notice = data.objList[index];
							var trObjStr=
								 '<tr><td>'+notice.resident_id+'</td>'
								+'<td>'+notice.va_id+'</a></td>'
								+'<td>'+dateFormat(notice.va_deadline)+'</td>'
								+'<td>'+dateFormat(notice.send_time)+'</td></tr>';
							$("#va_notice").append(trObjStr);
						}
						var pageInfoStr = '<tr><td colspan="4" align="center">'
							+'<input type="button" value="首页" onclick="noticepageTurn_Ajax(1)"/> &nbsp;'
							+'<input type="button" value="上一页" onclick="noticepageTurn_Ajax(2)"/>&nbsp;'
							+'&nbsp;第'+data.currentPage+'页&nbsp;/&nbsp;共'+data.allPageNum+'页&nbsp;'
							+'<input type="button" value="下一页" onclick="noticepageTurn_Ajax(3)"/>&nbsp;'
							+'<input type="button" value="末页" onclick="noticepageTurn_Ajax(4)"/>&nbsp;'
							+'</td></tr>';
						$("#va_notice").append(pageInfoStr);
					}
				},
				error : function() {
					alert("error");
				}
			});
		}
    //翻页
     function pageTurn_Ajax(num) {
			var currentPage = $('#currentPage').val();//('${page.currentPage}' == ''?0:'${page.currentPage}');1
			var pageRowNum = $('#pageRowNum').val();//('${page.pageRowNum}' == ''?0:'${page.pageRowNum}');10
			var allPageNum = $('#allPageNum').val();//('${page.allPageNum}' == ''?0:'${page.allPageNum}');1
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
				url : "NoticePageTurn.action",
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
							var planning = data.objList[index];
							var trObjStr=
								 '<tr><td>'+planning.resident_id+'</td>'
								+'<td>'+planning.va_id+'</a></td>'
								+'<td>'+dateFormat(planning.va_date)+'</td>'
								+'<td>'+'&nbsp<input type="button" value="短信通知" onclick="smsNotice('+planning.resident_id+','+planning.va_id+')"/>&nbsp;'+'</td>'
								+'<td>'+'&nbsp<input type="button" value="生成通知单" onclick="geneLeftlets('+planning.resident_id+','+planning.va_id+')"/>&nbsp;'+'</td>'
								+'<td>'+'&nbsp<input type="button" value="已通知" onclick="transport('+planning.resident_id+','+planning.va_id+')"/>&nbsp;'+'</td></tr>';
							$("#va_record").append(trObjStr);
						}
						var pageInfoStr = '<tr><td colspan="6" align="center">'
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
