<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		out.println(uName + "님 환영합니다.");
	%>
</body>
</html>