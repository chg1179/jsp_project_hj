<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css">
<style>
 #container select {
	width: 100%;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 14px;
    margin: 5px;
} 
</style>
</head>
<body>
<%@ include file="host_menu.jsp" %>
<%@ include file="../jdbc_set2.jsp"%>
<%
	Statement stmt = null;
	ResultSet rs = null;
	String hId = (String)session.getAttribute("hostId");
	
	try{
		stmt=conn.createStatement();
		String select = "SELECT * FROM HJ_TBL_HOST H INNER JOIN HJ_TBL_ACCM A ON H.H_ID = A.H_ID;";	
		rs = stmt.executeQuery(select);
		
	} catch(SQLException e){
		out.println(e.getMessage());
	}
%>

<form action="host_accm_insert.jsp" name="accmInsert">
<div id="container">
	<h3>숙소등록</h3>	
	<div><input type="text" name="hId" value="<%= hId %>" hidden></div>
	<div><input type="text" name="aName" placeholder="숙소 이름" required></div>
	<div><input type="text" name="aAddr" placeholder="숙소 주소" required></div>
	<div>
		<select name = aPerson required>
			<option value="">선택</option>
			<% for(int i=1; i<=6; i++){ %>
				<option value="<%= i %>"><%= i %>명</option>
			<% } %>		
		</select>
	</div>
	<div><input type="submit" value="등록"></div>
</div>
</form>
</body>
</html>
