<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 회원가입</title>
<style>
	

</style>
</head>
<body>
	<form action="host_join_insert.jsp"  name="hostForm"  method="post">
	<div id="container">
		<h3>호스트 회원가입</h3>
		<div><input type="text" name="hId" placeholder="아이디"><input type="button" value="아이디 중복 체크" onclick="idCheck()"></div>
		<div><input type="password" name="pwd1" placeholder="비밀번호"></div>
		<div><input type="password" name="pwd2" placeholder="비밀번호 확인"></div>
		<div><input type="text" name="hName" placeholder="이름"></div>
		<div><input type="text" name="email" placeholder="[선택]이메일"></div>
		<div><input type="text" name="phone" placeholder="휴대전화번호"></div>
		<div><input type="button" onclick="hostJoin()" value="회원가입" ></div>
	</div>
	</form>
</body>
</html>
<script>
	var btnCheck = false; //중복 체크 버튼 눌렀는지 확인
	var idFlg = false;
	function hostJoin(){
		var form = document.hostForm;
		// 아이디 중복 체크 
		if(!btnCheck){
			alert("아이디 중복 체크를 해주세요");
			return;
		}
		// 중복된 아이디 있을 때
		if(!idFlg){
			alert("중복된 아이디가 있습니다.");
			return;
		}
		var regex =  /^[A-Za-z0-9]+$/;
		if(!regex.test(form.hId.value)){
			alert("영어 대소문자, 숫자만 입력해주세요.");
			return;
		}
		// 아이디는 필수값
		if(form.hId.value == "" || form.hId.value == undefined){
			alert("아이디는 필수 정보 입니다.");
			form.hId.focus();
			return;
		}
		// 비밀번호 필수값
		if(form.pwd1.value == "" || form.pwd1.value == undefined) {
			alert("비밀번호는 필수 정보 입니다.");
			form.hId.focus();
			return;
		}
		if(form.pwd1.value != form.pwd2.value){
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			return;
		}
		// 휴대전화번호 필수값
		if(form.phone.value == "" || form.phone.value == undefined) {
			alert("휴대전화번호는 필수 정보 입니다.");
			form.hId.focus();
			return;
		}
		
		form.submit();
	}
	function idCheck(){
		btnCheck = true;
		var form = document.hostForm;
		if(form.hId.value == "" || form.hId.value.length < 0){
			alert("아이디를 먼저 입력해주세요");
			form.hId.focus();
			return;
		} else { 
			window.open("host_join_idCheck.jsp?hId=" + form.hId.value, "idcheck", "width=500, height=500");
		}
	}
	function getReturn(val){
		if(val=="Y"){
			idFlg=true;
		} else {
			idFlg=false;
		}
	}
</script>