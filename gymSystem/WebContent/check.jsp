<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>确认入场信息</title>
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
<center>
<%
request.setCharacterEncoding("utf-8");
String resId=request.getParameter("resId");
String stuNum=request.getParameter("stuNum");
String isUsed=request.getParameter("isUsed");
if(isUsed.equals("1"))
	isUsed="未入场";
if(isUsed.equals("0"))
	isUsed="已入场";
System.out.println("resid:"+resId+"  stunum:"+stuNum);
String evEnt="",date="",time="",num="";
if(resId!=null && resId.length()>0){
	try {
		String sql = "select * from reserve where resId=" + resId;
		CachedRowSet rs=tools.DBUtil.getRowSet(sql);
		if(rs.next()){
			evEnt=rs.getString("event");
			date=rs.getString("date");
			time=rs.getString("time");
			num=rs.getString("num");
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
			}
	}catch(Exception e){
		e.printStackTrace();
	}
}else{
	resId="";
}
%>
<body>
<div id="frm"><ul>
<li><h1>确认入场信息</h1></li>
<form action="Checking" method="post" >
<li>项目名称：<input type="text" name="event" value="<%=evEnt%>"></li>
<li>预定时间：<input type="text" name="datetime" value="<%=date+" "+time%>"></li>
<li>入场信息:<input type="text" name="isUsed" value="<%=isUsed%>"></li>
<input type="hidden" name="stunum" value="<%=stuNum%>">
<input type="hidden" name="resId" value="<%=resId%>">
<input type="submit" value="确认" >
</form>
</ul></div>
</center>
</body>
</html>