stu_insert.jsp<%@page import="tools.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
</head>
<%
String admnum = request.getParameter("id");
String admName="";
if(admnum!=null && admnum.length()>0){
	try {
		String sql = "select * from adm_information where stunum=" + admnum;
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
<h1>修改数据项</h1>
<hr>
<form action="../ModifyAdm" method="post">
管理员编号：<input type="text" name="stunum" value="<%=admnum%>"><br>
管理员名称：<input type="text" name="stuname" value="<%=admName%>"><br>
<input type="submit" value="提交">
</form>
<%--<hr>
<h1>重置密码</h1>
<form action="">
密码：<input type="text" name="stupwd" value=""><br>
<input type="submit" value="重置密码">
</form>
<%
String stuPwd =request.getParameter("stupwd");
String sql="update stu_information set stupwd='"+stuPwd+"' where stunum="+stunum;
DBUtil.dosql(sql);
response.sendRedirect("system/list_stu.jsp");
%>
 --%>
</body>
</html>