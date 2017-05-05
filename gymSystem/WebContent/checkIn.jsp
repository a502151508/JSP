<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
         <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>检票</title>
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
			border-collapse: collapse;
			border: #999999 2px solid;
			width: 420px;
			padding: 3px;
			color: #222;
			}
			table th
			{
				background-color:#66EE66 ;
				padding:7px;
				font-size:14px;
			}
			table td
			{
			padding: 3px;
			text-align: center;
			font-size: 14px;
			background-color: #00FFFF;
			}
			.name
			{
				text-align: left;
				padding-left:15px;
			}
			
		-->
	</style>
</head>
<link type="text/css" href="style1.css" rel="stylesheet"/>
<body>

<center>
<%@ include file="head1.txt" %>
<form action="" method="post">
<div id="frm"><ul>
<li><h1>请输入学号</h1></li>
<li><input type="text" name="stunum"  style="width:200px; height:20px;"></li>
<li><input type="submit" value="查询" >
<input type = "reset" value="重置"> </li>
<%
request.setCharacterEncoding("utf-8");
String stunum= request.getParameter("stunum");

System.out.println("xuehao:"+stunum);
try
{
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from booking where stunum="+stunum);
	out.println("<table border=\"1\" width='800'>");
	out.println("<tr><th>项目名称</th><th>时间</th><th>入场信息</th><th>学号</th><th>操作</th></tr>");
	
	
	while(rs.next())
	{
		String resId=rs.getString("resId");
		CachedRowSet crs=tools.DBUtil.getRowSet("select*from reserve where resId="+resId);
		String date="",time="",isUsed;
		isUsed=rs.getString("isUsed");
		String isused=isUsed;
		if(isUsed.equals("1"))
			isUsed="未入场";
		if(isUsed.equals("0"))
			isUsed="已入场";
		if(crs.next())
		{
		out.println("<tr>");
		out.println("<td>" + crs.getString("event") + "</td>");
		date=crs.getString("date");
		time=crs.getString("time");
		
		if(date.equals("d1"))
			date="周一";
		if(date.equals("d2"))
			date="周二";
		if(date.equals("d3"))
			date="周三";
		if(date.equals("d4"))
			date="周四";
		if(date.equals("d5"))
			date="周五";
		if(date.equals("d6"))
			date="周六";
		if(date.equals("d7"))
			date="周日";
		if(time.equals("t1"))
			time="19:00~20:00";
		if(time.equals("t2"))
			time="20:00~21:00";
		if(time.equals("t3"))
			time="21:00~22:00";
		out.println("<td>" +date+" "+time + "</td>");
		out.println("<td>" + isUsed + "</td>");
		out.println("<td>" + stunum + "</td>");
		out.println("<td> <a href=\"check.jsp?resId="+resId+"&isUsed="+isused+"&stuNum="+(String)session.getAttribute("stuNum")+"\">入场</a> </td>");
		
		}
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
</form>
</ul></div>
</center>
</body>
</html>