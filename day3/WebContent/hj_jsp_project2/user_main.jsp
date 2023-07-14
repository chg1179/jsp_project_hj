<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="loginForm">
	<%
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		String status = (String) session.getAttribute("status");
		out.println(uName + "님 환영합니다.");
		
		if(status.equals("A")){
			%>
			<input type="button" value="관리자 화면으로 이동" onclick="admin()">
			<%
		}
	%>
	<div>
		<input type="button" value="로그아웃" onclick="logout()">
		<input type="button" value="마이페이지" onclick="myPage()">
		<input type="button" value="호스트 모드로 전환" onclick="hostMode()">
	</div>
</form>
</body>
</html>
<script>
	function logout(){
		var form = document.loginForm;
		form.submit();
		location.href="user_login.jsp"
	}
	function myPage(){
		location.href="user_mypage.jsp";
	}
	function hostMode(){
		location.href="host_main.jsp";
	}
</script>
