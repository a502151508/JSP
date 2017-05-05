<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看教师列表</title>
</head>
<body>
<center><h1>教师列表</h1>
<%
try {
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from tea_information");
	out.println("<table border=\"1\" width='1200'>");
	out.println("<tr><th>教师工号</th><th>姓名</th><th>性别</th><th>所授课程</th><th>联系电话</th><th>电子邮箱</th><th>操作</th></tr>");
	while(rs.next()){
		String teaNum = rs.getString(1);
		out.println("<tr>");
		out.println("<td>" + teaNum + "</td>");
		out.println("<td>" + rs.getString("teaname") + "</td>");
		out.println("<td>" + rs.getString("sex") + "</td>");
		out.println("<td>" + rs.getString("course") + "</td>");
		out.println("<td>" + rs.getString("teatelnum") + "</td>");
		out.println("<td>" + rs.getString("email") + "</td>");
		out.println("<td><a href=\"tea_modify.jsp?id="+teaNum+"\">修改</a>  &nbsp &nbsp <a href=\"tea_delete.jsp?id="+teaNum+"\">删除</a></td>");
		out.println("</tr>");
	}
	out.println("</table>");
}catch(Exception e){
	e.printStackTrace();
}

%>
</center>
</body>
<a href="tea_insert.jsp">新增教师</a>
<hr>
<h2>单独检索</h2>
<form action="" method="post">
请输入教师工号<input type="text" name="teanum">
<input type=submit value="查询">
<%
String teanum= request.getParameter("teanum");
String teaName="",sEx="",eMail="",couRse="",teatelNum="";
CachedRowSet rs=tools.DBUtil.getRowSet("select*from tea_information where teanum="+teanum);
if(rs.next())
{
teaName=rs.getString("teaname");
sEx=rs.getString("sex");
couRse=rs.getString("course");
teatelNum=rs.getString("teatelNum");
eMail=rs.getString("email");
}%>

<table border=1 width=500>
	<tr>
		<td>教师工号</td><td><%=teanum %>  </td>
	</tr>
	<tr>
		<td>姓名</td><td><%=teaName%>  </td>
	</tr>
	<tr>
		<td>性别</td><td><%=sEx %></td>
	</tr>
	<tr>
		<td>所授课程</td><td><%=couRse %></td>
	</tr>
	<tr>
		<td>联系电话</td><td><%=teatelNum%></td>
	</tr>
	<tr>
		<td>邮箱</td><td><%= eMail %></td>
	</tr>
</table>
</form>
</html>