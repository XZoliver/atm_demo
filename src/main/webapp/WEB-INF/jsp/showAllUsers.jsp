<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showAllUsers.jsp' starting page</title>
     
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		a{text-decoration: none}
		table{width: 100%} 
		table,tr,th{border: 1px solid gray;border-collapse:collapse;}
		div{border: 0px solid red;}
	</style>
   <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <!-- <script src="js/outer.js" type="text/javascript"></script> -->
	<script type="text/javascript">
		$(function(){
			//表格隔行变色
			$("table>tbody>tr:even").css("background","gray");
			$("table>tbody>tr:odd").css("background","pink");
		
			
			
		});
	</script>
  </head>
  
  <body>
  	${admin.acoount}先生/女士,欢迎您       |<a href="admin/admin_index">返回</a>
  	<div style="text-align:center">用户信息查询</div>
	<table>
		<thead>
    		<tr>
    			<th>银行卡号</th>
    			<th>姓名</th>
    			<th>性别</th>
    			<th>电话</th>
    			<th>状态</th>
    			<th>操作</th>
    		</tr>
    	</thead>
    		<tbody>
    	<c:forEach var="user" items="${userList}">
    		<tr>
    			<th>${user.cardno}</th>
    			<th>${user.username}</th>
    			<th>${user.sex}</th>
    			<th>${user.tele}</th>
    			<th>${user.state}</th>
    			<th><a href="admin/disable?cardno=${user.cardno}"><button>修改状态</button></a></th>
    		</tr>
    		</c:forEach>
    		</tbody>
    	</table>
	<center>
 		当前第${page.pageNum+1}页/总共${page.pageSize}页  ，
 		<a href="admin/getUserPage?pageNum=${page.pageNum-1}&maxPage=${page.pageSize}">上一页</a> 
 		<a href="admin/getUserPage?pageNum=${page.pageNum+1}&maxPage=${page.pageSize}">下一页</a> 
 	</center>
 	</body>
</html>
