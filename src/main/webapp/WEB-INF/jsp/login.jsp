<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入jstl -->
<%@include file="common/tag.jsp" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
    
	<head>
	 	<%@include file="common/head.jsp"%>
	    <link rel="stylesheet" href="${basePath}resources/css/bootstrap.min.css">
		<title>会议室预约系统</title>
		<!-- Custom Theme files -->
		<link href="${basePath}resources/css/loginIndex.css" rel="stylesheet" type="text/css" media="all"/>
		<!-- Custom Theme files -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="keywords" content="会议室预约系统登录" />
		<!--Google Fonts-->
		<!--<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		--><!--Google Fonts-->

	</head>
	<body onkeydown="keyLogin()">
		<!--header start here-->
		<div class="login-form">
			<div class="top-login">
				<span><img src="${basePath}resources/images/group.png" alt=""/></span>
			</div>
			<h1>会议室预约系统登录</h1>
			<div class="login-top">
			<div>
				<div class="login-ic">
					<i class="icon"></i>
					<input type="text" id = "userId"/>
					<div class="clear"> </div>
				</div>
				<div class="login-ic">
					<i class="icon"></i>
					<input type="password" id = "password"/>
					<div class="clear"> </div>
					<div align = "center"id = "loginTip"> </div>
				</div>

			
				<div class="log-bwn">
					<input type = "submit"  id="login1" value="登录">
				</div>
				</div>
			</div>
			<p class="copy">© LDCoder</p>
     </div>	
     
     
     	
    <!--header start here-->
   </body>
   <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="${basePath}resources/js/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="${basePath}resources/js/bootstrap.min.js"></script>
    <script src="${basePath}resources/js/login.js"  type="text/javascript"></script>
	
</html>
