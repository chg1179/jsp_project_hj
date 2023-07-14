<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join_insert.jsp"  name="userForm"  method="post">
		<div>아이디 : <input type="text" name="uId"><input type="button" value="아이디 중복 체크" onclick="idCheck()"></div>
		<div>비밀번호 : <input type="password" name="pwd1"></div>
		<div>비밀번호 확인 : <input type="password" name="pwd2"></div>
		<div>이름 : <input type="text" name="name"></div>
		<div>핸드폰 번호 : <input type="text" name="phone"></div>
		<div>나이 : <input type="text" name="age"></div>
		<div>주소 : <input type="text" name="addr"></div>
		<div><input type="button" onclick="userJoin()" value="회원가입" ></div>
	</form>
</body>
</html>
<script>
	var check1 = false; // 아이디 중복체크 확인 여부
	var check2 = false; // 중복 여부
	function userJoin(){
		var form = document.userForm;
		if(!check1){
			alert("아이디 중복체크를 해주세요.");
			return;
		}
		if(!check2){
			alert("중복된 아이디가 있습니다.");
			return;
		}
		var regex = /^[A-Za-z0-9]+$/;
		if(!regex.test(form.uId.value)){
			alert("아이디는 영어 대소문자만 가능");
			return;
		}
		if(form.pwd1.value != form.pwd2.value){
			alert("패스워드가 다릅니다.");
			return;
		
		}
		if(form.uId.value == "" || form.uId.value == undefined){
			alert("아이디는 필수 값 입니다.");
			form.uId.focus();
			return;
		}
		if(form.pwd1.value == "" || form.pwd1.value == undefined) {
			alert("비밀번호는 필수 값 입니다.");
			form.uId.focus();
			return;
		}
		if(form.name.value == "" || form.name.value == undefined){
			alert("이름은 필수 값 입니다.");
			form.uId.focus();
			return;
		}
		form.submit();
	}
	function idCheck(){
		check1 = true;
		var form = document.userForm;
		if(form.uId.value == "" || form.uId.value.length < 0) {
			alert("아이디를 먼저 입력해주세요");
			form.uId.focus();
			return;
		} else {
			window.open("join_idCheck.jsp?id=" + form.uId.value, "check" , "width=500, height=300");
		}
		
	}
	function getReturn(val){
		if(val == "Y"){
			check2 = true;
		} else {
			check2 = false;
		}
	}
</script>