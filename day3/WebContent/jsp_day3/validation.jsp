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
        <div>���̵�: <input type="text" name="id"></div>
        <div>��й�ȣ: <input type="password" name="pwd"></div>
        <input type="button" value="����" onclick="check();" />
    </form>
</body>
</html>
<script>
	// check �Լ� ����
	// ���̵� ���� ��ҹ��ڸ� �Է� �����ϵ���
	// ����, Ư������, �ѱ� ���� �Էµǰ� ���� ������ '���� ��ҹ��ڸ� ����' �˸�
	// �н������ ���ڸ� ���� �ϵ��� �ƴ� ��� '�н������ ���ڸ� ����' �˸�
	
	function check(){
		var login = document.login;
		
		var regex = /^[a-z|A-Z]+$/;
		if(!regex.test(login.id.value)){
			alert("���̵�� ���� ��ҹ��ڸ� ����");
			login.id.focus();
			return
		}
		
		regex = /^[0-9]+$/;
		if(!regex.test(login.pwd.value)){
			alert("�н������ ���ڸ� ����");
			login.id.focus();
			return
		}
		
		login.submit();
	}
</script>