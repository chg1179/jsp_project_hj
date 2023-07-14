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
<form name="updateForm" action="user_update_sql.jsp">
		<%
			request.setCharacterEncoding("UTF-8");
			String uId = request.getParameter("uId");
			
			Statement stmt = null; // 쿼리 호출을 위한 객체
			ResultSet rs = null; // 결과를 담기 위한 객체
			try {
				stmt = conn.createStatement();
				String select = "SELECT * FROM TBL_USER  WHERE U_ID= '" + uId + "'";
				rs = stmt.executeQuery(select);
				
				if (rs.next()) {
					String uName = rs.getString("U_ID");
					String phone
						= rs.getString("PHONE") != null ? rs.getString("PHONE") : "";
					String age
						= rs.getString("AGE") != null ? rs.getString("AGE") : "";
					String addr
						= rs.getString("ADDR") != null ? rs.getString("ADDR") : "";
		%>
				<input name="uId" value="<%= uId %>" hidden>
				<div>비밀번호 : <input name="pwd" type="password"></div>
				<div>이　　름 : <input type="text" value="<%=rs.getString("U_NAME")%>" name="uName"></div>
				<div>핸 드 폰  : <input type="text" value="<%=phone%>" name="phone"></div>
				<div>나　　이 : <input type="text" value="<%=age%>" name="age"></div>
				<div>주　　소 : <input type="text" value="<%=addr%>" name="addr"></div>
		<%
				}
			} catch (SQLException e) {
				out.println(e.getMessage());
			}
		%>
		<div><input type="button" value="수정" onclick="userUpdate()"></div>
</form>
</body>
</html>
<script>
	function userUpdate(){
		var form = document.updateForm;
		form.submit();
	}
</script>