<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <script type="text/javascript">
            $(function(){
                //表格隔行变色
                $("table>tbody>tr:even").css("background","lightblue");
                $("table>tbody>tr:odd").css("background","#fff");  
                
                      
            });
             
            
        </script>
        <style>
        table,tr,th{border: 2px solid gray;border-collapse:collapse;}
        tr th{
            width: 180px;
        }
        </style>
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
						<a href="#" class="navbar-brand"><img style="margin-top:1px;"  src="/master/img/qifeiye5.png"/></a>
                    </div>
                    <div>
                        <span style="color: #fff;font-size:2em;">${admin.acoount} 管理员</span> 欢迎您&nbsp;&nbsp;&nbsp;
                    </div>
					<div class="collapse navbar-collapse" id="daohangtiao">					
						<ul class="zcdl nav navbar-nav pull-right">
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
						<li><span class="active"><b class="glyphicon glyphicon-play1"></b> 功能列表</span></li>
						
						<li><span><b class="glyphicon glyphicon-play"></b>功能分类</span>
							<ul class="eul2">
								<li><a href="getUser"><b class="glyphicon glyphicon-play1"></b> 用户账号管理</a></li>
								<li><a href="updatePassword"><b class="glyphicon glyphicon-play1"></b> 密码修改</a></li>
								<li><a href="notice"><b class="glyphicon glyphicon-play1"></b> 网银公告修改</a></li>
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
               </div>  
                                          
                
                <table class="xx"   style="margin-top: 30px;margin-left: 300px;"  >
                    
                    <tr >
                        <td >
                            
                                <table >
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
                                        <c:forEach var="user"  items = "${userList}" >
                                            <tr>
                                                	<th>${user.cardno}</th>
		                         				   	<th>${user.username}</th>
                           					  		<th>${user.sex}</th>
                     						       	<th>${user.tele}</th>
                            						<th id="state">${user.state}</th>
                            						<th><a href="disable?cardno=${user.cardno}&pageNum=${pageInfo.pageNum}&maxPage=${pageInfo.pages}"><button>修改状态</button></a></th>
                                            </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                   <div style="text-align: center;color:#fff;">
                                        	 当前第${pageInfo.pageNum}页/总共${pageInfo.pages}页  ，
                                         <a href="getUserPage?pageNum=${pageInfo.pageNum-1}&maxPage=${pageInfo.pages}">
                                            <span style="color: #fff">上一页</span> </a> 
                                         <a href="getUserPage?pageNum=${pageInfo.pageNum+1}&maxPage=${pageInfo.pages}">
                                            <span style="color: #fff">下一页</span></a> 
                                    </div>
                        </td>				
                    </tr>
                    
                </table>
  
              </div>

        </div>
	 </div>
	</body>
</html>
