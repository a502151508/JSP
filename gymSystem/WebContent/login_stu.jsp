<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用体育馆订票系统，请登录。</title>
<link type="text/css" href="style1.css" rel="stylesheet"/>
<style type="text/css">
		<!--
			#frm ul
			{
				margin:0;
				
				padding:0;	
				float:center;
				list-style:none;
				border-color::#999;
				border-style:solid;
				border-width:0px;	
				background-color:#FFF
				
			}
			#frm ul li
			{
				width: 400px;
				border-color: #999;
				border-style: solid;
				border-width: 1px;
				border-bottom: none;
				border-left: none;
				border-right: none;
				font-size: 16px;
				padding: 5px 10px;
				text-align: left;
				float: center;
				clear: both;
				color: #666;
				background-image: -moz-linear-gradient(top, #FFFFFF, #DDDDDD); /* Firefox */
				background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #FFFFFF), color-stop(1, #DDDDDD)); 
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FFFFFF', endColorstr='#DDDDDD', GradientType='0'); /* IE*/
				
			}
			table
			{
				border-collapse:collapse;
				border:#999999 2px solid;
				width:420px;
				padding:3px;
				color:#222;	
			}
			table th
			{
				background-color:#66EE66 ;
				padding:7px;
				font-size:14px;
			}
			table td
			{
				padding:3px;
				text-align: center;
				font-size:14px;
				background-color:#BBF4BE ;
			}
			.name
			{
				text-align: left;
				padding-left:15px;
			}
			
		-->
	</style>
</head>
<center>
<div id="frm"><ul>
<li><h1><b>学生登录/Login</b></h1></li>
<body>

<form action="Validate_Stu" method="post">
<li>用户名：
<input type="text" name="username"  style="width:200px; height:20px;">
</li>
<li>密码： &nbsp &nbsp
<input type="password" name="userpwd" style="width:200px; height:20px;">

</li>
<li>
<input type="submit" value="登录" >
<input type = "reset" value="重置">
</li>
</form>
</ul></div>
</body>
</center>
</html>