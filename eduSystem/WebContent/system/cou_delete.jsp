<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>删除课程</title>
</head>
<%
String counum = request.getParameter("id");
System.out.println(counum);
String couName="",claRoom="",dAy="",secTion="",teaName="";
if(counum!=null && counum.length()>0){
	try {
		String sql = "select * from course where counum=" + counum;
		CachedRowSet rs=tools.DBUtil.getRowSet(sql);
		if(rs.next()){
			couName=rs.getString("couname");
			claRoom=rs.getString("classroom");
			teaName=rs.getString("teaname");
			dAy=rs.getString("day");
			secTion=rs.getString("section");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}else{
	counum="";
}
%>
<body>
<h1>确定删除这次课程吗？</h1>
<form action="../DeleteCou" method="post">
课程编号：<input type="text" name="counum" value="<%=counum%>"><br>
课程名称：<input type="text" name="couname" value="<%=couName%>"><br>
上课教室：<input type="text" name="classroom" value="<%=claRoom%>"><br>
授课老师：<input type ="text" name="teaname" value="<%=teaName%>"><br>
上课时间：<input type="text" name="day" value="<%=dAy%>"><br>
节次安排：<input type="text" name="section" value="<%=secTion%>"><br>
<input type="submit" value="删除">
</form>
</body>
</html>