<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
		text-align : center;
	}
	th, td{
		border : 1px solid black;
		padding : 5px 10px;
	}
</style>
</head>
<body>
<%@ include file="../jdbc_set2.jsp" %>
<form name="list">
<h1>예약 정보</h1>
	<table>
		<tr>
			<th></th>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰번호</th>
			<th>생년월일</th>
			<th>결제</th>
			<th>체크인</th>
			<th>체크아웃</th>
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			try {
				String sql = "SELECT * FROM HJ_TBL_BOOKING";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String uId = rs.getString("U_ID");
					String uName = rs.getString("U_NAME");
					String phone 
						= rs.getString("PHONE") != null ? rs.getString("PHONE") : "-";
					String birth 
						= rs.getString("BIRTH")  != null ? rs.getString("BIRTH") : "-";
					String payment 
						= rs.getString("PAYMENT")  != null ? rs.getString("PAYMENT") : "-";
					String checkIn 
						= rs.getString("CHECKIN")  != null ? rs.getString("CHECKIN") : "-";
					String checkOut 
						= rs.getString("CHECKOUT")  != null ? rs.getString("CHECKOUT") : "-";
					
		%>
			<tr>
				<td>
					<input type="radio" name="user" value="<%=uId%>">
				</td>
				<td><%=uId%></td>
				<td><%=uName%></td>
				<td><%=phone%></td>
				<td><%=birth%></td>
				<td><%=payment%></td>
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
	<input type="button" onclick="userUpdate()" value="수정"/>
	<input type="button" onclick="userRemove()" value="삭제"/>
</form>
</body>
</html>
<script>
	function userRemove(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		var form = document.list;
		location.href = "admin_user_del.jsp?uId=" + form.user.value;
	}
	
	function banChange(kind, uId){
		if(kind == "N"){
			kind = "Y";
		} else {kind = "N"}
		window.open("admin_user_ban.jsp?uId="+uId,"&kind="+kind,"popup"
				,"width=500, height=500");
	}
	//로그인 시도 횟수
	function cntReset(uId){
		window.open("admin_user_cnt.jsp?uId="+uId, "popup","width=500, height=500");
		
	}// 유저 정보 수정(관리자)
	function userUpdate(){
		var uId = document.list.user.value;
		window.open("admin_user_update.jsp?uId="+ uId, "update","width=500, height=500");
	}
	function getReturn(){
		location.reload();
	}
	
</script>