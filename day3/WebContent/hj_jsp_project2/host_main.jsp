<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="host_menu.jsp" %>
	<%
		String hId = (String) session.getAttribute("hostId");
		String hName = (String) session.getAttribute("hostName");
		String status = (String) session.getAttribute("status");
		out.println(hName + "님 환영합니다.");
		
		if (session != null && session.getAttribute("hostId") != null) {
		    // 세션이 유효하면 실행할 코드
		    out.println("세션 유효, 사용자 아이디: " + hostId);
		} else {
		    // 세션이 유효하지 않으면 실행할 코드
		    out.println("세션이 유효하지 않습니다.");
		}
	%>
	
</body>
</html>

