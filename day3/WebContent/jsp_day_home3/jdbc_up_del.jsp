<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form name="login" action="jdbc_update.jsp" method="post">
		<div>�й� : <input type="text" name="stuNo"></div>
		<div>�а� : <input type="text" name="stuDept"></div>
		<div>�г� : <input type="text" name="stuGrade"></div>
		<div><input type="button" value="�л��߰�" onclick="check()"></div>
	</form>
</body>
</html>

<script>
	function check(){
		var login = document.login;
		if(login.stuNo.value.length != 8){
			alert("�й��� 8����");
			login.stuNo.focus();
			return
		}
		login.submit();
	}
</script>