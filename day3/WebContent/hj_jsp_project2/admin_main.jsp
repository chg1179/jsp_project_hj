<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
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
					<a href="admin_main.jsp">HOSTEL</a>
				</h1>
			</div>
			<ul>
				<li><a href="admin_user_table.jsp">고객 정보</a></li>
				<li><a href="admin_reserv_table.jsp">고객 예약 정보</a></li>
				<li><a href="admin_host_table.jsp">호스트 정보</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul>
		</header>
	</div>
</body>
</html>