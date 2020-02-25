<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="/master/css/register.css" />
		<link rel="stylesheet" href="/master/css/footer&cbl.css" />
		<link rel="stylesheet" href="/master/css/daohang.css" />
		<script type="text/javascript" src="/master/js/jquery-1.11.3.js" ></script>		
		<script type="text/javascript" src="/master/js/bootstrap.js" ></script>
		<script type="text/javascript" src="/master/js/templet.js" ></script>
		<title></title>
		<script>
		function checkForm(){

				var uValue = document.getElementById("id").value;
				//alert(uValue);
				if(uValue==""){
					alert("身份证号不能为空!");
					return false;
				}
			    if(!(/(^\d{18}$)|(^\d{17}(\d|x|x)$)/g.test(uValue))){
			      alert("身份证号码有误!   请输入有效18位证件号！");
			      return false;
				}
				
				
				var userValue = document.getElementById("username").value;
				if(userValue==""){
					//给出错误提示信息
					alert("用户名不能为空!");
			        return false;
			    }
			    if(userValue.length>5){
			    	alert("姓名输入过长!");
			    	return false;
			    }
				if(!(/^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$/g.test(userValue))){
					alert("用户名只能输入中文");
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
				
				var addValue = document.getElementById("useraddress").value;
				if(addValue==""){
					//给出错误提示信息
					alert("地址不能为空!");
			        return false;
			    }
			    if(addValue.length>10){
			    	alert("地址信息填写过长!");
			    	return false;
			    }
				if(!(/^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$/g.test(addValue))){
					alert("地址只能输入中文");
					return false;
				}
				
				
				/*校验密码*/
				var pValue = document.getElementById("password").value;
			    
				if(pValue==""){
					alert("密码不能为空！");
					return false;
				}
				if(!(/^\d{6}$/g.test(pValue))){
			     alert("密码为6位密码！");
			     return false;
				}
				
				/**校验确认密码*/
				var rpValue = document.getElementById("repassword").value;
				if(rpValue!=pValue){
					alert("两次密码输入不一致!");
					return false;
				}
					
				
				/**验证码*/
				var eValue = document.getElementById("answer").value;
				var zValue = document.getElementById("answer-1").value;
				if( int(eValue)!=int(zValue) ){
					alert("验证码输入错误!");
					return false;
				}
				
				if(!$("yes").is(':checked')){
				alert("未同意条款!");
				return false;} 
			}	
		</script>
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
			<div class="container  ">
				<div class="c2">
					<a href=""></a><span>
						<img src="/master/img/qifeiye.png" />
					</span></a>
					<p>从这里开启建站之旅</p>	
				</div>
				<div class="c3">
					<form action="" value = "dddd" method="POST" name="regForm" onsubmit="return checkForm() " >
						<div class="form-group">
    						<label for="usernameoremail">身份证号 *</label>
    						<input type="text" name = "id" class="form-control" id="id">
    						<span class="pp hide">此项必须填写</span>
                          </div>

                          <div class="form-group">
    						<label for="usernameoremail">姓名 *</label>
    						<input type="text" name  = "username" class="form-control" id="username">
    						<span class="pp hide">此项必须填写</span>
                          </div>

                          <div class="form-group">
    						<label for="usernameoremail">电话 *</label>
    						<input type="number" name = "tele" class="form-control" id="phonenum">
    						<span class="pp hide">此项必须填写</span>
                          </div>


                          <div class="form-group">
    						<label for="usernameoremail">地址 *</label>
    						<input type="text" name = "address" class="form-control" id="useraddress">
    						<span class="pp hide">此项必须填写</span>
                          </div>
                          


                          <div class="form-group">
                            <label for="usernameoremail">性别 *</label>
                            
                                <input type="radio"  name="sex" value="男" checked/>
                                <span style="color: #CCCCCC">男</span>
                                <input type="radio" name="sex" value="女" checked/>
                                <span style="color: #CCCCCC">女</span>
                            
  							<span class="pp hide">此项必须填写</span>
                          </div>
                          

                          
  						<div class="form-group">
    						<label for="password">密码 <img class="help" src="/master/img/help.png" title="最少8位"/>*</label>
    						<input type="password" name = "passkey" class="form-control" id="password">
  							<span class="pp hide">此项必须填写</span>
                          </div>
                          


  						<div class="form-group">
    						<label for="password">再次输入密码 </label>
    						<input type="password" class="form-control" id="repassword">
  						</div>
  						<!--  <div class="form-group">
    						<label for="question">验证问题 *</label>
    						<p style="color: #CCCCCC; font-size: 14px;">请回答: <label id="answer" style="color: #CCCCCC; font-size: 14px;"></label> 等于几?</p>
    						<input type="text" class="form-control" id="answer-1">
  							<span class="pp hide">此项必须填写</span>
  						</div>
  						<div class="checkbox">
    						<label>
     		 					<input type="checkbox"> 我已经阅读并同意<a>服务条款</a>以及<a>法律声明</a>。我不会创建含有低俗内容及有碍社会安定内容的网站。
    						</label>
  						</div>-->
  						<div class="c3-1">
							<button type="submit" class="btn btn-default btn1" href = "../user/transfer"> 注册</button>  
							<a href="user_login" type="button" class="btn btn-default btn2">已经有账号了?请登录</a>
						</div>
					
                    </form>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>

				</div>
			</div>
		</div>
		
	</div>
	</body>
	<script type="/master/text/javascript" src="/master/js/hp.js" ></script>
	<script type="/master/text/javascript">
		/*$(function(){
			$("#dhbtn1").click(function(){
			//	console.log(1);
				$(".dhkuang").show();
				$(".dhneirong").animate("left","679px")
			})
		})*/
	</script>
	
</html>
