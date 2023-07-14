<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp"%>	
	
	<%	
	request.setCharacterEncoding("EUC-KR");
	
	String pwd = request.getParameter("pwd");
	
	Statement stmt = null;
	ResultSet rs = null;
	
	%>
</body>
</html>