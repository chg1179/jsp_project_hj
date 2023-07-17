<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../jdbc_set2.jsp"%>
<form name="updateForm" action="admin_reserv_update_sql.jsp">
		<%
			request.setCharacterEncoding("UTF-8");
			String uId = request.getParameter("uId");
			
			Statement stmt = null; // 쿼리 호출을 위한 객체
			ResultSet rs = null; // 결과를 담기 위한 객체
			
			try {
				stmt = conn.createStatement();
				// JOIN 필요함.@@@@@!!!!!!!! USER 테이블이랑 RESERV 테이블 
				// USER JOIN RESERV 해야할듯 아니면 반대로도 해보셈 
				String select = "SELECT * FROM HJ_TBL_USER WHERE U_ID= '" + uId + "'";
				rs = stmt.executeQuery(select);
				
				if (rs.next()) {
					String uName = rs.getString("U_NAME");
					String checkIn = rs.getString("CHECKIN");
					String checkOut = rs.getString("CHECKOUT");
		%>
				<input name="uId" value="<%= uId %>" hidden>
				<div>비밀번호 : <input name="pwd" type="password"></div>
				<div>이　　름 : <input type="text" value="<%=uName%>" name="uName"></div>
				<div>예약 날짜 변경</div>
				<div>체크인: <input type="date" value="<%=checkIn%>" name=checkIn></div>
				<div>체크아웃 : <input type="date" value="<%=checkOut%>" name="checkOut"></div>
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