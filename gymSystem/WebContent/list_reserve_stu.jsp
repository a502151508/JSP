<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订票信息</title>
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
<body>
<center>
<div id="frm"><ul>
<li><h1>可订票信息 欢迎您:<%=session.getAttribute("stuName") %> <a href=Index.html>退出登录</a></h1></li>
<%
try {
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from reserve");
	out.println("<table border=\"1\" width='80%'");
	out.println("<tr><th>项目编号</th><th>项目名称</th><th>时间</th><th>剩余容量</th><th>订票</th>");
	String tiMe="";
	String daTe="";
	System.out.println("学号:"+session.getAttribute("stuNum"));
	while(rs.next()){
		String couNum = rs.getString(1);
		out.println("<tr>");
		String time =rs.getString("time");
		String date=rs.getString("date") ;
		String resId=rs.getString("resId");
		out.println("<td>" + resId + "</td>");
		out.println("<td>" + rs.getString("event") + "</td>");
		
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
		out.println("<td> <a href=\"book.jsp?resId="+resId+"&stuNum="+(String)session.getAttribute("stuNum")+"\">订票</a> </td>");
		
		out.println("</tr>");
	}
	out.println("</table>"); 
}catch(Exception e){
	e.printStackTrace();
}

%>

</ul>
<ul>
<li><h2>单独检索</h2></li>
<form action="" method="post">
<li>体育项目：<select name='event' style='width:80px' onchange='change(this)'>
<option value='乒乓球' selected>乒乓球</option>
<option value='羽毛球'>羽毛球</option>
<option value='篮球'>篮球</option>
<option value='网球场'>网球场</option>
<option value='游泳池'>游泳池</option>
<option value='健身房'>健身房</option></select>
</li>
<li>时间：<select name='date' style='width:80px' onchange='change(this)'>
<option value='d1' selected>周一</option>
<option value='d2' selected>周二</option>
<option value='d3' selected>周三</option>
<option value='d4' selected>周四</option>
<option value='d5' selected>周五</option>
<option value='d6' selected>周六</option>
<option value='d7' selected>周日</option>
</select>
<li><input type=submit value="查询">
<a href="list_booking_stu.jsp">查看已订信息</a> </li>
<%
request.setCharacterEncoding("utf-8");
String evEnt= request.getParameter("event");
String daTe= request.getParameter("date");
System.out.println(evEnt);
System.out.println(daTe);
String date="",event="",time="",num="",resId="";
String sql="select*from reserve where event='"+evEnt+"' and date='"+daTe+"'";
System.out.println("sql:"+sql);
CachedRowSet rs=tools.DBUtil.getRowSet(sql);
out.println("<table border=\"1\" width='80%'");
out.println("<tr><th>项目名称</th><th>时间</th><th>剩余容量</th><th>订票</th>");
while(rs.next()){
	event =rs.getString("event");
	date=rs.getString("date");
	time=rs.getString("time");
	num=rs.getString("num");
	resId=rs.getString("resId");
	out.println("<tr>");
	out.println("<td>" + rs.getString("event") + "</td>");
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
		time="19:00~20:00";
	if(time.equals("t2"))
		time="20:00~21:00";
	if(time.equals("t3"))
		time="21:00~22:00";
	out.println("<td>" + daTe + time + "</td>");
	out.println("<td>" + rs.getString("num") + "</td>");
	out.println("<td><a href=\"book.jsp?resId="+resId+"&stuNum="+(String)session.getAttribute("stuNum")+"\">订票</a> </td>");
	
	out.println("</tr>");
}
out.println("</table>"); 



%>
</form>
</ul>
</div>
</center>
</body>
</html>