<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
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
        <style>
        form td{
            border: 1px solid red;
            width: 150px;
        }
        form td input{
            width: 600px;
            background:antiquewhite;
        }
        form td.t{
            text-align: center;
            font-size: 1em;
        }
        </style>
        <script>
        
        	function checkForm(){
        var userValue = document.getElementById("username").value;
         if(userValue.length>5){
			    	alert("姓名输入过长!");
			    	return false;
			    }
			    
	 	var addValue = document.getElementById("address").value;
				if(addValue==""){
					//给出错误提示信息
					alert("地址不能为空!");
			        return false;
			    }
			    if(addValue.length>10){
			    	alert("地址信息填写过长!");
			    	return false;
			    }
			    
			    var nValue = document.getElementById("phonenum").value;
                if(nValue == ""){
                alert("请输入号码");
                	return false;
                }
                if(!(/^\d{11}$/g.test(nValue)))
                {
                alert("请输入十一位电话号")
                			    return false;}
                if(!(/^13\d{9}$/g.test(nValue)||(/^15[0-35-9]\d{8}$/g.test(nValue))|| (/^18[05-9]\d{8}$/g.test(nValue)))){
                                //用于检测用户输入的手机号码是否正确 验证13系列和150-159(154除外)、180、185、186、187、188、189几种号码，长度11位
                alert("请输入正确的电话号码（例如139，136开头）");
                			    return false;
			    }
			    }
        </script>
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
                         <span style="color: #fff">${user.username} ${mySex},欢迎您</span>&nbsp;&nbsp;&nbsp;
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
                            
                                <form action="" value = "dddd" method="POST" name="regForm" onsubmit="return checkForm() " >
                                        <table  style="text-align: center;line-height: 4" >
                                            <tr  >
                                                <td colspan="2" >
                                                    <font size="4" >用户信息</font> &nbsp;&nbsp;&nbsp;USER INFORMATION
                                                </td>
                                            </tr>
                                            <tr>
                                                            <td >
                                                                银行卡号
                                                            </td>
                                                            <td  > 
                                                                    <input type="text" value ="${user.cardno}" name = "cardno" readonly style="border: none;">	
                                                                
                                                            </td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td >
                                                                身份证号
                                                            </td>
                                                            <td  > 
                                                                    <input type="text" value ="${user.id}" name = "id" readonly style="border: none;">	
                                                                
                                                            </td>
                                                        </tr>
                                            <tr>
                                                <td>
                                                    姓名
                                                </td>
                                                <td>
                                                        <input type="text" value ="${user.username}" name="username" id="username" style="border: none;">	
                                                    
                                                </td>
                                            </tr>
                
                                                                                    
                                            <tr>
                                                <td>
                                                    电话
                                                </td>
                                                <td>
                                                        <input type="text" value ="${user.tele}" id="phonenum" name="tele" style="border: none;">
            
                                                </td>
                                            </tr>
                
                                            <tr>
                                                <td>
                                                    地址
                                                </td>
                                                <td>
                                                    <input type="text" value ="${user.address}" name="address" id="address" style="border: none;">					
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    性别
                                                </td>
                                                <td>
                                                    
                                                    <input type="text" value ="${user.sex}" name="sex"  readonly style="border: none;">	
                                                </td>
                                            </tr>
            
                                        
            
                                        </table>
                                                
                                                <div style="border: none;padding:20px 500px ">
                                                    <input type="submit"  class="btn btn-default btn1" value="确认修改" id="modify" onclick="modify()">
                                                </div>	
                                                <div style="border: none;padding:20px 500px;">
                                                    <input type="button"  class="btn btn-default btn1" value="返回" id="yes" onclick="location.href='informationInquiry'">
                                                </div>
                                            
                                    </form> 
                           
                        </td>				
                    </tr>
                    
                </table>

                        
                                
                        

        
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
