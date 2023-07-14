<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	 <form name="login" action="success.jsp">
        <div>아이디: <input type="text" name="id"></div>
        <div>비밀번호: <input type="password" name="pwd"></div>
        <input type="button" value="전송" onclick="check();" />
    </form>
</body>
</html>
<script>
	// check 함수 생성
	// 아이디에 영어 대소문자만 입력 가능하도록
	// 숫자, 특수문자, 한글 등이 입력되고 전송 누르면 '영어 대소문자만 가능' 알림
	// 패스워드는 숫자만 가능 하도록 아닐 경우 '패스워드는 숫자만 가능' 알림
	
	function check(){
		var login = document.login;
		
		var regex = /^[a-z|A-Z]+$/;
		if(!regex.test(login.id.value)){
			alert("아이디는 영어 대소문자만 가능");
			login.id.focus();
			return
		}
		
		regex = /^[0-9]+$/;
		if(!regex.test(login.pwd.value)){
			alert("패스워드는 숫자만 가능");
			login.id.focus();
			return
		}
		
		login.submit();
	}
</script>