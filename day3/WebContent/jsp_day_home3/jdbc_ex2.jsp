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
		ResultSet rs = null;
		Statement stmt = null;
		try {
			String sql = "select * from student";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				out.println("�̸� : " + rs.getString("STU_NAME")
				+ ", �й� : " + rs.getString("STU_NO") + "<br>");
	%>
	<%
			}
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	
	
	
	
</body>
</html>