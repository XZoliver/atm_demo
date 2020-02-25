<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" href="/master/css/bootstrap.css" />
		<link rel="stylesheet" href="/master/css/example.css"/>
		<link rel="stylesheet" href="/master/css/footer&cbl.css" />
		<link rel="stylesheet" href="/master/css/daohang.css"/>
		<script type="text/javascript" src="/master/js/jquery-1.11.3.js" ></script>		
		<script type="text/javascript" src="/master/js/bootstrap.js" ></script>
		<script type="text/javascript" src="/master/js/hp.js"></script>
		<script type="text/javascript" src="/master/js/templet.js" ></script>
		<title></title>
	</head>
	<body>
	<div id="main">
		<header  data-spy="affix" data-offset-top="70">
			<nav class="navbar-inverse" id="daohang">
				<div class="daohang">
					<div class="navbar-header clearfix">
						<button type="button" class="zd" id="zd" >
							<span class="glyphicon glyphicon-align-justify"></span>
						</button>
						<a href="login" class="navbar-brand"><img style="margin-top:1px;"  src="/master/img/qifeiye5.png"/></a>
                    </div>
                    <div>
                         <span style="color: #fff">${user.username} ${mySex},欢迎您</span> &nbsp;&nbsp;&nbsp;
                    </div>
					<div class="collapse navbar-collapse" id="daohangtiao">					
						<ul class="zcdl nav navbar-nav pull-right">
						<!-- <li><a href="login.html">登录</a></li>-->	
							<li><a href="logout">退出</a></li>
						</ul>
					</div>					
				</div>
				<div id="box">
					<div class="box1 col-sm-2 col-xs-2">
						<span id="X" class="glyphicon glyphicon-remove pull-right" ></span>
					</div>
					
			</nav>
		</header>
		<div class="main">
			<div class="e1">
				
			    <div class="e1-2">
			    	<div class="e1-2-1">
						<div class="e1-2-1a container">
							<span>银行公告</span>	
                            <br>
                            <p>${notice.pbtime}</p>
                            <p>${notice.content}</p>
							
						</div>
					</div>
			    </div>
			</div>
			<div class="e2 clearfix">
				<div class="e2-1 col-lg-2 col-md-2">
					<ul class="eul1">
					 	<li><a href="login"><span class="active"><b class="glyphicon glyphicon-play1"></b> 首页</span></a></li>
						
						
						<li><span><b class="glyphicon glyphicon-play"></b>功能分类</span>
							<ul class="eul2">
								<li><a href="balanceEnquiry"><b class="glyphicon glyphicon-play1"></b> 余额查询</a></li>
								<li><a href="informationInquiry"><b class="glyphicon glyphicon-play1"></b> 信息查询</a></li>
								<li><a href="tradingInquiry"><b class="glyphicon glyphicon-play1"></b> 明细查询</a></li>
								<li><a href="transfer"><b class="glyphicon glyphicon-play1"></b> 转账</a></li>
								<li><a href="changePasskey"><b class="glyphicon glyphicon-play1"></b> 密码修改</a></li>
							</ul>
                        </li>
                        <li>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                        </li>
					</ul>
				</div>
				<div class="e2-2 col-lg-10 col-md-10 col-sm-12 col-xs-12 clearfix">
					<div class="e2-2-1">
						<div>
							<div class="e2-2-1-menu" data-toggle="collapse" data-target="#nav">按分类浏览<i class="glyphicon glyphicon-menu-down pull-right"></i></div>
							<nav  id="nav" class="collapse" >
							</nav>
						</div>							
					</div>		
				<div class=" e2-2 clearfix">								
            </div>
                    

                
        
       </div>
                <div class="function-borad" style="margin-top: 200px;">
                        <div style="margin-left: 400px;font-size: 2em;">
                            当前账户余额为 :<span style="color:red;">${balance}</span> 元
                        </div>
                           
                </div>
				</div>
				</div>
			</div>
		</div>
<!-- 
		<ul class="cbl" >
			<li><a href="#">
				<div class="icon d1"><i class="i1"></i><span class="title">在线客服</span></div>
			</a></li>
			<i class="clearfix"></i>
			<li><a href="#">
				<div class="icon d2"><i class="i2"></i><span class="title">4006285729</span></div>
			</a></li>
			
		</ul>
		-->
	</div>
	</body>
</html>
