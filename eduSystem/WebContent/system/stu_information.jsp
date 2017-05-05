<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生个人信息</title>
</head>
<body>
<h1>查看个人信息</h1>
<%
try {
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from stu_information where stunum='"+(String)session.getAttribute("stuNum")+"'");
	System.out.println("select*from stu_information where stunum='"+(String)session.getAttribute("stuNum")+"'");
	out.println("<table border=\"1\" width='1000'>");
	out.println("<tr><th>学号</th><th>姓名</th><th>性别</th><th>所在班级</th><th>联系电话</th><th>电子邮箱</th><th>操作</th></tr>");
	while(rs.next()){
		String stuNum = rs.getString(1);
		out.println("<tr>");
		out.println("<td>" + stuNum + "</td>");
		out.println("<td>" + rs.getString("stuname") + "</td>");
		out.println("<td>" + rs.getString("sex") + "</td>");
		out.println("<td>" + rs.getString("class") + "</td>");
		out.println("<td>" + rs.getString("telnum") + "</td>");
		out.println("<td>" + rs.getString("email") + "</td>");
		out.println("<td><a href=\"stu_modify.jsp?id="+stuNum+"\">修改</a></td>");
		out.println("</tr>");
	}
	out.println("</table>");
}catch(Exception e){
	e.printStackTrace();
}
%>


</body>
</html>