<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="human" class="day3.com.dao.Human"/>
	<jsp:setProperty name="human" property="name" value="��ö��"/>
	<div>���̵�: <jsp:getProperty name="human" property="id" /></div>
	<div>�̸�: <%= human.getName() %></div>
	<div>����: <%= human.getAge() %></div>
	<div>�ڹ�����: <%= human.getJava() %></div>
	<div>����Ŭ ����: <%= human.getOracle() %></div>
</body>
</html>