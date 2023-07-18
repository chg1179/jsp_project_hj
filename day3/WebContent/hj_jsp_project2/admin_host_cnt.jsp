<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../jdbc_set2.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String hId = request.getParameter("hId");
		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			String update = "UPDATE HJ_TBL_HOST SET CNT = 0 WHERE H_ID = '" + hId + "'";
			stmt.executeUpdate(update);
			out.println("로그인 횟수가 초기화되었습니다.");
			
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</body>
</html>
<script>
	function back(){
		window.opener.getReturn();
		window.close();
	}
</script>