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
		<div>아이디 : <input type="text" name="uId"><input type="button" value="중복체크" onclick="idCheck()"></div>
		<div>비밀번호 : <input type="password" name="pwd1"></div>
		<div>비밀번호 확인 : <input type="password" name="pwd2"></div>
		<div>이름 : <input type="text" name="uName"></div>
		<div>핸드폰 번호 : <input type="text" name="phone"></div>
		<div>나이 : <input type="text" name="age"></div>
		<div>주소 : <input type="text" name="addr"></div>
		<div><input type="button" onclick="userJoin()" value="회원가입" ></div>
	</form>
</body>
</html>
<script>
	var btnCheck = false; // 중복체크 버튼을 눌렀는지 확인하는 flg/ 버튼 누르는 순간 true로 바꿔줄거임!!
	var idFlg = false; // 아이디 중복 여부 확인하는 flg(중복 아이디 있으면 false)
	function userJoin(){ // 회원가입 버튼
		if(btnCheck == false){ // btnCheck가 false일때 중복체크 해야댐 if(!btnCheck)
			alert("아이디 중복체크를 해주세요.");
			return;
		}
		if(!idFlg){
			alert("중복된 아이디입니다.");
			return;
		}
	}
	
	function idCheck(){ // 중복체크 버튼
		btnCheck = true;
		var form = document.userForm;
		if(form.uId.value == "" || form.uId.value.length < 0){
			alert("아이디를 먼저 입력해주세요.");
			form.uId.focus();
			return;
		} else {
			window.open("idCheck.jsp?uId=" + form.uId.value, "check", "width=500, height=500");
			// window.open("주소" + value, "id(팝업 이름 정하기 이게 있으면 창이 한개만 뜬다.)" , "크기");
			
		}
		
	}  
	function getReturn(val){
		if(val =='N'){
			idFlg = false; // 중복된 아이디가 있음 Y 사용 불가능
		} else {
			idFlg = true; //  중복된 아이디가 없음 N 사용 가능
		}
			
	}
	
</script>