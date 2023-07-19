<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style>
table {
	border-collapse: collapse;
	text-align: center;
}
th, td {
	border: 1px solid black;
	padding: 5px 10px;
}
</style>
</head>
<body>
<%@ include file="host_menu.jsp" %>
<%@ include file="../jdbc_set2.jsp"%>
	<form>
	<div id="container">
		<h3>내정보 수정</h3>
		<table>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>핸드폰번호</th>
			</tr>
			</table>
	</div>
	</form>
	
	<form>
	<div id="container">
		<h3>숙소 정보 수정</h3>	
		<table>
			<tr>
				<th>숙소 이름</th>
				<th>숙소 위치</th>
				<th>수용 인원</th>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>