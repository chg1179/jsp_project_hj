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
	}
</style>
</head>
<body>
	<%
	    // 특정 세션 속성 확인
	  /*  if (uId == null || uId.isEmpty()) {
	        out.println("세션이 종료되었습니다.");
	    } else {
	        out.println("세션 유지 중입니다. 사용자 ID: " + uId);
	    }  */
	%>
	<div>
		<header>
			<div class="title">
				<h1>
					<a href="host_menu.jsp">HOSTEL</a>
				</h1>
			</div>
			<ul>
				<li><a href="host_accm.jsp">숙소 등록</a></li>
				<li><a href="host_reserv_check.jsp">고객 예약 정보</a></li>
				<li><a href="host_myPage.jsp">내정보</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul>
		</header>
	</div>
</body>
</html>