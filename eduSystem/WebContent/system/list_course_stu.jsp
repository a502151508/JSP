<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看学生列表</title>
</head>
<body>
<center><h1>学生列表</h1>
<%
String teaName= (String)session.getAttribute("teaName");
String stuNum="";
try
{
	String sql="select*from course where teaname='"+teaName+"'";
	CachedRowSet rs=tools.DBUtil.getRowSet(sql);
	System.out.println(sql);
	out.println("<table border=\"1\" width='800'>");
	out.println("<tr><th>学生学号</th><th>学生姓名</th><th>所属班级</th><th>联系电话</th><th>电子邮件</th><th>操作</th></tr>");
	while(rs.next())
	{
		String counum=rs.getString("counum");
		CachedRowSet crs0=tools.DBUtil.getRowSet("select*from enroll where counum="+counum);
		while(crs0.next())
		{
		stuNum=crs0.getString("stunum");	
		CachedRowSet crs=tools.DBUtil.getRowSet("select*from stu_information where stunum="+stuNum);
		if(crs.next())
		out.println("<tr>");
		out.println("<td>" + stuNum + "</td>");
		out.println("<td>" + crs.getString("stuname") + "</td>");
		out.println("<td>" + crs.getString("class") + "</td>");
		out.println("<td>" + crs.getString("telnum") + "</td>");
		out.println("<td>" + crs.getString("email") + "</td>");
		out.println("<td><a href=\"score.jsp?couNum="+counum+"&stuNum="+stuNum+"\">提交成绩</a>");
		out.println("</tr>");
		}
	}
}
catch(Exception e){
	e.printStackTrace();
}

%>
</center>
</body>
</html>