<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交成绩</title>
</head>
<body>
<center>
<h1>请提交<%=request.getParameter("stuNum")%>的成绩</h1>
<% String stuNum=request.getParameter("stuNum");
String couNum=request.getParameter("couNum");
%>
<form action="../SetScore" method="post">
学号：<input type="text" name="stunum" value="<%=stuNum%>"><br>
课号：<input type="text" name="counum" value="<%=couNum%>"><br>
成绩：<input type="text" name="score"><br>
<input type="submit" value="提交">
</form>



</center>

</body>
</html>