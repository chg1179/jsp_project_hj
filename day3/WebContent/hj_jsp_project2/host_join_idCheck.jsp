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
	<%@ include file="../jdbc_set2.jsp" %>
	<form name="check">
		<%
		request.setCharacterEncoding("UTF-8");
		String hId = request.getParameter("hId");
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM HJ_TBL_HOST WHERE H_ID = '" + hId + "'";
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