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
            
            var uValue = document.getElementById("new_passkey").value;
            if(uValue==""){
                alert("请输入新密码!");
                return false;
            }

            
            /**校验确认密码*/
            var rpValue = document.getElementById("new_repasskey").value;
            if(rpValue!=uValue){
                alert("两次密码输入不一致!");
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
						<a href="#" class="navbar-brand"><img style="margin-top:1px;"  src="/master/img/qifeiye5.png"/></a>
                    </div>
                    <div>
                            <span style="color: #ffff;font-size:2em;">${admin.acoount}  管理员</span> 欢迎您&nbsp;&nbsp;&nbsp;
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
       <table class="xx"   style="margin-top: 30px;margin-left: 300px;"  >
                    
            <tr >
                <td >
            
                        <form action="" method="POST" name="update" style="text-align: center" onsubmit=" return checkForm()">
                                <table style="text-align: center;line-height:4">
                                 
                                    <tr>
                                        <td >
                                           新密码：
                                        </td>
                                        <td>
                                            <input type="password" name="newWord" id = "newWord">
                                        </td>
                                    </tr>
                                    
                                 
                                    <tr>
                                        <td >
                                           确认新密码：
                                        </td>
                                        <td>
                                            <input type="password"  id = "reWord">
                                        </td>
                                    </tr>
                                
                                 
                            </table>
                            <div style="border: none ;padding:20px 500px ">
                                            
                                    <input type="submit" class="btn btn-default btn1" style="width: 200px"  value="确认" name="" id="signin">
                            </div>
                      </form>
                 
                    </td>				
                </tr>
                
            </table>

				</div>
				</div>
			</div>   
		</div>
	</div>
	</body>
</html>
<script>

		  var errori ='<%=request.getParameter("result")%>';
		  if(errori=="a"){
		   alert("修改成功!");
			}

</script>