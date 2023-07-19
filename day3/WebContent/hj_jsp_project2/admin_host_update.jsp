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
<%@ include file="../jdbc_set2.jsp"%>
<form name="updateForm" action="admin_host_update_sql.jsp">
<div id="container">
		<%
			request.setCharacterEncoding("UTF-8");
			String hId = request.getParameter("hId");
			
			Statement stmt = null; // 쿼리 호출을 위한 객체
			ResultSet rs = null; // 결과를 담기 위한 객체
			try {
				stmt = conn.createStatement();
				String select = "SELECT * FROM HJ_TBL_HOST WHERE H_ID= '" + hId + "'";
				rs = stmt.executeQuery(select);
				
				if (rs.next()) {
					String hName = rs.getString("H_NAME");
					String phone
						= rs.getString("PHONE") != null ? rs.getString("PHONE") : "";
					String email
						= rs.getString("EMAIL") != null ? rs.getString("EMAIL") : "";
		%>
				<input name="hId" value="<%= hId %>" hidden>
				<div>비밀번호 : <input name="pwd" type="password"></div>
				<div>이　　름 : <input type="text" value="<%=hName%>" name="hName"></div>
				<div>핸 드 폰  : <input type="text" value="<%=phone%>" name="phone"></div>
				<div>이메일 : <input type="text" value="<%=email%>" name="email"></div>
		<%
				}
			} catch (SQLException e) {
				out.println(e.getMessage());
			}
		%>
		<div><input type="button" value="수정" onclick="hostUpdate()"></div>
</div>
</form>
</body>
</html>
<script>
	function hostUpdate(){
		var form = document.updateForm;
		form.submit();
	}
</script>