<%@page import="tools.getCourse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看课表</title>
</head>
<%
String stunum=(String)session.getAttribute("stuNum");
System.out.println("listcourse:"+stunum);%>
<body>
<center><h1>查看课表</h1>
<table border=1  width="1000" >
<tr><th>&nbsp&nbsp</th><th>星期一</th><th>星期二</th><th>星期三</th><th>星期四</th><th>星期五</th></tr>
<tr><th>1		  </th><td><%=getCourse.getCouname(1, 1,stunum) %></td><td><%=getCourse.getCouname(2, 1,stunum) %></td><td><%=getCourse.getCouname(3, 1,stunum) %></td><td><%=getCourse.getCouname(4, 1,stunum) %></td><td><%=getCourse.getCouname(5, 1,stunum) %></td></tr>
<tr><th>2		  </th><td><%=getCourse.getCouname(1, 2,stunum) %></td><td><%=getCourse.getCouname(2, 2,stunum) %></td><td><%=getCourse.getCouname(3, 2,stunum) %></td><td><%=getCourse.getCouname(4, 2,stunum) %></td><td><%=getCourse.getCouname(5, 2,stunum) %></td></tr>
<tr><th>3		  </th><td><%=getCourse.getCouname(1, 3,stunum) %></td><td><%=getCourse.getCouname(2, 3,stunum) %></td><td><%=getCourse.getCouname(3, 3,stunum) %></td><td><%=getCourse.getCouname(4, 3,stunum) %></td><td><%=getCourse.getCouname(5, 3,stunum) %></td></tr>
<tr><th>4		  </th><td><%=getCourse.getCouname(1, 4,stunum) %></td><td><%=getCourse.getCouname(2, 4,stunum) %></th><td><%=getCourse.getCouname(3, 4,stunum) %></td><td><%=getCourse.getCouname(4, 4,stunum) %></td><td><%=getCourse.getCouname(5, 4,stunum) %></td></tr>
<tr><th>5		  </th><td><%=getCourse.getCouname(1, 5,stunum) %></td><td><%=getCourse.getCouname(2, 5,stunum) %></th><td><%=getCourse.getCouname(3, 5,stunum) %></td><td><%=getCourse.getCouname(4, 5,stunum) %></td><td><%=getCourse.getCouname(5, 5,stunum) %></td></tr>
<tr><th>6		  </th><td><%=getCourse.getCouname(1, 6,stunum) %></td><td><%=getCourse.getCouname(2, 6,stunum) %></th><td><%=getCourse.getCouname(3, 6,stunum) %></td><td><%=getCourse.getCouname(4, 6,stunum) %></td><td><%=getCourse.getCouname(5, 6,stunum) %></td></tr>
</table>





</center>

</body>
</html>