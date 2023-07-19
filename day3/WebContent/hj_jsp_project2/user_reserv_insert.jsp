<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css">
</head>
<body>
<form action="user_reserv_check.jsp">
    <%@ include file="../jdbc_set2.jsp" %>
    <%  
        request.setCharacterEncoding("UTF-8");
        String room = request.getParameter("room");
        String userId = request.getParameter("uId");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String personNum = request.getParameter("person_num");
        String payment = request.getParameter("payment");
        
        Statement stmt = null;
        ResultSet rs = null;
        String select = "SELECT * FROM HJ_TBL_ACCM A INNER JOIN HJ_TBL_RESERV R ON A.A_NAME = R.A_NAME";
        String insert = "INSERT INTO HJ_TBL_RESERV(A_NAME, U_ID, PERSON_NUM, CHECKIN, CHECKOUT, PAYMENT) VALUES ('" + room + "', '" + userId + "', '" + personNum + "', '" + checkIn + "', '" + checkOut + "', '" + payment + "')";
       	
        try {
            stmt = conn.createStatement();
            stmt.executeQuery(select);
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

