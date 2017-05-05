<%@page import="tools.DBUtil"%>
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
String teanum = request.getParameter("id");
String teaName="",sEx="",eMail="",couRse="",teatelNum="";
if(teanum!=null && teanum.length()>0){
	try {
		String sql = "select * from tea_information where teanum=" + teanum;
		CachedRowSet rs=tools.DBUtil.getRowSet(sql);
		if(rs.next()){
			teaName=rs.getString("teaname");
			sEx=rs.getString("sex");
			couRse=rs.getString("course");
			eMail=rs.getString("email");
			teatelNum=rs.getString("teatelnum");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}else{
	teanum="";
}
%>
<body>
<h1>修改数据项</h1>
<hr>
<form action="../ModifyTea" method="post">
<table>
<tr><td>教师工号：</td><td> <input type="text" name="teanum" value="teaNum"></td></tr>
<tr><td>姓名：</td><td><input type="text" name="teaname" value="teaName"></td>
<tr><td>性别：</td>
<td><input type="radio" name="sex" value="男" /> 男
<input type="radio" name="sex" value="女" /> 女</td></tr>
<tr><td>密码：</td><td><input type="text" name="teapwd" value=""></td></tr>
<tr><td>所授课程：</td><td><input type="text" name="course" value="couRse"></td></tr>
<tr><td>电话：</td><td><input type="text" name="teatelnum" value="teatelNum"></td></tr>
<tr><td>Email:</td><td><input type="text" name="email" value="eMail"></td></tr>
</table>
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