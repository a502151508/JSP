<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看体育馆可选列表</title>
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
</head>
<body>
<%@ include file="head1.txt" %>
<hr>
<center>
<div id="frm"><ul>
<li><H1>可选时段</H1></li>
</ul></div>
<%
try {
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from reserve");
	out.println("<table border=\"1\" width='80%'");
	out.println("<tr><th>项目名称</th><th>时间</th><th>容量</th><th>操作</th>");
	String tiMe="";
	String daTe="";
	while(rs.next()){
		String resId = rs.getString("resId");
		out.println("<tr>");
		out.println("<td>" + rs.getString("event") + "</td>");
		String time =rs.getString("time");
		String date=rs.getString("date") ;
		
		if(date.equals("d1"))
			daTe="周一";
		if(date.equals("d2"))
			daTe="周二";
		if(date.equals("d3"))
			daTe="周三";
		if(date.equals("d4"))
			daTe="周四";
		if(date.equals("d5"))
			daTe="周五";
		if(date.equals("d6"))
			daTe="周六";
		if(date.equals("d7"))
			daTe="周日";
		if(time.equals("t1"))
			tiMe="19:00~20:00";
		if(time.equals("t2"))
			tiMe="20:00~21:00";
		if(time.equals("t3"))
			tiMe="21:00~22:00";
		out.println("<td>" + daTe + tiMe + "</td>");
		out.println("<td>" + rs.getString("num") + "</td>");
		out.println("<td><a href=\"stu_booking.jsp?id="+resId+"\">查看学生</a>&nbsp&nbsp<a href=\"cou_modify.jsp?id="+resId+"\">修改</a>  &nbsp &nbsp <a href=\"res_delete.jsp?id="+resId+"\">删除</a></td>");
		
		out.println("</tr>");
	}
	out.println("</table>"); 
}catch(Exception e){
	e.printStackTrace();
}

%>
</center>
</body>
</html>