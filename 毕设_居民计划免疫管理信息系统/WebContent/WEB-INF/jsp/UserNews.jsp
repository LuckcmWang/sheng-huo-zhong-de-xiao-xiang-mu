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

    <title>资讯浏览·居民免疫管理</title>
	
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
            <li role="presentation"><a href="gotoUserJournling.do?resident_id=<%out.println(resident.getResident_id());%>">接种报表</a></li>
            <li role="presentation" class="active"><a href="gotoUserNews.do?resident_id=<%out.println(resident.getResident_id());%>">资讯浏览</a></li>
          </ul>
        </nav>
        <h3 class="text-muted"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> 计划免疫管理信息系统</h3>
      </div>
	  
      <!-- 表头 -->
     <div>
     	<form class="form-horizontal">
	    	<div class="form-group">
	    	    <label for="exampleInputEmail1" class="col-sm-3 control-label">选择你的接种地址</label>
	    	    <div class="col-sm-9">
	    		<select class="form-control" id="va_address">
				  <option>儿童医院防保科</option>
				  <option>陕西省妇幼保健院</option>
				  <option>西安第四医院 儿保科</option>
				  <option>古城医院(新城区防疫站)</option>
				  <option>西安市妇幼保健院</option>
				  <option>碑林区柏树林社区卫生服务中心</option>
				  <option>西安市中心医院儿保科</option>
				  <option>莲湖区青年路社区卫生服务中心</option>
				  <option>莲湖区妇幼保健站</option>
				  <option>新城区中山门社区服务中心</option>
				</select>
				</div>
	    	</div>
	     </form>
	     
		<form id="newsSourceForm"  action="newsSourceForm.do" method="post">
			<input type="hidden" id="newsSourceInput" name="newsSourceInput"/>
		</form>
		
        <div>
        	<input type="hidden" id="currentPage" name="currentPage" value="${page.currentPage }"> 
			<input type="hidden" id="pageRowNum" name="pageRowNum" value="${page.pageRowNum }">
			<input type="hidden" id="allPageNum" name="allPageNum" value="${page.allPageNum }">
          	<table class="table table-bordered" id="va_record">
          		<tr class="info">
					<th>资讯标题</th>
					<th>发布日期</th>
					<th>接种疫苗</th>
					<th>资讯详情</th>
					<th>报名接种</th>
					<th>取消报名</th>
				</tr>
			</table>
        </div>
        <footer class="footer">
         <p>居民计划免疫管理信息系统 for毕业设计, &copy;王成蒙.</p>
        </footer>
	</div>
    </div> <!-- /container -->

	<script type="text/javascript">
	//页面刷新自动调用
    window.onload=function(){
   	    var resident_id=<%out.println(resident.getResident_id());%>
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
									 '<tr><td>'+news.news_title+'</a></td>'
									+'<td>'+dateFormat(news.news_date)+'</td>'
									+'<td>'+news.va_id+'</td>'
									+'<td>'+'&nbsp<input type="button" class="btn btn-info btn-xs" value="了解更多" onclick="learnMoreDetail('+news.news_id+')"/>&nbsp;'+'</td>'
									+'<td>'+'&nbsp<input id="signUp'+news.news_id+'" type="button" class="btn btn-info btn-xs" value="报名" onclick="signUpVaccinum('+news.news_id+','+news.va_id+','+resident_id+')" />&nbsp;'+'</td>'
									+'<td>'+'&nbsp<input id="cancel'+news.news_id+'" type="button" class="btn btn-info btn-xs" value="取消报名" onclick="cancelSignUp('+news.news_id+','+news.va_id+','+resident_id+')" disabled="true"/>&nbsp;'+'</td></tr>';
								$("#va_record").append(trObjStr);
							}
							var pageInfoStr = '<tr><td colspan="6" align="center">'
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
								 '<tr><td>'+news.news_title+'</a></td>'
								+'<td>'+dateFormat(news.news_date)+'</td>'
								+'<td>'+news.va_id+'</td>'
								+'<td>'+'&nbsp<input type="button" class="btn btn-info btn-xs" value="了解更多" onclick="learnMoreDetail('+news.news_id+')"/>&nbsp;'+'</td>'
								+'<td>'+'&nbsp<input id="signUp'+news.news_id+'" type="button" class="btn btn-info btn-xs" value="报名" onclick="signUpVaccinum('+news.news_id+','+news.va_id+','+resident_id+')"/>&nbsp;'+'</td>'
								+'<td>'+'&nbsp<input id="cancel'+news.news_id+'" type="button" class="btn btn-info btn-xs" value="取消报名" onclick="cancelSignUp('+news.news_id+','+news.va_id+','+resident_id+')" disabled="true"/>&nbsp;'+'</td></tr>';
							$("#va_record").append(trObjStr);
						}
						var pageInfoStr = '<tr><td colspan="6" align="center">'
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
	
	function learnMoreDetail(news_id){
// 		js里的function的参数若类型为字符串，无法直接传递，应该有特殊的操作
		$('#newsSourceInput').val(news_id);
		document.getElementById("newsSourceForm").submit();
	}
	
	function signUpVaccinum(news_id,va_id,resident_id){
		var va_address = $("#va_address").val();
		$.ajax({
			url : "signUpVaccinum.action",
			type : "post",
			dataType:"text",
			data : {
				"va_id":va_id,
				"resident_id":resident_id,
				"va_address":va_address,
			},
			success : function(responseText) {
				if(responseText=="ok"){
					alert("报名成功，如需取消报名请在报名后两小时内完成");
					$("#signUp"+news_id).attr('disabled',true);
					$("#cancel"+news_id).attr('disabled',false);
				}else{
					alert("您已经报名过了");
					$("#signUp"+news_id).attr('disabled',true);
					$("#cancel"+news_id).attr('disabled',false);
				}
			},
			error : function() {
				alert("error");
			}
		});
	}
	
	function cancelSignUp(news_id,va_id,resident_id){
		$.ajax({
			url : "cancelSignUp.action",
			type : "post",
			dataType:"text",
			data : {
				"va_id":va_id,
				"resident_id":resident_id,
			},
			success : function(responseText) {
				if(responseText=="ok"){
					alert("取消报名成功");
					$("#signUp"+news_id).attr('disabled',false);
					$("#cancel"+news_id).attr('disabled',true);
				}else{
					alert("接种通知已发送，报名无法取消");
					$("#signUp"+news_id).attr('disabled',true);
					$("#cancel"+news_id).attr('disabled',true);
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
