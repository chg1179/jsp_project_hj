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
	<jsp:setProperty name="human" property="name" value="김철수"/>
	<div>아이디: <jsp:getProperty name="human" property="id" /></div>
	<div>이름: <%= human.getName() %></div>
	<div>나이: <%= human.getAge() %></div>
	<div>자바점수: <%= human.getJava() %></div>
	<div>오라클 점수: <%= human.getOracle() %></div>
</body>
</html>