<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线选课</title>
</head>
<body>
<center><h1>可选课程</h1>
<%
try {
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from course");
	out.println("<table border=\"1\" width='800'>");
	out.println("<tr><th>课程编号</th><th>课程名称</th><th>上课教室</th><th>授课老师</th><th>上课时间</th><th>节次安排</th><th>操作</th></tr>");
	System.out.println(session.getAttribute("stuNum"));
	while(rs.next()){
		String couNum = rs.getString(1);
		out.println("<tr>");
		out.println("<td>" + couNum + "</td>");
		out.println("<td>" + rs.getString("couname") + "</td>");
		out.println("<td>" + rs.getString("classroom") + "</td>");
		out.println("<td>" + rs.getString("teaname") + "</td>");
		out.println("<td>" + rs.getString("day") + "</td>");
		out.println("<td>" + rs.getString("section") + "</td>");
		out.println("<td><a href=\"stu_course.jsp?couNum="+couNum+"&stuNum="+(String)session.getAttribute("stuNum")+"\">选择</a>");
		out.println("</tr>");
	}
	out.println("</table>");
}catch(Exception e){
	e.printStackTrace();
}

%>
<hr>
<h2>已选课程</h2>
<%
String stunum= (String)session.getAttribute("stuNum");
try
{
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from enroll where stunum="+stunum);
	out.println("<table border=\"1\" width='800'>");
	out.println("<tr><th>课程编号</th><th>课程名称</th><th>上课教室</th><th>授课老师</th><th>上课时间</th><th>节次安排</th></tr>");
	while(rs.next())
	{
		String counum=rs.getString("counum");
		CachedRowSet crs=tools.DBUtil.getRowSet("select*from course where counum="+counum);
		if(crs.next())
		{
		out.println("<tr>");
		out.println("<td>" + counum + "</td>");
		out.println("<td>" + crs.getString("couname") + "</td>");
		out.println("<td>" + crs.getString("classroom") + "</td>");
		out.println("<td>" + crs.getString("teaname") + "</td>");
		out.println("<td>" + crs.getString("day") + "</td>");
		out.println("<td>" + crs.getString("section") + "</td>");
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