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
			String uId = request.getParameter("uId");
			String pwd = request.getParameter("pwd");
			String aName = request.getParameter("aName");
			String aAddr = request.getParameter("aAddr");
			String checkIn = request.getParameter("checkIn");
			String checkOut = request.getParameter("checkOut");
			
			Statement stmt = null; // 쿼리 호출을 위한 객체
			ResultSet rs = null; // 결과를 담기 위한 객체
			
			try {
				String sql = "";
				if(pwd.equals("") || pwd == null){
					sql = "UPDATE HJ_TBL_RESERV SET U_ID = '"+uId+"', A_NAME = '"+aName+"', A_ADDR = '"+aAddr+"' , CHECKIN = '"+checkIn+"' , CHECKOUT = '"+checkOut+"' WHERE U_ID = '"+uId+"'";
				} else {
					sql = "UPDATE HJ_TBL_RESERV SET U_ID = '"+uId+"', A_NAME = '"+aName+"', A_ADDR = '"+aAddr+"' , CHECKIN = '"+checkIn+"' , CHECKOUT = '"+checkOut+"' PWD = '"+pwd+"' WHERE U_ID = '"+uId+"'";
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