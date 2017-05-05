<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看学生成绩</title>
</head>
<body>
<center><h1>学生成绩列表</h1>
<%
String teaName=(String)session.getAttribute("teaName");
try {
	CachedRowSet rs0=tools.DBUtil.getRowSet("select*from course where teaname='"+teaName+"'");
	while(rs0.next())
	{
	String couNum=rs0.getString("counum");
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from enroll where counum="+ couNum);
	out.println("<table border=\"1\" width='80%'");
	out.println("<tr><th>学号</th><th>成绩</th></tr>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>" + rs.getString("stunum") + "</td>");
		out.println("<td>" + rs.getString("score") + "</td>");
			}
	out.println("</table>");

	}
}catch(Exception e){
	e.printStackTrace();
}

%>
</center>
</body>
</html>