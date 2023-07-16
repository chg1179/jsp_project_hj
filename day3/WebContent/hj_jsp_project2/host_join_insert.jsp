<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="user_login.jsp">
	<%@ include file="../jdbc_set2.jsp"%>	
	
	<%	
		request.setCharacterEncoding("UTF-8");
		String hId = request.getParameter("hId");
		String pwd1 = request.getParameter("pwd1");
		String hName = request.getParameter("hName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement();
			String insert = "INSERT INTO HJ_TBL_HOST(H_ID, PWD, H_NAME, PHONE, EMAIL) VALUES('" + hId + "','" + pwd1 + "', '" + hName + "','" + email + "','" + phone + "')";
			System.out.println(insert);
			stmt.executeUpdate(insert);
			out.println(hName + "님 가입을 축하합니다!!");
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
	
	%>
	<input type="submit" value="로그인 화면으로">
</form>
</body>
</html>
