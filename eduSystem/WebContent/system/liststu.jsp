<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection conn=DriverManager.getConnection("jdbc:odbc:schooldb","","");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from stu");
	out.println("<table border=\"1\" width='600'>");
	out.println("<tr><th>学号</th><th>姓名</th><th>密码</th><th>Email</th><th>操作</th></tr>");
	while(rs.next()){
		String stuNum = rs.getString(1);
		out.println("<tr>");
		out.println("<td>" + stuNum + "</td>");
		out.println("<td>" + rs.getString("stuname") + "</td>");
		out.println("<td>" + rs.getString("pwd") + "</td>");
		out.println("<td>" + rs.getString("email") + "</td>");
		out.println("<td><a href=\"modify.jsp?id="+stuNum+"\">修改</a></td>");
		out.println("</tr>");
	}
	out.println("</table>");
	rs.close();
	stmt.close();
	conn.close();
}catch(Exception e){
	e.printStackTrace();
}

%>

</body>
</html>