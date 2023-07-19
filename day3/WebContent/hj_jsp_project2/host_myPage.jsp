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
 #container select {
	width: 100%;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 14px;
    margin: 5px;
} 


</style>
</head>
<body>
<%@ include file="host_menu.jsp" %>
<%@ include file="../jdbc_set2.jsp"%>
	<form action="host_myPage_update.jsp" name="myInfo">
	<div id="container">
	  <%
		request.setCharacterEncoding("UTF-8");
	    String hId = (String) session.getAttribute("hostId");
	    String hName = (String) session.getAttribute("hostName");
	    
	    ResultSet rs = null;
	    Statement stmt = null;
	  %>
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
				
				String sql = "SELECT * FROM HJ_TBL_HOST WHERE H_ID = '" + hId + "'";
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					String hostName = rs.getString("H_NAME");
					String pwd = rs.getString("PWD");
					String email = rs.getString("EMAIL");
					String phone = rs.getString("PHONE");
			%>
			<input type="text" name="hostId" value="<%= hId %>" hidden>
			<tr>
				<td><%= hId %></td>
				<td><input type="text" name="pwd" value="<%= pwd %>"></td>
				<td><input type="text" name="hostName" value="<%= hostName %>"></td>
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
	</div>
	</form>
	
	<form action="host_accmInfo_update.jsp" name="accmInfo">
	<div id="container">
		<h3>숙소 정보 수정</h3>	
		<table>
			<tr>
				<th>숙소 이름</th>
				<th>숙소 위치</th>
				<th>수용 인원</th>
			</tr>
		<% 
			try{
				stmt = conn.createStatement();
				
				String sql = "SELECT * FROM HJ_TBL_ACCM WHERE H_ID = '" + hId + "'";
				rs = stmt.executeQuery(sql);
				/* out.println(hId); */
				if(rs.next()){
					String aName = rs.getString("A_NAME");
					String aAddr = rs.getString("A_ADDR");
					String aPerson = rs.getString("A_PERSON");
					String aNo = rs.getString("A_NO");
			%>
			<input type="text" name="hostId" value="<%= hId %>" hidden>
			<tr>
				<td><input type="text" name="aName" value="<%= aName %>"></td>
				<td><input type="text" name="aAddr" value="<%= aAddr %>"></td>
				<td> 
					<select name = aPerson required>
						<option value=""><%= aPerson %>명</option>
						<% for(int i=1; i<=6; i++){ %>
						<option value="<%= i %>"><%= i %>명</option>
						<% } %>		
					</select>
				</td>
			</tr>
			<%
				}
				
			} catch (SQLException e) {
				out.println(e.getMessage());
			}
		%>
		</table>
		<input type="button" onclick="accmUpdate()" value="수정"/>
	</div>
	</form>
</body>
</html>
<script>
	function infoUpdate(){
		var form = document.myInfo;
		var hId= form.hostId.value;
		var pwd= form.pwd.value;
		var hName = form.hostName.value;
		var email = form.email.value;
		var phone = form.phone.value;
		form.submit();
	}
	function accmUpdate(){
		var form = document.accmInfo;
		var hId= form.hostId.value;
		var aName= form.aName.value;
		var aAddr = form.aAddr.value;
		var aPerson = form.aPerson.value;
		form.submit();
	}
</script>