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

    <title>个人信息·居民免疫管理</title>
	
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
            <li role="presentation" class="active"><a href="gotoDetail.do?resident_id=<%out.println(resident.getResident_id());%>">个人信息</a></li>
            <li role="presentation"><a href="gotoUserVaRecord.do?resident_id=<%out.println(resident.getResident_id());%>">接种记录</a></li>
            <li role="presentation"><a href="gotoUserJournling.do?resident_id=<%out.println(resident.getResident_id());%>">接种报表</a></li>
            <li role="presentation"><a href="gotoUserNews.do?resident_id=<%out.println(resident.getResident_id());%>">资讯浏览</a></li>
          </ul>
        </nav>
        <h3 class="text-muted"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> 计划免疫管理信息系统</h3>
      </div>
	  
	  
      <div class="jumbotron">
        <h1>个人信息管理界面</h1>
        <p class="lead">在该页面查看并管理您的个人信息<a type="button" class="btn btn-link" data-toggle="modal" data-target="#mod"> 修改个人信息</a></p>
      </div>
        <p></p>
      <div class="row marketing">
        <div class="col-lg-6">
          <h4>姓名：</h4>
          <p><%out.println(resident.getT_resident_detail().getResident_name());%></p>

          <h4>出生日期：</h4>
          <p><%out.println(sdf.format(resident.getT_resident_detail().getBirth_date()));%></p>

          <h4>手机号码：</h4>
          <p><%out.println(resident.getResident_telephone());%></p>
          
          <h4>身份证号：</h4>
          <p><%out.println(resident.getResident_idnumber());%></p>
        </div>

        <div class="col-lg-6">
          <h4>性别：</h4>
          <p><%out.println(resident.getT_resident_detail().getResident_sex());%></p>

          <h4>家庭住址：</h4>
          <p><%out.println(resident.getT_resident_detail().getResident_address());%></p>

          <h4>电子邮件：</h4>
          <p><%out.println(resident.getResident_email());%></p>
          
          <h4>籍贯：</h4>
          <p><%out.println(resident.getT_resident_detail().getResident_homeplace());%></p>
        </div>
      </div>

      <footer class="footer">
        <p>居民计划免疫管理信息系统 for毕业设计, &copy;王成蒙.</p>
      </footer>
    </div> <!-- /container -->

	<div class="modal fade" id="mod" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">修改个人信息</h4>
		      </div>
		      <div class="modal-body">
		        <form id="modDetail" action="ModDetail.do" method="post">
		          <input type="hidden" id="resident_id" name="resident_id" value=<%out.println(resident.getResident_id());%>>
		          <div class="form-group">
		            <label class="control-label">姓名:</label>
		            <input type="text" class="form-control" id="resident_name" name="resident_name" value=<%out.println(resident.getT_resident_detail().getResident_name()); %>>
		          </div>
		          <div class="form-group">
		            <label class="control-label">性别:</label>
		            <input type="text" class="form-control" id="resident_sex" name="resident_sex" value=<%out.println(resident.getT_resident_detail().getResident_sex()); %>>
		          </div>
		          <div class="form-group">
		            <label class="control-label">出生日期:</label>
		            <input type="text" class="form-control" id="birth_date" name="birth_date" value=<%out.println(sdf.format(resident.getT_resident_detail().getBirth_date())); %>>
		          </div>
		          <div class="form-group">
		            <label class="control-label">家庭住址:</label>
		            <input type="text" class="form-control" id="resident_address" name="resident_address" value=<%out.println(resident.getT_resident_detail().getResident_address()); %>>
		          </div>
		          <div class="form-group">
		            <label class="control-label">手机号码:</label>
		            <input type="text" class="form-control" id="resident_telephone" name="resident_telephone" value=<%out.println(resident.getResident_telephone()); %>>
		          </div>
		          <div class="form-group">
		            <label class="control-label">电子邮件:</label>
		            <input type="text" class="form-control" id="resident_email" name="resident_email" value=<%out.println(resident.getResident_email()); %>>
		          </div>
		          <div class="form-group">
		            <label class="control-label">身份证号:</label>
		            <input type="text" class="form-control" id="resident_idnumber" name="resident_idnumber" value=<%out.println(resident.getResident_idnumber()); %>>
		          </div>
		          <div class="form-group">
		            <label class="control-label">籍贯:</label>
		            <input type="text" class="form-control" id="resident_homeplace" name="resident_homeplace" value=<%out.println(resident.getT_resident_detail().getResident_homeplace()); %>>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" id="modDetailButton">保存修改</button>
		      </div>
		    </div>
		  </div>
		</div>
	<script type="text/javascript">
		$("#modDetailButton").click(function(){
				document.getElementById("modDetail").submit();
	    });
	</script>
  </body>
</html>
