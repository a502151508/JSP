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
String stunum = request.getParameter("id");
System.out.println(stunum);
String stuName="",sEx="",eMail="",clAss="",telNum="",stuPwd="";
if(stunum!=null && stunum.length()>0){
	try {
		String sql = "select * from stu_information where stunum=" + stunum;
		CachedRowSet rs=tools.DBUtil.getRowSet(sql);
		if(rs.next()){
			stuName=rs.getString("stuname");
			sEx=rs.getString("sex");
			clAss=rs.getString("class");
			telNum=rs.getString("telNum");
			eMail=rs.getString("email");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}else{
	stunum="";
}
%>
<body>
<h1>确定删除这条数据吗？</h1>
<form action="../DeleteStu" method="post">
学号：<input type="text" name="stunum" value="<%=stunum%>"><br>
姓名：<input type="text" name="stuname" value="<%=stuName%>"><br>
性别：<input type="text" name="sex" value="<%=sEx%>"><br>
密码：<input type="text" name="stupwd" value="<%=stuPwd%>"><br>
班级：<input type="text" name="class" value="<%=clAss%>"><br>
电话：<input type="text" name="telnum" value="<%=telNum%>"><br>
Email:&nbsp<input type="text" name="email" value="<%=eMail%>"><br>
<input type="submit" value="删除">
</form>
</body>
</html>