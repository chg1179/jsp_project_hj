<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form name="login" action="jdbc_insert1.jsp" method="post">
		<div>학번 : <input type="text" name="stuNo"></div>
		<div>이름 : <input type="text" name="stuName"></div>
		<div>학과 : <input type="text" name="stuDept"></div>
		<div>학년 : <input type="text" name="stuGrade"></div>
		<div><input type="button" value="학생추가" onclick="check()"></div>
	</form>
</body>
</html>

<script>
	function check(){
		var login = document.login;
		if(login.stuNo.value.length != 8){
			alert("학번은 8글자");
			login.stuNo.focus();
			return
		}
		login.submit();
	}
</script>