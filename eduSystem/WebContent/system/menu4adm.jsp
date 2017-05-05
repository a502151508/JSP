<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<BR>当前用户<%=session.getAttribute("admName") %> <a href=../adm_login.jsp target="_top">退出登录</a>
<ul>
	<li><a href="list_stu.jsp" target="main">查看/修改学生列表</a></li>
	<li><a href="list_tea.jsp" target="main">查看/修改教师列表</a></li>
	<li><a href="list_adm.jsp" target="main">查看/修改管理员列表</a></li>
	<li><a href="list_course.jsp" target="main">查看/修改课程</a></li>
</ul>
</body>
</html>