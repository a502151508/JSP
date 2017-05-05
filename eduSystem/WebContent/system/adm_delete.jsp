<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<%
String admnum = request.getParameter("id");
System.out.println(admnum);
String admName="",admPwd="";
if(admnum!=null && admnum.length()>0){
	try {
		String sql = "select * from adm_information where admnum=" + admnum;
		CachedRowSet rs=tools.DBUtil.getRowSet(sql);
		if(rs.next()){
			admName=rs.getString("admname");
			}
	}catch(Exception e){
		e.printStackTrace();
	}
}else{
	admnum="";
}
%>
<body>
<h1>确定删除这条数据吗？</h1>
<form action="../DeleteAdm" method="post">
管理员编号：<input type="text" name="stunum" value="<%=admnum%>"><br>
管理员名称：<input type="text" name="stuname" value="<%=admName%>"><br>
<input type="submit" value="删除">
</form>
</body>
</html>