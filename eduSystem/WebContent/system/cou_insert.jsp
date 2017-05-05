<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增课程</title>
</head>
<body>
<h1>新增课程</h1>
<hr>
<form action="../InsertCou" method="post">

课程编号：<input type="text" name="counum" value=""><br>
课程名称：<input type="text" name="couname" value=""><br>
上课教室：<input type="text" name="classroom" value=""><br>
授课老师：<input type ="text" name="teaname" value=""><br>
上课时间：<input type="text" name="day" value=""><br>
节次安排：<input type="text" name="section" value=""><br>
<input type="submit" value="提交">
</form>

</body>
</html>