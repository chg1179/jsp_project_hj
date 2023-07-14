<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="user_login_check.jsp" name=loginForm>
		<h3>로그인</h3>
		<div><input type="text" name="uId" placeholder="아이디"></div>
		<div><input type="password" name="pwd" placeholder="비밀번호"></div>
		<div>
			<label><input type="radio" name="stat" value="U" checked>일반회원</label>
			<label><input type="radio" name="stat" value="A">관리자</label> 
		</div>
		<div><input type="button" value="로그인" onclick="userLogin()"><input type="button" value="회원가입" onclick="userJoin()"></div>
		<a href="host_login.jsp">호스트 권한으로 로그인하기</a>
	</form>
</body>
</html>
<script>
	// 사용자 로그인
	function userLogin(){
		var form = document.loginForm;
		if(form.uId.value == "" || form.uId.value == undefined){
			alert("아이디를 입력해주세요.");
			form.uId.focus();
			return;
		}
		if(form.pwd.value == "" || form.pwd.value == undefined){
			alert("비밀번호를 입력해주세요.");
			form.pwd.focus();
			return;
		}
		form.submit();
	}
	// 사용자 회원가입
	function userJoin(){
		location.href="user_join.jsp"
	}
	
	// 호스트 로그인
	function hostLogin(){
		location.href="host_login.jsp"
	}
	

</script>