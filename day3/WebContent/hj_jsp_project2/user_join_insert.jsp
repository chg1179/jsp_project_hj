<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css">
<style>
#container .text-name {
	text-align: center;
}
</style>
</head>
<body>
	<form action="main.jsp">
		<div id="container">
			<%@ include file="../jdbc_set2.jsp"%>

			<%
				request.setCharacterEncoding("UTF-8");
				String uId = request.getParameter("uId");
				String pwd1 = request.getParameter("pwd1");
				String uName = request.getParameter("uName");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
	
				Statement stmt = null;
				ResultSet rs = null;

				try {
					stmt = conn.createStatement();
					String insert = "INSERT INTO HJ_TBL_USER(U_ID, PWD, U_NAME, EMAIL, PHONE) VALUES('" + uId + "','" + pwd1 + "', '"
					+ uName + "', '" + email + "','" + phone + "')";
					System.out.println(insert);
					stmt.executeUpdate(insert);
			%>
				<div class="text-name">
					💙<%=uName%>님 가입을 축하합니다💙
				</div>
				<%
				} catch (SQLException e) {
				out.println(e.getMessage());
				}
			%>
			<input type="submit" value="메인 화면으로">
		</div>
	</form>
</body>
</html>
