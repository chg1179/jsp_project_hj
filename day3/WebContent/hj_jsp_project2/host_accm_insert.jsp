<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css">
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
		String update = "INSERT INTO HJ_TBL_ACCM(H_ID, A_NAME, A_ADDR, A_PERSON) VALUES('"+hId+"' ,'"+aName+"' , '"+aAddr+"', '"+aPerson+"')";
		try{
			stmt=conn.createStatement();
			rs=stmt.executeQuery(select);
			stmt.executeUpdate(update);
			out.println("숙소 등록이 완료되었습니다.");
			System.out.println(hId);
			
		} catch (SQLException e){
			out.println(e.getMessage());
		}
	%>
	<input type="button" value="숙소 등록 정보 확인" onclick="back()">
</body>
</html>
<script>
	function back(){
		location.href="host_myPage.jsp";
	}
</script>
