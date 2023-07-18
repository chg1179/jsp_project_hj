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
	<h3>예약조회</h3>
		<%
		request.setCharacterEncoding("UTF-8");
		
		String uId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String uName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
	    ResultSet rs = null;
	    Statement stmt = null;
	    try{
	    	stmt=conn.createStatement();
	    	String select = "SELECT * FROM HJ_TBL_USER WHERE U_ID = '" +  uId + "'";
	    	rs=stmt.executeQuery(select);
	    	if(rs.next()){
	    		String update="UPDATE HJ_TBL_USER SET U_ID = '" + uId + "', PWD = '" + pwd + "', U_NAME = '"+uName+"', PHONE = '"+phone+"', EMAIL = '"+email+"' WHERE U_ID = '"+uId+"'";
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
	location.href="user_myPage_table.jsp";
</script>