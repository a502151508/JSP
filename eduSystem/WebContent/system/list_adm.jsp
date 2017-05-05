<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看管理员列表</title>
</head>
<body>
<center><h1>管理员列表</h1>
<%
try {
	CachedRowSet rs=tools.DBUtil.getRowSet("select*from adm_information");
	out.println("<table border=\"1\" width='800'>");
	out.println("<tr><th>管理员编号</th><th>管理员名称</th><th>操作</th></tr>");
	while(rs.next()){
		String admNum = rs.getString(1);
		out.println("<tr>");
		out.println("<td>" + admNum + "</td>");
		out.println("<td>" + rs.getString("admname") + "</td>");
		out.println("<td><a href=\"adm_modify.jsp?id="+admNum+"\">修改</a>  &nbsp &nbsp <a href=\"adm_delete.jsp?id="+admNum+"\">删除</a></td>");
		out.println("</tr>");
	}
	out.println("</table>");
}catch(Exception e){
	e.printStackTrace();
}

%>
</center>
</body>
<a href="adm_insert.jsp">新增管理员</a>
</html>