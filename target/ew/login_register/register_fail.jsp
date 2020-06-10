<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册失败</title>
<link href="" rel="stylesheet">
</head>
<style> 
body{text-align:center} 
</style>
<style type=text/css> 
div{
	margin:0 auto;
}
</style>
<body>
    <div class= "div" id="content" style="background-color:#EEEEEE;height:200px;width:800px;text-align:center;line-height:200px;">
	<font size="6" color="#0066ff" text-align:center><% 
    	String error=(String)request.getAttribute("error");
    	out.println(error);
    	%></font><br/>
	</div>
    <a href="main">返回注册页面重新注册</a>
</body>
</html>