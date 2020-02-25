<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
						<img style="margin-top:1px;"  src="/master/img/qifeiye.png" />
					</span></a>
					<p>管理员登入</p>	
				</div>
				<div class="c3">
						<form action="" method="POST" name="login" style="text-align: center" onsubmit=" return checkForm()">
						<div class="form-group">
    						<label for="usernameoremail">账号</label>
    						<input type="text" name = "passname" class="form-control" id="usernameoremail">
  						</div>
  						<div class="form-group">
    						<label for="password">密码</label>
    						<input type="password" name = "passnum" class="form-control" id="password">
  						</div>
  						
  						<div class="c3-1">
							<button id="denglu" type="submit" class="btn btn-default btn1">登录</button>  
						
  						</div>
						
					</form>
				</div>
			</div>
		
		
	</body>
</html>

<script>
     var errori ='<%=request.getParameter("error")%>';
		  if(errori=="a"){
		   alert("信息错误!");
		  }
</script>
