<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 로그인</title>
</head>
<body>
	<form action="host_login_check.jsp" name=loginForm>
		<h3>호스트 로그인</h3>
		<div><input type="text" name="hId" placeholder="아이디"></div>
		<div><input type="password" name="pwd" placeholder="비밀번호"></div>
		<div><input type="button" value="로그인" onclick="hostLogin()"></div>
	</form>
</body>
</html>
<script>
	function hostLogin(){
		var form = document.loginForm;
		if(form.hId.value == "" || form.hId.value == undefined){
			alert("아이디를 입력해주세요.");
			form.hId.focus();
			return;
		}
		if(form.pwd.value == "" || form.pwd.value == undefined){
			alert("비밀번호를 입력해주세요.");
			form.pwd.focus();
			return;
		}
		form.submit();
	}

</script>