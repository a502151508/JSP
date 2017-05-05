<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<BR>当前用户<%=session.getAttribute("teaName") %> <a href=../tea_login.jsp target="_top">退出登录</a>
<ul>
	<li><a href="tea_information.jsp" target="main">查看/修改个人信息</a></li>
	<li><a href="list_course_stu.jsp" target="main">查看学生/提交成绩</a></li>
	<li><a href="list_score.jsp" target="main">查看学生成绩</a></li>
</ul>
</body>
</html>