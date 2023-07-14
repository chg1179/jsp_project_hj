<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	html{
		margin: 0;
	    padding: 0px;
	    border: 0;
	    box-sizing: border-box;
	}
	
	section h1{
		
	}
	
	header{
		position: fixed;
	    top: 0px;
	    left: 0;
	    right: 0;
	    height: 72px;
	    transition: 0.4s;
	}
	
	.head{
		float: right;
	}
	
	li{
		list-style: none;
		display: inline-block;
	}
	
</style>
</head>
<body>
<div>
	<header>
		<section>
			<div>
				<a href="main.jsp" title="Hosting">Hosting</a>
			</div>
			<ul class="head">
				<li>
					<a href="user_booking.jsp">숙소 예약</a>
				</li>
				<li>
					<a href="">예약 내역 확인</a>
				</li>
				<li>
					<a href="user_login.jsp">회원 로그인</a>
				</li>
				<li>
					<a href="host_login.jsp">호스트 로그인</a>
				</li>
			</ul>
			
			<!-- <div>메인</div>
			<div>게스트 로그인, 호스트 로그인 링크 넣기</div>
			<div>사용자 메인화면 링크 (숙소 예약, 숙소 예약 정보 확인 페이지)</div>
			<div>호스트 메인화면 링크 (예약자 확인)</div> 
			헤더, 메인, 푸터 만들고 user_main, host_main에 include
			-->

	</header>
</div>
</body>
</html>