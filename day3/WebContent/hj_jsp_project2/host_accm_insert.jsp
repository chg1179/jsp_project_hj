<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<%@ include file="../jdbc_set2.jsp"%>
	<%
		Statement stmt = null;
		ResultSet rs = null;
		String hId = request.getParameter("hId");
		String aName = request.getParameter("aName");
		String aAddr = request.getParameter("aAddr");
		String aPerson = request.getParameter("aPerson");
		
		String select = "SELECT * FROM HJ_TBL_ACCM WHERE H_ID = '"+hId+"'";
		String update = "INSERT INTO HJ_TBL_ACCM(A_NAME, A_ADDR, A_PERSON) VALUSE ('"+aName+"' , '"+aAddr+"', '"+aPerson+"')";
		try{
			stmt.executeQuery(select);
			stmt.executeUpdate(update);
			out.println("테이블 삽입이 완료되었습니다.");
			
		} catch (SQLException e){
			out.println(e.getMessage());
		}
	%>
</body>
</html>