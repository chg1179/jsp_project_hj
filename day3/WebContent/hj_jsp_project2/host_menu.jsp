<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 메인</title>
<style>
	body {
		margin: 0;
		padding: 0;
	}
	
	header {
		position: relative;
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
		transition: background-color 0.3s;
		border-radius: 5px;
	}
	
    ul li a:hover {
        background-color: #005AAD; /* 마우스를 가져다 댔을 때의 색상 */
    }
    ul li a:active {
        background-color: #003580; /* 선택했을 때의 색상 */
    }
	
</style>
</head>
<body>
	<%
	    String hostId = (String) session.getAttribute("hostId");
	    String loginText = (hostId == null || hostId.isEmpty()) ? "로그인" : "로그아웃";
	    String loginLink = (hostId == null || hostId.isEmpty()) ? "host_login.jsp" : "logout.jsp";
	    String checkLogin = (hostId == null || hostId.isEmpty()) ? "host_login.jsp" : "host_accm.jsp";
	    String checkReserv = (hostId == null || hostId.isEmpty()) ? "host_login.jsp" : "host_reserv_check.jsp";
	    String mypage = (hostId == null || hostId.isEmpty()) ? "host_login.jsp" : "host_myPage.jsp";
	%>
	<header>
		<div class="title">
			<h1>
				<a href="main.jsp" title="Hosting">HOSTEL</a>
			</h1>
		</div>
		<ul>
			<li><a href="<%= checkLogin %>" onclick="return checkLogin(<%= hostId %>)">숙소 등록</a></li>
			<li><a href="<%= checkReserv %>" onclick="return checkReserv(<%= hostId %>)">예약 고객 확인</a></li>
			<li><a href="<%= mypage %>" onclick="return checkLogin(<%= hostId %>)">내정보</a></li>
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
	function checkLogin(hostId) {
		if (hostId == null || hostId === "") {
			alert("로그인 먼저 해주세요.");
			return false; // 기본 동작 중단 (링크 이동 방지)
		}
		return true; // 기본 동작 실행 (링크 이동 허용)
	}

	function checkReserv(hostId) {
		if (hostId == null || hostId === "") {
			alert("로그인 먼저 해주세요.");
			return false; // 기본 동작 중단 (링크 이동 방지)
		}
		return true; // 기본 동작 실행 (링크 이동 허용)
	}
</script>