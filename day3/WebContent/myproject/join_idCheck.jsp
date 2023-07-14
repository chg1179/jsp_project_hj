<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp" %>
	<form name="check">
	<%
		String id = request.getParameter("id");
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM TBL_USER WHERE U_ID = '" + id + "'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				out.println("사용중인 아이디 입니다. 다른 아이디를 입력하세요.");
		%>
			<input name="flg" value="N" hidden>
		<%
				
			} else {
				out.println("사용 가능한 아이디입니다.");
			}
			
		%>
			<input name="flg" value="Y" hidden>
		<%			 
			
		} catch(SQLException e){
			out.println(e.getMessage());
		}
	
	%>
	<input type="button" onclick="back()" value="되돌아가기">
	</form>
</body>
</html>
<script>
	function back(){
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}

</script>