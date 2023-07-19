<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
 	/* 세션 남아있는지 확인 */
 	session.removeAttribute("userId"); 
	/* 아이디 세션 종료하기 */
 	session.removeAttribute("userName");  
	/* 이름 세션 종료하기 */
 	/* session.invalidate(); */
 	
 	if (session != null && session.getAttribute("userId") != null) {
    // 세션이 유효하면 실행할 코드
    String userId = (String) session.getAttribute("userId");
    out.println("세션 유효, 사용자 아이디: " + userId);
} else {
    // 세션이 유효하지 않으면 실행할 코드
    out.println("세션이 유효하지 않습니다.");
}
 
%>
<form action="login_check.jsp" name=userForm>
	<div><input type="text" name="uId" placeholder="아이디"></div>
	<div><input type="password" name=pwd placeholder="패스워드"></div>
	<div>
		<label><input type="radio" name="stat" value="U" checked>일반회원</label>
		<label><input type="radio" name="stat" value="A">관리자</label> 
	</div>
	<div><input type="button" value="로그인" onclick="go()"></div>
</form>
</body>
</html>
<script>
	function go(){
		var form = document.userForm;
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

</script>