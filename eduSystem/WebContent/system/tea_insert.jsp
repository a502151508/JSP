<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增教师</title>
</head>
<body>
<h1>新增教师</h1>
<hr/>
<form action="../InsertTea" method="post">
<table>
<tr><td>教师工号：</td><td> <input type="text" name="teanum" value=""></td></tr>
<tr><td>姓名：</td><td><input type="text" name="teaname" value=""></td>
<tr><td>性别：</td>
<td><input type="radio" name="sex" value="男" /> 男
<input type="radio" name="sex" value="女" /> 女</td></tr>
<tr><td>密码：</td><td><input type="text" name="teapwd" value="123456"></td></tr>
<tr><td>所授课程：</td><td><input type="text" name="course" value=""></td></tr>
<tr><td>电话：</td><td><input type="text" name="teatelnum" value=""></td></tr>
<tr><td>Email:</td><td><input type="text" name="email" value=""></td></tr>
<tr align=center><td><input type="submit" value="提交"></td></tr>
</table>
</form>

</body>
</html>
