<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入jstl -->
<%@include file="common/tag.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@include file="common/head.jsp"%>
<title>框架测试</title>
</head>
<body>
<br><br><br><br>
	<div align = "center">
	   <span  id = "loginTip"></span><br>
	   <label for="userId">id：</label>
	   <input name= "userId" type = "text" id = "staffId"><br>
	   
	   
	 <br>
	 <button class = "btn btn_login" id = "search">查找</button>   
	</div>

	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="${basePath}resources/js/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="${basePath}resources/js/bootstrap.min.js"></script>
	<script src="${basePath}resources/js/test.js"  type="text/javascript"></script>
</body>
</html>