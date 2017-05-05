<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看学生列表</title>
</head>
<body>
<center><h1>学生列表</h1>
<%
try {
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from stu_information");
	out.println("<table border=\"1\" width='1100'>");
	out.println("<tr><th>学号</th><th>姓名</th><th>性别</th><th>班级</th><th>联系电话</th><th>电子邮箱</th><th>操作</th></tr>");
	while(rs.next()){
		String stuNum = rs.getString(1);
		out.println("<tr>");
		out.println("<td>" + stuNum + "</td>");
		out.println("<td>" + rs.getString("stuname") + "</td>");
		out.println("<td>" + rs.getString("sex") + "</td>");
		out.println("<td>" + rs.getString("class") + "</td>");
		out.println("<td>" + rs.getString("telnum") + "</td>");
		out.println("<td>" + rs.getString("email") + "</td>");
		out.println("<td><a href=\"stu_modify.jsp?id="+stuNum+"\">修改</a>  &nbsp &nbsp <a href=\"stu_delete.jsp?id="+stuNum+"\">删除</a></td>");
		out.println("</tr>");
	}
	out.println("</table>");
}catch(Exception e){
	e.printStackTrace();
}

%>
</center>
</body>
<a href="stu_insert.jsp">新增学生</a>
<hr>
<h2>单独检索</h2>
<form action="" method="post">
请输入学号<input type="text" name="stunum">
<input type=submit value="查询">
<%
String stunum= request.getParameter("stunum");
String stuName="",sEx="",eMail="",clAss="",telNum="";
CachedRowSet rs=tools.DBUtil.getRowSet("select*from stu_information where stunum="+stunum);
if(rs.next())
{
stuName=rs.getString("stuname");
sEx=rs.getString("sex");
clAss=rs.getString("class");
telNum=rs.getString("telNum");
eMail=rs.getString("email");
}%>

<table border=1 width=500>
	<tr>
		<td>学号</td><td><%=stunum %>  </td>
	</tr>
	<tr>
		<td>姓名</td><td><%=stuName%>  </td>
	</tr>
	<tr>
		<td>性别</td><td><%=sEx %></td>
	</tr>
	<tr>
		<td>班级</td><td><%=clAss %></td>
	</tr>
	<tr>
		<td>联系电话</td><td><%=telNum%></td>
	</tr>
	<tr>
		<td>邮箱</td><td><%=eMail %></td>
	</tr>
</table>
</form>
</html>