<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看成绩</title>
</head>
<body>
<%
String stuNum=(String)session.getAttribute("stuNum");
try
{
	String sql="select * from enroll where stunum="+stuNum;
	CachedRowSet rs=tools.DBUtil.getRowSet(sql);
	System.out.println(sql);
	out.println("<table border=\"1\" width='80%'>");
	out.println("<tr><th>课程代号</th><th>成绩</th></tr>");
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>" + rs.getString("counum") + "</td>");
		out.println("<td>" + rs.getString("score") + "</td>");
		
	}
	out.println("</table>");
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>