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
		background-color: #003580;
		box-sizing: border-box;
		line-height: 65px;
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
		margin-left: 20px;
	}
	
	ul {
		margin: 0;
		text-align: right;
	}
	
	ul li {
		display: inline-block;
	}
	
	li a {
		text-decoration: none;
		color: white;
		font-size: 15px;
		font-weight: bolder;
		padding: 10px;
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
	    // 특정 세션 속성 확인
	  /*  if (uId == null || uId.isEmpty()) {
	        out.println("세션이 종료되었습니다.");
	    } else {
	        out.println("세션 유지 중입니다. 사용자 ID: " + uId);
	    }  */
	%>
	<header>
		<div class="title">
			<h1>
				<a href="main.jsp" title="Hosting">HOSTEL</a>
			</h1>
		</div>
		<ul>
			<li><a href="<%= checkLogin %>" onclick="return checkLogin()">숙소 예약</a></li>
			<li><a href="<%= checkReserv %>" onclick="return checkReserv()">예약내역 확인</a></li>
			<li><a href="<%= loginLink %>"><%= loginText %></a></li>
		</ul>
	</header>

</body>
</html>
<script>
	function checkLogin() {
	    var uId = "<%= uId %>";
	    if (uId == null || uId == "") {
	        alert("로그인 먼저 해주세요.");
	        return false; // 링크 이벤트를 취소합니다.
	    }
	}
	function checkReserv(){
		var uId = "<%= uId %>";
	    if (uId == null || uId == "") {
	        alert("로그인 먼저 해주세요.");
	        return false; // 링크 이벤트를 취소합니다.
	    }
	}
</script>

