<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp" %>
	
	<%
		request.setCharacterEncoding("EUC-KR");
		String kind = request.getParameter("btnKind");
		
		ResultSet rs = null;
		Statement stmt = null;
		
		
	%>
	
	
	
	
</body>
</html>