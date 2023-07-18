<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style>
table {
	border-collapse: collapse;
	text-align: center;
}

th, td {
	border: 1px solid black;
	padding: 5px 10px;
}
</style>
</head>
<body>
<%@ include file="main2.jsp" %>
<%@ include file="../jdbc_set2.jsp"%>
<form name="list" action="user_reserv_cancel.jsp">
<div id="container">
	<h3>예약조회</h3>
		<%
		request.setCharacterEncoding("UTF-8");
		
		String userId = (String) session.getAttribute("userId");
	    String uName = (String) session.getAttribute("userName");
	    out.println(uName + "님의 예약정보");
	    
	    ResultSet rs = null;
	    Statement stmt = null;

	    %>
		<table>
			<tr>
				<th></th>
				<th>예약번호</th>
				<th>아이디</th>
				<th>숙소</th>
				<th>숙소주소</th>
				<th>결제</th>
				<th>예약인원</th>
				<th>체크인</th>
				<th>체크아웃</th>
			</tr>

			<%
			try {
				String sql = "SELECT * FROM HJ_TBL_ACCM A INNER JOIN HJ_TBL_RESERV R ON A.A_NAME = R.A_NAME WHERE R.U_ID='"+ userId +"'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					String aName = rs.getString("A_NAME");
					String aAddr = rs.getString("A_ADDR");
					String payment = rs.getString("PAYMENT");
					String rNo = rs.getString("R_NO");
					String pNum = rs.getString("PERSON_NUM");
					String checkIn = rs.getString("CHECKIN");
					String checkOut = rs.getString("CHECKOUT");
			%>
			<tr>
				<td><input type="radio" name="user" value="<%=rNo%>"></td>
				<td>R<%=rNo%></td>
				<td><%=userId%></td>
				<td><%=aName%></td>
				<td><%=aAddr%></td>
				<td><%=payment%></td>
				<td><%=pNum%></td>
				<td><%=checkIn%></td>
				<td><%=checkOut%></td>
			</tr>
			<%
				} 
		    
		} catch (SQLException e){
			out.print(e.getMessage());
		}
	%>
		</table>
		<input type="button" value="예약 취소 하기" onclick ="cancel()">
		<input type="button" value="메인페이지" onclick="goMain()">
	
</div>
</form>
</body>
</html>
<script>
	function cancel(){
		alert("정말 취소하시겠습니까?");
		var form = document.list;
		location.href = "user_reserv_cancel.jsp?rNo=" + form.user.value;
	}
	function goMain(){
		location.href="main.jsp";
	}
</script>