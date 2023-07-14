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
<form name="updateForm" action="user_update_sql.jsp">
		<%
			request.setCharacterEncoding("UTF-8");
			String uId = request.getParameter("uId");
			String pwd = request.getParameter("pwd");
			String uName = request.getParameter("uName");
			String phone = request.getParameter("phone");
			String age = request.getParameter("age");
			String addr = request.getParameter("addr");
			
			
			Statement stmt = null; // 쿼리 호출을 위한 객체
			ResultSet rs = null; // 결과를 담기 위한 객체
			
			try {
				String sql = "";
				if(pwd.equals("") || pwd == null){
					sql = "UPDATE TBL_USER SET U_NAME = '"+uName+"', PHONE = '"+phone+"', AGE = '"+age+"', ADDR = '"+addr+"' WHERE U_ID = '"+uId+"'";
				} else {
					sql = "UPDATE TBL_USER SET U_NAME = '"+uName+"', PHONE = '"+phone+"', AGE = '"+age+"', ADDR = '"+addr+"', PWD = '"+pwd+"' WHERE U_ID = '"+uId+"'";
				}
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				
			} catch (SQLException e) {
				out.println(e.getMessage());
			}
		%>
</form>
</body>
</html>
<script>
	alert("수정되었습니다.");
	window.close();
	window.opener.getReturn();
</script>