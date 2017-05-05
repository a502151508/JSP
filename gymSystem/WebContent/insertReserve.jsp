<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>新增可预订时段</title>
</head>
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
				background-color:#00FFFF ;
			}
			.name
			{
				text-align: left;
				padding-left:15px;
			}
			
		-->
	</style>

<body>
<%@ include file="head1.txt" %>
<hr>
<center>
<div id="frm"><ul>
<li><h3>新增时段</h3></li>
<form action="InsertRes" method="post">

<li>
体育项目：<select name='event' style='width:80px' >
<option value='乒乓球' selected>乒乓球</option>
<option value='羽毛球'>羽毛球</option>
<option value='篮球'>篮球</option>
<option value='网球场'>网球场</option>
<option value='游泳池'>游泳池</option>
<option value='健身房'>健身房</option>

</select>
</li>
<li>
时间：<select name='date' style='width:80px' >
<option value='d1' selected>周一</option>
<option value='d2' selected>周二</option>
<option value='d3' selected>周三</option>
<option value='d4' selected>周四</option>
<option value='d5' selected>周五</option>
<option value='d6' selected>周六</option>
<option value='d7' selected>周日</option>
</select>
<select name='time' style='width:120px' >
<option value='t1' selected>19:00~20:00</option>
<option value='t2' selected>20:00~21:00</option>
<option value='t3' selected>21:00~22:00</option>
</select>
</li>
<li>
容量：<input type="text" name="num" value="" >
</li>
<li>
<INPUT type="submit" value="提交">
</li>
</ul></div>
</form>
</center>
</body>
</html>