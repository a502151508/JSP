<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>查看该时段购票学生</title>
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
<body>

<center><h1>查看该时段购票学生</h1>
<%

request.setCharacterEncoding("utf-8");
String resId= request.getParameter("id");
try
{
	String sql="select*from booking where resId='"+resId+"'";
	CachedRowSet rs=tools.DBUtil.getRowSet(sql);
	System.out.println(sql);
	out.println("<table border=\"1\" width='800'>");
	out.println("<tr><th>学生学号</th><th>学生姓名</th></tr>");
	while(rs.next())
	{
		String stunum=rs.getString("stunum");
		CachedRowSet crs0=tools.DBUtil.getRowSet("select*from stu_information where stunum="+stunum);
		while(crs0.next())
		{
		out.println("<tr>");
		out.println("<td>" + stunum + "</td>");
		out.println("<td>" + crs0.getString("stuname") + "</td>");
		out.println("</tr>");
		}
	}
}
catch(Exception e){
	e.printStackTrace();
}

%>
</center>
</body>
</html>