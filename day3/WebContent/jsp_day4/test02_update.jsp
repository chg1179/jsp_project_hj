<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp"%>
	
	<%
			request.setCharacterEncoding("UTF-8");
			String stuNo = request.getParameter("stuNo");
			String stuName = request.getParameter("stuName");
			String stuDept = request.getParameter("stuDept");
			String stuGrade = request.getParameter("stuGrade");
			String stuHeight = request.getParameter("stuHeight");
			
			ResultSet rs = null; // 결과를 담기 위한 객체
			Statement stmt = null; // 쿼리 호출을 위한 객체
		
			try {
				stmt = conn.createStatement();
				String update = "UPDATE STUDENT SET STU_DEPT = '" + stuDept + "', STU_GRADE = '" + stuGrade + "', STU_NAME = '" + stuName + "', STU_HEIGHT = '" + stuHeight + "' WHERE STU_NO = '" + stuNo + "'";
				stmt.executeUpdate(update);
				
				%>
				
				<div>학번: <%= stuNo %></div>
				<div>학과: <%= stuDept %></div>
				<div>이름: <%= stuName %></div>
				<div>학년: <%= stuGrade %></div>
				<div>키: <%= stuHeight %></div>
				
				<%
				
				
				} catch (SQLException e){
					out.println(e.getMessage());
				}
		%>
</body>
</html>