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
String teanum = request.getParameter("id");
String teaName="",sEx="",eMail="",couRse="",teatelNum="",teaPwd="";
if(teanum!=null && teanum.length()>0){
	try {
		String sql = "select * from tea_information where teanum=" +teanum;
		CachedRowSet crs=tools.DBUtil.getRowSet(sql);
		if(crs.next()){
			teaName=crs.getString("teaname");
			sEx=crs.getString("sex");
			couRse=crs.getString("course");
			teatelNum=crs.getString("teatelNum");
			eMail=crs.getString("email");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}else{
	teanum="";
}
%>
<body>
<h1>确定删除这条数据吗？</h1>
<form action="../DeleteTea" method="post">
<table>
<tr><td>教师工号：</td><td> <input type="text" name="teanum" value="<%=teanum%>"></td></tr>
<tr><td>姓名：</td><td><input type="text" name="teaname" value="<%=teaName%>"></td>
<tr><td>性别：</td>
<td><input type="text" name="sex" value="<%=sEx%>"></td></tr>
<tr><td>所授课程：</td><td><input type="text" name="course" value="<%=couRse%>"></td></tr>
<tr><td>电话：</td><td><input type="text" name="teatelnum" value="<%=teatelNum%>"></td></tr>
<tr><td>Email:</td><td><input type="text" name="email" value="<%=eMail%>"></td></tr>
<tr><td><input type="submit" value="删除"></td></tr>
</table>
</form>
</body>
</html>