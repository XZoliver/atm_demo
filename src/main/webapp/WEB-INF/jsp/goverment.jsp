<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../CSS/reset.css">
    <title>管理员模块</title>
    <style>
        .main{
            margin:30px 150px;
        }
        .main .head h1{
            font-size: 1.5em;
        }
        .main .head{
            line-height: 1.5;
            border:1px solid black;
            text-align: center;
        }
        .main .head h1{
             margin: 50px;
        }
        .main .head h1 a{
            font-size: 2em;
            padding: 10px;
            border: 1px solid #000;
           border-radius: 15%;
        }
        .clearfix::after{
            content: "";
            display:block;
            clear:both;
        }
    
      
    </style>
</head>
<body>
    <div class="main ">
          <div class="head ">
                <h1><a href="../admin/getUser">用户账户管理</a></h1>
                <h1><a href="../admin/updatePassword">密码修改</a></h1>
                <h1><a href="../admin/notice">修改网银公告</a></h1>
                <h1><a href="../admin/logout">退出</a></h1>
          </div>
         
    </div>
  
</body>
</html>