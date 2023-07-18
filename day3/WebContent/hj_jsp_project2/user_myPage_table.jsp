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
<form name="myInfo" action="user_mypage_update.jsp">
	<div id="container">
		<%
		request.setCharacterEncoding("UTF-8");
	    String uName = (String) session.getAttribute("userName");
	    String userId = (String) session.getAttribute("userId");
	    
	    ResultSet rs = null;
	    Statement stmt = null;
	    %>
	    
	    <!-- @@@@@@@@  내정보 수정 -->
	    <h3>내정보 수정</h3>
		<table>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>핸드폰번호</th>
			</tr>
			<% 
			try{
				stmt = conn.createStatement();
				
				String sql = "SELECT * FROM HJ_TBL_USER WHERE U_ID = '" + userId + "'";
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					String useId = rs.getString("U_ID");
					String pwd = rs.getString("PWD");
					String userName = rs.getString("U_NAME");
					String email = rs.getString("EMAIL");
					String phone = rs.getString("PHONE");
			%>
			<tr>
				<td><input type="text" name="userId" value="<%= useId %>"></td>
				<td><input type="text" name="pwd" value="<%= pwd %>"></td>
				<td><input type="text" name="userName" value="<%= userName %>"></td>
				<td><input type="email" name="email" value="<%= email %>"></td>
				<td><input type="text" name="phone" value="<%= phone %>"></td>
			</tr>
			<%
				}
				
			} catch (SQLException e) {
				out.println(e.getMessage());
			}
		%>
		</table>
		<input type="button" onclick="infoUpdate()" value="수정"/>
		<input type="button" onclick="goMain()" value="메인페이지"/>
	</div>
</form>
	
</body>
</html>
<script>
	function infoUpdate(){
		var form = document.myInfo;
		var uId= form.useId.value;
		var pwd= form.pwd.value;
		var uName = form.userName.value;
		var email = form.email.value;
		var phone = form.phone.value;
		form.submit();
	}
	function goMain(){
		location.href="main.jsp";
	}
</script>