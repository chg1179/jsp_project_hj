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
<%@ include file="../jdbc_set2.jsp"%>
<%
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		String select = "SELECT * FROM HJ_TBL_ACCM";	
		rs = stmt.executeQuery(select);
		session.setAttribute("hId",rs.getString("H_ID"));
		
	} catch(SQLException e){
		out.println(e.getMessage());
	}
%>
<form action="host_accm_insert.jsp" name="accmInsert">
	<h3>숙소등록</h3>
		<div><input type="text" name="aName" placeholder="숙소 이름"></div>
		<div><input type="text" name="aAddr" placeholder="숙소 주소"></div>
		<div><input type="text" name="aPerson"placeholder="숙박 가능 인원"></div>
		<div><input type="submit" value="등록"></div>
</form>

</body>
</html>