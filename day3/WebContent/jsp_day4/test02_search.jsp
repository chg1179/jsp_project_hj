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
	<form action="test02_update.jsp"> 
		<%@ include file="../jdbc_set.jsp"%>
	
		<%
			request.setCharacterEncoding("UTF-8");
			String uId = request.getParameter("uId");
		
			ResultSet rs = null; // 결과를 담기 위한 객체
			Statement stmt = null; // 쿼리 호출을 위한 객체
		
			try {
				stmt = conn.createStatement();
				String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + uId + "'";
				rs = stmt.executeQuery(sql);
		
				if (rs.next()) {
		%>
			
			<!-- 인풋에 입력한 값을 넣기 위해서는 '학번'을 넘겨준느게 제일 중요함 ... -->
			<input name="uId" value="<%= rs.getString("U_ID") %>" hidden>
				<div>
					이름 : <input type="text" value="<%=rs.getString("STU_NAME")%>" name="stuName">
				</div>
				<div>
					학과 : <input type="text" value="<%=rs.getString("STU_DEPT")%>" name="stuDept">
				</div>
				<div>
					학년 : <input type="text" value="<%=rs.getString("STU_GRADE")%>" name="stuGrade">
				</div>
				<div>
					키 : <input type="text" value="<%=rs.getString("STU_HEIGHT")%>" name="stuHeight">
				</div>
				 
		<%
				} 
				
			} catch (SQLException e) {
				out.println(e.getMessage());
			}
		%>
		<div><input type="submit" value="변경"></div>
	</form>
</body>
</html>
