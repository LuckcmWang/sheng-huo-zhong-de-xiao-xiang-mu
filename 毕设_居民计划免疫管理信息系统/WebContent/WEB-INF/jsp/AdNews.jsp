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

    <title>后台管理·接种资讯</title>

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
          <h1 class="page-header">接种资讯管理</h1>
        </div>
        <div class="col-sm-8 col-sm-offset-2">
        	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage }"> 
			<input type="hidden" id="pageRowNum" name="pageRowNum" value="${page.pageRowNum }">
			<input type="hidden" id="allPageNum" name="allPageNum" value="${page.allPageNum }">
          	<table class="table table-bordered" id="va_record">
          		<tr class="info">
					<th>资讯标题</th>
					<th>资讯来源</th>
					<th>资讯发布日期</th>
					<th>相关疫苗编号</th>
					<th>管理资讯</th>
				</tr>
			</table>
			<table class="table table-bordered">
				<tr><td colspan="5" align="center">
				<button data-toggle="modal" data-target="#addNews">发布新资讯</button>
				</td></tr>
			</table>
        </div>
      </div>
    </div>
	
	<div class="modal fade" id="addNews" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">发布新资讯</h4>
		      </div>
		      <div class="modal-body">
		        <form id="addNewsForm" action="AddNewsDo.do" method="post">
		          <div class="form-group">
		            <label class="control-label">资讯标题:</label>
		            <input type="text" class="form-control" id="news_title" name="news_title">
		          </div>
		          <div class="form-group">
		            <label class="control-label">资讯来源:</label>
		            <input type="text" class="form-control" id="news_source" name="news_source">
		          </div>
		          <div class="form-group">
		            <label class="control-label">资讯日期:</label>
		            <input type="text" class="form-control" id="news_date" name="news_date">
		          </div>
		          <div class="form-group">
		            <label class="control-label">相关疫苗编号:</label>
		            <input type="text" class="form-control" id="va_id" name="va_id">
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" id="addNewsButton">保存修改</button>
		      </div>
		    </div>
		  </div>
		</div>
	
    <script type="text/javascript">
    //页面刷新自动调用
     window.onload=function(){
	   	 	$.ajax({
					url:"ajax_GetVaNews.action",
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
								var news = data.objList[index];
								var trObjStr=
									 '<tr><td>'+news.news_title+'</td>'
									+'<td>'+news.news_source+'</a></td>'
									+'<td>'+dateFormat(news.news_date)+'</td>'
									+'<td>'+news.va_id+'</td>'
									+'<td>'+'&nbsp<input type="button" value="删除该资讯" onclick="deleteNews('+news.news_id+')"/>&nbsp;'+'</td></tr>';
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
				url : "NewsPageTurn.action",
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
							var news = data.objList[index];
							var trObjStr=
								 '<tr><td>'+news.news_title+'</td>'
								+'<td>'+news.news_source+'</a></td>'
								+'<td>'+dateFormat(news.news_date)+'</td>'
								+'<td>'+news.va_id+'</td>'
								+'<td>'+'&nbsp<input type="button" value="删除该资讯" onclick="deleteNews('+news.news_id+')"/>&nbsp;'+'</td></tr>';
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
    
    	//删除一条资讯
    	function deleteNews(news_id){
    		$.ajax({
				url : "deleteNewsAction.action",
				type : "post",
				dataType:"text",
				data : {
					"news_id":news_id,
				},
				success:function(responseText){
					window.location.reload();
				},
				error : function() {
					alert("error");
				}
			});
    	}
    	//发布资讯
    	$("#addNewsButton").click(function(){
			var id = document.getElementById("news_title").value;
			var date = document.getElementById("news_source").value;
			var charge = document.getElementById("news_date").value;
			var result = document.getElementById("va_id").value;
			if (id == null ||id  == "") {
				return false;
			}
			if (date == null ||date  == "") {
				return false;
			}
			if (charge == null ||charge  == "") {
				return false;
			}
			if (result == null ||result  == "") {
				return false;
			}
			document.getElementById("addNewsForm").submit();
	 	});
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
