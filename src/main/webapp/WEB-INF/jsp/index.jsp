<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" href="/master/css/bootstrap.css" />
		<link rel="stylesheet" href="/master/css/daohang.css" />
		<link rel="stylesheet" href="/master/css/style.css" >
		<link rel="stylesheet" href="/master/css/footer&cbl.css" />
		<script type="text/javascript" src="/master/js/jquery-1.11.3.js" ></script>		
		<script type="text/javascript" src="/master/js/bootstrap.js" ></script>
    	<script type="text/javascript" src="/master/js/index.js"></script>		
		<script type="text/javascript" src="/master/js/templet.js" ></script>
		<script type="text/javascript" src="/master/js/hp.js" ></script>
		<title></title>
	</head>
	<body>
	<div id="main">
		<header id="header" data-spy="affix" data-offset-top="70">
			<nav class="navbar-inverse" id="daohang">
				<div class="daohang">
					<div class="navbar-header clearfix">
						<button type="button" class="zd" id="zd" >
							<span class="glyphicon glyphicon-align-justify"></span>
						</button>
						<a href="#" class="navbar-brand"><img style="margin-top:1px;" src="/master/img/qifeiye5.png"/></a>
					</div>
					<div class="collapse navbar-collapse" id="daohangtiao">
						<ul class="zcdl nav navbar-nav pull-right">
							<li><a href="../main/user_login">登录</a></li>
							<li><a href="../main/registe">注册</a></li>
							<!-- 管理员登入 -->
							<li><a href="../main/gover_login">管理员登入</a></li>

						</ul>
					</div>					
				</div>
				
			</nav>
		</header>
		<div class="c">
			    <img class="img" src="/master/img/child.jpg"/>
				<div class="video">
					<video autoplay="autoplay" muted="muted" loop="loop">
						<source type="video/webm" src="/master/video/video1.webm"></source>
						<source type="video/mp4" src="/master/video/video1.mp4"></source>
					</video>
				</div>
				<div class="cover">
				
					<div class="container cc1">
						<div class="cover1 col-lg-6 col-md-6 pull-right" >
							<div class="co1 hide" id="con">
							
								<span>欢迎来到<br>居安国际银行</span>
							</div>
							<div class="co1" id="show"></div>  
							<div class="co2" >
								<p>一个简单的个人网上银行</p>
 								<p>开启你的财富管理之旅</p>
							</div>
							<a class="co3" href="main/registe" >免 费 创 建 账 户</a>
						</div>
					</div>
				 
				</div>			
		</div>
	
		
			<div class="f2">
				<div class="container">
					
					<hr style="width: 100%;border: none;height: 1px;background-color: #E2E2E2;"/>
					<p>#copy西北大学网上银行</p>
				</div>
			</div>
		 
	
		
	</div>
	</body>	
	
</html>

