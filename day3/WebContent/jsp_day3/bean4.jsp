<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="gugudan" class="day3.com.dao.GuGuDan"/>

	<h4>������ ����ϱ�</h4>
	<%
		for(int i=1; i<=9; i++){
			out.println(gugudan.process(5, i) + "<br>");
		}
	%>
</body>
</html>  