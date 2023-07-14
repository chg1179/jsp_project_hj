<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../jdbc_set.jsp"%>
<form name="check">
	<%
		String uId = request.getParameter("uId");
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement(); // conn 의 메소드 호출
			String sql = "SELECT * FROM TBL_USER WHERE U_ID = '" + uId + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){ // 검색결과가 있으면 그 요소로 이동
				out.println("중복된 아이디가 있습니다. 다시 입력해주세요.");
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
	<input type="button" value="되돌아가기" onclick="back()">
	
</form>

</body>
</html>
<script>
	function back(){
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}
</script>