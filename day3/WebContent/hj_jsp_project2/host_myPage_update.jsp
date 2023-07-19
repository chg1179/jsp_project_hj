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
		String pwd = request.getParameter("pwd");
		String hName = request.getParameter("hostName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
	    ResultSet rs = null;
	    Statement stmt = null;
	    try{
	    	stmt=conn.createStatement();
	    	String select = "SELECT * FROM HJ_TBL_HOST WHERE H_ID = '" +  hId + "'";
	    	rs=stmt.executeQuery(select);
	    	if(rs.next()){
	    		String update="UPDATE HJ_TBL_HOST SET PWD = '" + pwd + "', H_NAME = '"+hName+"', PHONE = '"+phone+"', EMAIL = '"+email+"' WHERE H_ID = '"+hId+"'";
		    	stmt.executeUpdate(update);
	    	}
	    	
	    }  catch (SQLException e){
			out.print(e.getMessage());
	    }
	    %>
	    
</body> 
</html>
<script>
	alert("수정되었습니다.");
	location.href="host_myPage.jsp";
</script>