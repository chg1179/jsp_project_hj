<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 예약</title>
</head>
<body>
	<%
		String uId = (String) session.getAttribute("userId");
	%>
	<form action="user_reserv_insert.jsp" name="bookingForm" method="post">
		<%@ include file="../jdbc_set2.jsp"%>
		<div id="container">
			<h3>숙소 예약</h3>
			<div>
				<input type="hidden" name="uId" value="<%= uId %>"> <select
					name="room">
					<option disabled selected>선택</option>
					<%
				request.setCharacterEncoding("UTF-8");
				ResultSet rs = null;
				Statement stmt = null;
				try {
					stmt = conn.createStatement();
					String sql = "SELECT A_NAME FROM HJ_TBL_ACCM GROUP BY A_NAME ORDER BY A_NAME";
					rs = stmt.executeQuery(sql);
					while(rs.next()){
						String aName = rs.getString("A_NAME");
				%>
					<option value="<%= aName %>"><%=aName%></option>
					<%
					}
					
				} catch (SQLException e){
					out.println(e.getMessage());
				}
				%>
				</select>
			</div>
			<div>
				결제방식 <select name="payment">
					<option disabled selected>선택</option>
					<option value="카드">신용카드</option>
					<option value="카카오페이">카카오페이</option>
					<option value="무통장">무통장입금</option>
				</select>
			</div>
			<div>
				인원 <select name="person_num">
					<option disabled selected hidden>선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select>
			</div>
			<div>예약날짜</div>
			<div>
				<input type="date" name="checkIn">~<input type="date"
					name="checkOut">
			</div>
			<div>
				<input type="button" onclick="booking()" value="예약하기">
			</div>
		</div>
	</form>
</body>
</html>
<script>
	function booking(){
		var form = document.bookingForm;
		var room = form.room.value;
		var userId = form.uId.value;
		console.log(userId);
		
		if(form.checkIn.value == "" || form.checkIn.value == undefined){
			alert("체크인 날짜를 선택해주세요.");
			form.checkIn.focus();
			return;
		}
		
		if(form.checkOut.value == "" || form.checkOut.value == undefined){
			alert("체크아웃 날짜를 선택해주세요.");
			form.checkOut.focus();
			return;
		}
		alert("예약하시겠습니까?")
		form.submit();
	}
</script>
