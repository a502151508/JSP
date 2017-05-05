<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增学生</title>
</head>
<body>
<h1>新增学生</h1>
<hr>
<form action="../InsertStu" method="post">
学号：<input type="text" name="stunum" value=""><br>
姓名：<input type="text" name="stuname" value=""><br>
性别：
<input type="radio" name="sex" value="男" /> 男
<input type="radio" name="sex" value="女" /> 女<br>
密码：<input type="text" name="stupwd" value="123456"><br>
班级：<input type="text" name="class" value=""><br>
电话：<input type="text" name="telnum" value=""><br>
Email:&nbsp<input type="text" name="email" value=""><br>
<input type="submit" value="提交">
</form>

</body>
</html>