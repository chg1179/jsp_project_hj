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
	
	<%	
			
		request.setCharacterEncoding("EUC-KR");
		String uId = request.getParameter("uId");
		String pwd1 = request.getParameter("pwd1");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement();
			String insert = "INSERT INTO HJ_TBL_USER VALUES('" + uId + "','" + pwd1 + "', '" + name + "', '" + phone + "', '" + addr + "')";
			System.out.println(insert);
			stmt.executeUpdate(insert);
			out.println(name + "님 가입을 축하합니다!!");
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
	
	%>
</body>
</html>