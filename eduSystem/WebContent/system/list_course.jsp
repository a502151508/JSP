<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看课程列表</title>
</head>
<body>
<center><h1>课程列表</h1>
<%
try {
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from course");
	out.println("<table border=\"1\" width='80%'");
	out.println("<tr><th>课程编号</th><th>课程名称</th><th>上课教室</th><th>上课时间</th><th>授课老师</th><th>节次安排</th><th>操作</th></tr>");
	while(rs.next()){
		String couNum = rs.getString(1);
		out.println("<tr>");
		out.println("<td>" + couNum + "</td>");
		out.println("<td>" + rs.getString("couname") + "</td>");
		out.println("<td>" + rs.getString("classroom") + "</td>");
		out.println("<td>" + rs.getString("teaname") + "</td>");
		out.println("<td>" + rs.getString("day") + "</td>");
		out.println("<td>" + rs.getString("section") + "</td>");
		out.println("<td><a href=\"stu_course.jsp?id="+couNum+"\">查看学生</a>&nbsp&nbsp<a href=\"cou_modify.jsp?id="+couNum+"\">修改</a>  &nbsp &nbsp <a href=\"cou_delete.jsp?id="+couNum+"\">删除</a></td>");
		out.println("</tr>");
	}
	out.println("</table>"); 
}catch(Exception e){
	e.printStackTrace();
}

%>
</center>
</body>
<a href="cou_insert.jsp">新增课程</a>
</html>