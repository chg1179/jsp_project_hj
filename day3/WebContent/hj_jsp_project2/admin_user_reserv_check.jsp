<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
		text-align : center;
	}
	th, td{
		border : 1px solid black;
		padding : 5px 10px;
	}
</style>
</head>
<body>
<%@ include file="../jdbc_set2.jsp" %>
<form name="list">
	<h3>예약자 조회</h3>
	<div>회원 아이디 <input type="text" name="uId"></div>
	<input type="submit" onclick="check()" value="조회"/>
	
	<%
		request.setCharacterEncoding("UTF-8");
	    String uId = request.getParameter("uId");
	    ResultSet rs = null;
	    Statement stmt = null;
	    
		try{
			stmt = conn.createStatement();
		    String select = "SELECT * FROM HJ_TBL_USER WHERE U_ID = '" + uId + "'";
		    rs = stmt.executeQuery(select);
		    
		} catch (SQLException e){
			out.print(e.getMessage());
		}
	
	%>
</form>
</body>
</html>
<script>
	function check(){
		location.href="admin_user_reserv_table";
	}
</script>