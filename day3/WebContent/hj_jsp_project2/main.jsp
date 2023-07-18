<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style>
	body {
		margin: 0;
		padding: 0;
	}

	header {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		background-color: #003580;
		box-sizing: border-box;
		line-height: 70px;
	}

	.title {
		text-align: center;
		margin-top: 0px;
	}

	.title h1 {
		position: relative;
		margin: 0;
	}

	h1 a {
		text-decoration: none;
		color: #F6F6F6;
	}

	ul {
		margin: 0;
		padding: 0;
		text-align: center;
	}

	ul li {
		display: inline-block;
	}

	li a {
		text-decoration: none;
		color: white;
		font-size: 15px;
		padding: 10px;
	}

	.item-bg {
		width: 100%;
		height: 937px;
		background-image: url(to-travel-1677347_1920.jpg);
		background-position: center;
	}

	.item-overlay {
		position: fixed;
		top: 140px;
		left: 0;
		width: 100%;
		height: 107%;
		background-color: rgba(0, 0, 0, 0.5);
	}
</style>
</head>
<body>
	<%
	    String uId = (String) session.getAttribute("userId");
	    String loginText = (uId == null || uId.isEmpty()) ? "로그인" : "로그아웃";
	    String loginLink = (uId == null || uId.isEmpty()) ? "user_login.jsp" : "logout.jsp";
	    String checkLogin = (uId == null || uId.isEmpty()) ? "user_login.jsp" : "user_reserv.jsp";
	    String checkReserv = (uId == null || uId.isEmpty()) ? "user_login.jsp" : "user_reserv_check.jsp";
	    String mypage = (uId == null || uId.isEmpty()) ? "user_login.jsp" : "user_myPage_table.jsp";
	%>
	<header>
		<div class="title">
			<h1>
				<a href="main.jsp" title="Hosting">HOSTEL</a>
			</h1>
		</div>
		<ul>
			<li><a href="<%= checkLogin %>" onclick="return checkLogin()">숙소 예약</a></li>
			<li><a href="<%= checkReserv %>" onclick="return checkLogin()">예약내역 확인</a></li>
			<li><a href="<%= mypage %>" onclick="return checkLogin()">마이페이지</a></li>
			<li><a href="<%= loginLink %>"><%= loginText %></a></li>
		</ul>
	</header>
	<div class="item">
		<div class="item-bg">
			<div class="item-overlay"></div>
		</div>
	</div>
</body>
</html>
<script>
	function checkLogin() {
		var uId = "<%= uId %>";
		if (uId == null || uId == "") {
			alert("로그인 먼저 해주세요.");
			return false;
		}
	}

	function checkReserv() {
		var uId = "<%= uId %>";
		if (uId == null || uId == "") {
			alert("로그인 먼저 해주세요.");
			return false;
		}
	}
</script>