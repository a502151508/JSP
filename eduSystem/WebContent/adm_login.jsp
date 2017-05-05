<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用教务系统，请登录。</title>
<script>
function checkForm(){
	var userName = document.getElementById("username").value;
	var userpwd = document.getElementById("userpwd").value;
	//alert(userName + userpwd);
	if(userName.length<0){
		alert("请输入正确的用户名");
		return false;
	}
	return true;
}
</script>
</head>
<h1><b>管理员登录/Login &nbsp &nbsp &nbsp <small><small></small><small><a href="stu_login.jsp">学生登陆</a> &nbsp &nbsp<a href="tea_login.jsp">管理员登陆</a></small></small></</b></h1>
<hr />
<body>
<form action="Validate_Adm" method="post">
<table border=0  align=left>
<tr>
<th align=left>用户名：</th>
<td><input type="text" name="username"  style="width:200px; height:20px;"></td>
</tr>
<tr>
<th align=left>密码:</th>
<td><input type="password" name="userpwd" style="width:200px; height:20px;"></td>
</tr>
<tr>
<td><input type="submit" value="登录" onClick="return checkForm();">
<input type = "reset" value="重置"> </td>   
</tr>
</table>
</form>
</body>
</html>