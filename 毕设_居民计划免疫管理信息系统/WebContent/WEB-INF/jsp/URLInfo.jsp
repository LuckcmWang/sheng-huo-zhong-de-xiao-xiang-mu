<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import= "java.nio.charset.Charset" %>
<%@ page import= "java.io.BufferedReader" %>
<%@ page import= "java.io.IOException" %>
<%@ page import= "java.io.InputStream" %>
<%@ page import= "java.io.InputStreamReader" %>
<%@ page import= "org.json.JSONException" %>
<%@ page import= "java.net.URL" %>
<%@ page import= "java.io.Reader" %>
<%@ page import= "org.json.JSONObject" %>
<%@ page import= "org.jsoup.Connection" %>
<%@ page import= "org.jsoup.Jsoup" %>
<%@ page import= "org.jsoup.nodes.Document" %>
<%@ page import= "org.jsoup.nodes.Element" %>
<%@ page import= "org.jsoup.select.Elements" %>
<%@ page import= "com.ssm.vaccinum.pojo.T_Parameter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>了解更多</title>
	
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
		T_Parameter news = (T_Parameter)request.getAttribute("news");
	%>
    <div class="container">
		<div class="header clearfix">
		  <h3 class="text-muted"><%out.println(news.getNews_title());%>资讯详情</h3>
		</div>
	  
      <!-- 表头 -->
     	<div>
     		<div>
     			<%
     				String url = news.getNews_source();
     			 	Connection conn = Jsoup.connect(url);
     			 	Document doc = conn.get();
     			 	Elements links = doc.select("p"); 
     			 	Element endText = doc.select("p.post-copyright").first();
     		        for (Element link : links) {
     		        	if(link.equals(endText)){
     		        		break;
     		        	}
     		        	out.println(link.toString());
     		        }
     			%>
     		</div>
        	<footer class="footer">
        	 <p>居民计划免疫管理信息系统 for毕业设计, &nbsp;文章来源于&copy;<a href="http://www.cnvax.com">中国疫苗网</a></p>
        	</footer>
		</div>
    </div> <!-- /container -->

	<script type="text/javascript">
	</script>
  </body>
</html>
