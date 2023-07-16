<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
    // 세션 무효화 (세션 종료)
    session.invalidate();
%>
<script>
	alert("로그아웃되었습니다.");
	location.href="main.jsp"; // 이전 페이지로 돌아가기
</script>
</body>
</html>