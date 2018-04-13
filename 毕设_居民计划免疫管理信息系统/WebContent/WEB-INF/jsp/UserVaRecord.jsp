<%@ page import="java.text.SimpleDateFormat"%>
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

    <title>接种记录·居民免疫管理</title>
	
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
            <li role="presentation" class="active"><a href="gotoUserVaRecord.do?resident_id=<%out.println(resident.getResident_id());%>">接种记录</a></li>
            <li role="presentation"><a href="gotoUserJournling.do?resident_id=<%out.println(resident.getResident_id());%>">接种报表</a></li>
            <li role="presentation"><a href="gotoUserNews.do?resident_id=<%out.println(resident.getResident_id());%>">资讯浏览</a></li>
          </ul>
        </nav>
        <h3 class="text-muted"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> 计划免疫管理信息系统</h3>
      </div>
	  
	<!-- 表头 -->
    <div>
        <div>
        	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage }"> 
			<input type="hidden" id="pageRowNum" name="pageRowNum" value="${page.pageRowNum }">
			<input type="hidden" id="allPageNum" name="allPageNum" value="${page.allPageNum }">
          	<table class="table table-bordered" id="va_record">
          		<tr class="info">
					<th>接种居民姓名</th>
					<th>接种日期</th>
					<th>接种疫苗</th>
					<th>接种费用</th>
					<th>接种效果</th>
					<th>接种地点</th>
					<th>接种评价</th>
				</tr>
			</table>
        </div>
        <footer class="footer">
         <p>居民计划免疫管理信息系统 for毕业设计, &copy;王成蒙.</p>
        </footer>
	</div>
	</div>
	
		<div class="modal fade" id="comment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">请用“良好”，“一般”，“较差”评价此次接种服务</h4>
		      </div>
		      <div class="modal-body">
		        <form id="commentVaccinum" action="commentVaccinum.do" method="post">
		          <div class="form-group">
		            <input type="hidden" class="form-control" id="resident_id" name="resident_id">
		          	<input type="hidden" class="form-control" id="vaccination_id" name="vaccination_id">
		            <input type="text" class="form-control" id="vaccination_remarks" name="vaccination_remarks">
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" id="commentButton">评价</button>
		      </div>
		    </div>
		  </div>
		</div>
    
    <script type="text/javascript">
    //页面刷新自动调用
     window.onload=function(){
    	    var resident_id=<%out.println(resident.getResident_id());%>
	   	 	$.ajax({
					url:"ResidentSearchForUser.action",
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
									 '<tr><td>'+vaccination.resident.login_name+'</a></td>'
									+'<td>'+dateFormat(vaccination.vaccination_date)+'</td>'
									+'<td>'+vaccination.vaccinum.va_name+'</td>'
									+'<td>'+vaccination.vaccination_charge+'</td>'
									+'<td>'+vaccination.vaccination_result+'</td>'
									+'<td>'+vaccination.vaccination_place+'</td>'
									+'<td>'+vaccination.vaccination_remarks+'&nbsp<input type="button" class="btn btn-info btn-xs" value="评价" data-toggle="modal" data-target="#comment" onclick="transPara('+vaccination.vaccination_id+')"/>&nbsp;'+'</td></tr>';
								$("#va_record").append(trObjStr);
							}
							var pageInfoStr = '<tr><td colspan="10" align="center">'
								+'<input type="button" value="首页" onclick="pageTurn_Ajax(1)" class="btn btn-info btn-xs"/> &nbsp;'
								+'<input type="button" value="上一页" onclick="pageTurn_Ajax(2)" class="btn btn-info btn-xs"/>&nbsp;'
								+'&nbsp;第'+data.currentPage+'页&nbsp;/&nbsp;共'+data.allPageNum+'页&nbsp;'
								+'<input type="button" value="下一页" onclick="pageTurn_Ajax(3)" class="btn btn-info btn-xs"/>&nbsp;'
								+'<input type="button" value="末页" onclick="pageTurn_Ajax(4)" class="btn btn-info btn-xs"/>&nbsp;'
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
			var resident_id = <%out.println(resident.getResident_id());%>
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
				url : "PageTurnForUser.action",
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
								 '<tr><td>'+vaccination.resident.login_name+'</a></td>'
								+'<td>'+dateFormat(vaccination.vaccination_date)+'</td>'
								+'<td>'+vaccination.vaccinum.va_name+'</td>'
								+'<td>'+vaccination.vaccination_charge+'</td>'
								+'<td>'+vaccination.vaccination_result+'</td>'
								+'<td>'+vaccination.vaccination_place+'</td>'
								+'<td>'+vaccination.vaccination_remarks+'&nbsp<input type="button" class="btn btn-info btn-xs" value="评价" data-toggle="modal" data-target="#comment" onclick="transPara('+vaccination.vaccination_id+')"/>&nbsp;'+'</td></tr>';
							$("#va_record").append(trObjStr);
						}
						var pageInfoStr = '<tr><td colspan="10" align="center">'
							+'<input type="button" value="首页" onclick="pageTurn_Ajax(1)" class="btn btn-info btn-xs"/> &nbsp;'
							+'<input type="button" value="上一页" onclick="pageTurn_Ajax(2)" class="btn btn-info btn-xs"/>&nbsp;'
							+'&nbsp;第'+data.currentPage+'页&nbsp;/&nbsp;共'+data.allPageNum+'页&nbsp;'
							+'<input type="button" value="下一页" onclick="pageTurn_Ajax(3)" class="btn btn-info btn-xs"/>&nbsp;'
							+'<input type="button" value="末页" onclick="pageTurn_Ajax(4)" class="btn btn-info btn-xs"/>&nbsp;'
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
	  	
		$("#commentButton").click(function(){
			document.getElementById("commentVaccinum").submit();
    	});
		
		function transPara(vaccination_id){
			$('#vaccination_id').val(vaccination_id);
			var resident_id=<%out.println(resident.getResident_id());%>
			$('#resident_id').val(resident_id);
		}
	</script>
  </body>
</html>
