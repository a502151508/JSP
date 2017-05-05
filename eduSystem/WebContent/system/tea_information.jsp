<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<h1>查看教师个人信息</h1>
<%
try {
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from tea_information where teanum="+(String)session.getAttribute("teaNum"));
	out.println("<table border=\"1\" width='1000'>");
	out.println("<tr><th>教师工号</th><th>姓名</th><th>性别</th><th>所授课程</th><th>联系电话</th><th>电子邮件</th></tr>");
	while(rs.next()){
		String teaNum = rs.getString(1);
		out.println("<tr>");
		out.println("<td>" + teaNum + "</td>");
		out.println("<td>" + rs.getString("teaname") + "</td>");
		out.println("<td>" + rs.getString("sex") + "</td>");
		out.println("<td>" + rs.getString("course") + "</td>");
		out.println("<td>" + rs.getString("teatelnum") + "</td>");
		out.println("<td>" + rs.getString("email") + "</td>");
		out.println("</tr>");
	}
	out.println("</table>");
}catch(Exception e){
	e.printStackTrace();
}
%>


</body>
</html>