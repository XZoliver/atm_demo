<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" href="/master/css/bootstrap.css" />
		<link rel="stylesheet" href="/master/css/login.css" />
		<link rel="stylesheet" href="/master/css/footer&cbl.css" />
		<link rel="stylesheet" href="/master/css/daohang.css" />
		<script type="text/javascript" src="/master/js/jquery-1.11.3.js" ></script>		
		<script type="text/javascript" src="/master/js/bootstrap.js" ></script>
		<script type="text/javascript" src="/master/js/templet.js" ></script>
		<script type="text/javascript" src="/master/js/hp.js" ></script>
		<title></title>
	</head>
	<body>
		<div id="main">
			<nav class=" navbar-inverse" id="daohang">
				<div class="daohang">
					<div class="navbar-header clearfix">
						<button type="button" class="zd" id="zd" >
							<span class="glyphicon glyphicon-align-justify"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse" id="daohangtiao">
						<span class="close"><a href="../main"><i></i></a></span>					
					</div>						
				</div>	
			
			</nav>
			<div class="main">	
			<div class="container">
				<div class="c2">
					<a href=""></a><span>
						<img src="/master/img/qifeiye.png" />
					</span></a>
					<p>西北大学国际银行欢迎您！</p>	
				</div>
				<div class="c3" style="margin-left: 8px;">
						<form class="container " style="background: rgba(230, 214, 214, 0.932);text-align: center"  action="" method="post">
               
								<div  style="font-size: 1.3em;">
									注册成功！
								</div>
								<br>
								<div style="font-size: 1.3em;" >
									注册账号为: <%= request.getParameter("number") %>
								</div>
								
								<br>
								<div class="return" class="">       
									<a href="user_login" >
								        <span style="font-size: 1.5em;color: #444">返回登入</span>
									</a>
								</div>
		
						   </form>
				</div>
			</div>
		
		
	</body>
</html>
