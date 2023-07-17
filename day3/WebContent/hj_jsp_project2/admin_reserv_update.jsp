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
<form name="updateForm" action="admin_reserv_update_sql.jsp" method="post">
		<%
			request.setCharacterEncoding("UTF-8");
			String rNo = request.getParameter("rNo");
			
			Statement stmt = null; // 쿼리 호출을 위한 객체
			ResultSet rs = null; // 결과를 담기 위한 객체
			
			try {
				stmt = conn.createStatement();
				// JOIN 필요함.@@@@@!!!!!!!! USER 테이블이랑 RESERV 테이블 
				String select = "SELECT * FROM HJ_TBL_RESERV R INNER JOIN HJ_TBL_USER U ON R.U_ID = U.U_ID WHERE R_NO = '" + rNo + "'";
				rs = stmt.executeQuery(select);
				
				if (rs.next()) {
					String uName = rs.getString("U_NAME");
					String checkIn = rs.getString("CHECKIN");
					String checkOut = rs.getString("CHECKOUT");
		%>
				<input name="rNo" value="<%= rNo %>" hidden>
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
		<div><input type="submit" value="수정"></div>
</form>
</body>
</html>
