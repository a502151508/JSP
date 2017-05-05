<%@page import="tools.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改课程信息</title>
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
			dAy=rs.getString("day");
			teaName=rs.getString("teaname");
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
<h1>修改数据项</h1>
<hr>
<form action="../ModifyCou" method="post">
课程编号：<input type="text" name="counum" value="<%=counum%>"><br>
课程名称：<input type="text" name="couname" value="<%=couName%>"><br>
上课教室：<input type="text" name="classroom" value="<%=claRoom%>"><br>
授课老师：<input type ="text" name="teaname" value="<%=teaName%>"><br>
上课时间：<input type="text" name="day" value="<%=dAy%>"><br>
节次安排：<input type="text" name="section" value="<%=secTion%>"><br>
<input type="submit" value="提交">
</form>
<%--<hr>
<h1>重置密码</h1>
<form action="">
密码：<input type="text" name="stupwd" value=""><br>
<input type="submit" value="重置密码">
</form>
<%
String stuPwd =request.getParameter("stupwd");
String sql="update stu_information set stupwd='"+stuPwd+"' where stunum="+stunum;
DBUtil.dosql(sql);
response.sendRedirect("system/list_stu.jsp");
%>
 --%>
</body>
</html>