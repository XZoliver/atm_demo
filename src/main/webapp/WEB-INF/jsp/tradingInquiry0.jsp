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
               </div>  
                                          
                
                <table class="xx"   style="margin-top: 30px;margin-left: 300px;"  >
                    
                    <tr >
                        <td >
                            
                                <table >
                                        <thead>
                                            <tr>
                                                <th>记录编号</th>
                                                <th>银行卡号</th>
                                                <th>操作类型</th>
                                                <th>目标卡号</th>
                                                <th>金额</th>
                                                <th>时间</th>
                                            </tr>
                                        </thead>
                                            <tbody>
                                        <c:forEach var="record"  items = "${recordList}" >
                                            <tr>
                                                <th>${record.recordno}</th>
                                                <th>${record.cardno}</th>
                                                <th>${record.optype}</th>
                                                <th>${record.aimcard}</th>
                                                <th>${record.amount}</th>
                                                <th>${record.recordtime}</th>
                                            </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    <div style="text-align: center;color:#fff;">
                                        	 当前第${pageInfo.pageNum}页/总共${pageInfo.pages}页  ，
                                         <a href="tradingInquiry0?pageNum=${pageInfo.pageNum-1}&maxPage=${pageInfo.pages}">
                                            <span style="color: #fff">上一页</span> </a> 
                                         <a href="tradingInquiry0?pageNum=${pageInfo.pageNum+1}&maxPage=${pageInfo.pages}">
                                            <span style="color: #fff">下一页</span></a> 
                                    </div>
                        </td>				
                    </tr>
                    
                </table>

                        
                                
                        

        
              </div>

        </div>
        <!-- 
        <div class="container">
	<div class="row clearfix">
		<div class="col-md-3 column">
		</div>
		<div class="col-md-4 column">
			<ul class="pagination">
				<li>
					 <a href="user/tradingInquiry?pageNum=${pageInfo.pageNum-1}&maxPage=${pageInfo.pages}">上一页</a>
				</li>
			  <c:if test="${pageInfo.pageNum>=3}">
				<li>
					 <a href="user/tradingInquiry?pageNum=${pageInfo.pageNum-2}&maxPage=${pageInfo.pages}">${pageInfo.pageNum-2}</a>
				</li>
				</c:if>
				<c:if test="${pageInfo.pageNum>=2}">
				<li>
					 <a href="user/tradingInquiry?pageNum=${pageInfo.pageNum-1}&maxPage=${pageInfo.pages}">${pageInfo.pageNum-1}</a>
				</li>
				</c:if>
				<li class="text-success">
					 <a href="user/tradingInquiry?pageNum=${pageInfo.pageNum}&maxPage=${pageInfo.pages}">${pageInfo.pageNum}</a>
				</li>
				<c:if test="${pageInfo.pageNum<=(pageInfo.pages-1)}">
				<li>
					 <a href="user/tradingInquiry?pageNum=${pageInfo.pageNum+1}&maxPage=${pageInfo.pages}">${pageInfo.pageNum+1}</a>
				</li>
				</c:if>
				<c:if test="${pageInfo.pageNum<=(pageInfo.pages-2)}">
				<li>
					 <a href="user/tradingInquiry?pageNum=${pageInfo.pageNum+2}&maxPage=${pageInfo.pages}">${pageInfo.pageNum+2}</a>
				</li>
				</c:if>
				<li>
					 <a href="user/tradingInquiry?pageNum=${pageInfo.pageNum+1}&maxPage=${pageInfo.pages}">下一页</a>
				</li>
			</ul>
		</div>
		<div class="col-md-5 column" style="border:0px solid green;height: 76px;">
			 <span  style="line-height:76px!important;">
			共<strong>${pageInfo.pages}</strong>页&nbsp;&nbsp;&nbsp;&nbsp;到第<input placeholder="${pageInfo.pageNum}" size="1" style="height:34px">页&nbsp;&nbsp;<button class="btn btn-default">确定</button>
			</span>
		</div>
	</div>
</div>  	

-->
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
