<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="user_booking_check.jsp">
	<%@ include file="../jdbc_set2.jsp"%>	
	
	<%	
		request.setCharacterEncoding("UTF-8");
		String uName = request.getParameter("uName");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String person_num = request.getParameter("person_num");
		String payment = request.getParameter("payment");
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement();
			String insert = "INSERT INTO HJ_TBL_BOOKING(U_NAME ,BIRTH, PHONE, PERSON_NUM, CHECKIN, CHECKOUT , PAYMENT) VALUES('" + uName + "', '" + birth + "','" + phone + "', '" + person_num + "','" + checkIn + "','" + checkOut + "','" + payment + "')";
			System.out.println(insert);
			stmt.executeUpdate(insert);
			out.println("예약이 완료되었습니다.");
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
	
	%>
	<input type="submit" value="예약 내역 조회">
</form>
</body>
</html>
