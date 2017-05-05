<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增管理员</title>
</head>
<body>
<h1>新增管理员</h1>
<hr>
<form action="../InsertAdm" method="post">
管理员编号：<input type="text" name="admnum" value=""><br>
管理员名称：<input type="text" name="admname" value=""><br>
管理员密码：<input type ="text" name="admpwd"><br>
<input type="submit" value="提交">
</form>

</body>
</html>