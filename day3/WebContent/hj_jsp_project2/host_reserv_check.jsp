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
	<%@ include file="host_menu.jsp"%>
	<%@ include file="../jdbc_set2.jsp"%>
	<form>
		<div id="container">
			<h3>회원 숙소 예약 정보</h3>
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
				ResultSet rs = null;
				Statement stmt = null;
				String hId = (String)session.getAttribute("hostId");
				try {
					stmt = conn.createStatement();
					String sql = "SELECT * FROM HJ_TBL_ACCM A INNER JOIN HJ_TBL_HOST H ON A.H_ID = H.H_ID INNER JOIN HJ_TBL_RESERV R ON A.A_NAME = R.A_NAME";
					System.out.println(sql);
					rs = stmt.executeQuery(sql);
					rs.next();
					
					if(rs.getNString("A.H_ID").equals(hId)) {
						String uId = rs.getString("U_ID");
						String aName = rs.getString("A_NAME");
						String aAddr = rs.getString("A_ADDR");
						String payment = rs.getString("PAYMENT");
						String rNo = rs.getString("R_NO");
						String pNum = rs.getString("PERSON_NUM");
						String checkIn = rs.getString("CHECKIN");
						String checkOut = rs.getString("CHECKOUT"); 
				%>
				
				<tr>
					<td><input type="radio" name="uId" value="<%=uId%>"></td>
					<td>R<%=rNo%></td>
					<td><%=uId%></td>
					<td><%=aName%></td>
					<td><%=aAddr%></td>
					<td><%=payment%></td>
					<td><%=pNum%></td>
					<td><%=checkIn%></td>
					<td><%=checkOut%></td>
				</tr>
				<%
				
				} 
				} catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
				}
				%>
			</table>
			<input type="button" onclick="reservUpdate()" value="수정" /> 
			<input type="button" onclick="reservRemove()" value="삭제" />
		</div>
	</form>
</body>
</html>
<script>
	function reservRemove() {
		if (!confirm("정말 삭제하시겠습니까?")) {
			return;
		}
		var form = document.list;
		var uId = form.uId.value;
		location.href = "host_reserv_del.jsp?uId=" + uId;
	}

	function reservUpdate() {
		var form = document.list;
		var uId = form.uId.value;
		window.open("host_reserv_update.jsp?uId=" + uId, "update",
				"width=500, height=500");
	}
	function getReturn() {
		location.reload();
	}
</script>