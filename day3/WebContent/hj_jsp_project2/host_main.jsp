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
		String hId = (String) session.getAttribute("hostId");
		String hName = (String) session.getAttribute("hostName");
		String status = (String) session.getAttribute("status");
		out.println(hName + "님 환영합니다.");
		
	%>
	<input type="button" value="로그아웃" onclick="logout()">
	
</body>
</html>
<script>
	function logout(){
		location.href="host_login.jsp";
	}
	function accm(){
		location.href="host_accm.jsp";
	}

</script>
