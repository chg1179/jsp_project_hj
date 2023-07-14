<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String uid = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		String status = (String) session.getAttribute("status");
		out.println(uName + "님 환영합니다.");
		
		/* int mi = session.getMaxInactiveInterval() / 60;
		out.println(mi + "분");
		
		session.setMaxInactiveInterval(60 * 60);
		mi = session.getMaxInactiveInterval() / 60;
		out.println(mi + "분"); */
		
		if(status.equals("A")){
			%>
			<input type="button" value="관리자 화면으로 이동" onclick="admin()">
			<%
		}
	%>
	<input type="button" value="로그아웃" onclick="logout()">
	
	
</body>
</html>
<script>
	function logout(){
		location.href="login.jsp";
	}
	function admin(){
		location.href="login_user.jsp;"
	}
</script>
