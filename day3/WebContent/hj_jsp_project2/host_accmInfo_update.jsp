<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../jdbc_set2.jsp" %>
		<%
		request.setCharacterEncoding("UTF-8");
		String hId = request.getParameter("hostId");
		String aName = request.getParameter("aName");
		String aAddr = request.getParameter("aAddr");
		String aPerson = request.getParameter("aPerson");
		
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			stmt=conn.createStatement();
			String select2 = "SELECT * FROM HJ_TBL_ACCM WHERE H_ID = '"+ hId +"'";
			rs = stmt.executeQuery(select2);
			if(rs.next()){
				String update2 = "UPDATE HJ_TBL_ACCM SET A_NAME = '"+aName+"', A_ADDR = '"+aAddr+"', A_PERSON = '"+aPerson+"' WHERE H_ID = '"+hId+"'";
				stmt.executeUpdate(update2);
			}
		} catch(SQLException e){
			out.print(e.getMessage());
		}
	    %>
	    
</body> 
</html>
<script>
	alert("수정되었습니다.");
	location.href="host_myPage.jsp";
</script>