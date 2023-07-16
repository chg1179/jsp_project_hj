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
<form action="main.jsp" name="list">
	<h3>예약조회</h3>
	<%
		request.setCharacterEncoding("UTF-8");
		String uId = (String) session.getAttribute("userId");
	    String uName = (String) session.getAttribute("userName");
	    out.println(uName + "님의 예약정보");
	    ResultSet rs = null;
	    Statement stmt = null;
	    
		try{
			stmt = conn.createStatement();
		    String select = "SELECT * FROM HJ_TBL_RESERV R INNER JOIN HJ_TBL_USER U ON R.U_ID = U.U_ID";
		    rs = stmt.executeQuery(select);
		    
		} catch (SQLException e){
			out.print(e.getMessage());
		}
	
	%>
	<button value="submit">메인페이지</button>
</form>
</body>
</html>
