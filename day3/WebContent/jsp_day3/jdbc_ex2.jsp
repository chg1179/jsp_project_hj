<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp" %>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		try {
			String sql = "select * from student";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				out.println("이름 : " + rs.getString("STU_NAME")
				+ ", 학번 : " + rs.getString("STU_NO") + "<br>");
	%>
	<%
			}
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	
	
	
	
</body>
</html>