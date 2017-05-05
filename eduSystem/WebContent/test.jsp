<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String sql="select*from stu_information where stunum='41411004'";
CachedRowSet crs=tools.DBUtil.getRowSet(sql);
try{
if(crs.next()){
out.print(crs.getString("stuname"));
}
}
catch(Exception e)
{
	
}
%>
</body>
</html>