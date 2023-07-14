<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../jdbc_set2.jsp"%>
<form name="updateForm">
		<%
			request.setCharacterEncoding("UTF-8");
			String hId = request.getParameter("hId");
			String pwd = request.getParameter("pwd");
			String hName = request.getParameter("hName");
			String phone = request.getParameter("phone");
			String birth = request.getParameter("birth");
			
			
			Statement stmt = null; // 쿼리 호출을 위한 객체
			ResultSet rs = null; // 결과를 담기 위한 객체
			
			try {
				String sql = "";
				if(pwd.equals("") || pwd == null){
					sql = "UPDATE HJ_TBL_HOST SET H_NAME = '"+hName+"', PHONE = '"+phone+"', BIRTH = '"+birth+"' WHERE H_ID = '"+hId+"'";
				} else {
					sql = "UPDATE HJ_TBL_HOST SET H_NAME = '"+hName+"', PHONE = '"+phone+"', BIRTH = '"+birth+"', PWD = '"+pwd+"' WHERE H_ID = '"+hId+"'";
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