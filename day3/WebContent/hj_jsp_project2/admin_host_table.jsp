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
<h1>호스트 정보</h1>
	<table>
		<tr>
			<th></th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>핸드폰번호</th>
			<th>정지여부</th>
			<th>기능</th>
			<th>시도횟수</th>
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			try {
				String sql = "SELECT * FROM HJ_TBL_HOST WHERE STATUS = 'U' ORDER BY H_ID ASC";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String hId = rs.getString("H_ID");
					String hName = rs.getString("H_NAME");
					String phone 
						= rs.getString("PHONE") != null ? rs.getString("PHONE") : "-";
					String email 
						= rs.getString("EMAIL")  != null ? rs.getString("EMAIL") : "-";
					String banYn 
						= rs.getString("BANYN").equals("Y") ? "정지" : "";
					String btnYn 
						= rs.getString("BANYN").equals("Y") ? "해제" : "정지";
					String reset 
						= rs.getInt("CNT") >=5 ? "button" : "hidden";
		%>
			<tr>
				<td>
					<input type="radio" name="user" value="<%=hId%>">
				</td>
				<td><%=hId%></td>
				<td><%=hName%></td>
				<td><%=email%></td>
				<td><%=phone%></td>
				<td style="color:red"><%=banYn%></td>
				<td><input type="button" value="<%=btnYn%>" onclick="banChange('<%=rs.getString("BANYN")%>', '<%=hId%>')"></td>	
				<td><input type="<%=reset%>" value="초기화" onclick="cntReset('<%=hId%>')"></td>
			</tr>
		<%
				}
			} catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>
	</table>
	<input type="button" onclick="hostUpdate()" value="수정"/>
	<input type="button" onclick="hostRemove()" value="삭제"/>
</form>
</body>
</html>
<script>
	function hostRemove(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		var form = document.list;
		location.href = "admin_host_del.jsp?hId=" + form.user.value;
	}
	
	function banChange(kind, uId){
		if(kind == "N"){
			kind = "Y";
		} else {kind = "N"}
		window.open("admin_host_ban.jsp?hId="+hId,"&kind="+kind,"popup"
				,"width=500, height=500");
	}
	//로그인 시도 횟수
	function cntReset(uId){
		window.open("admin_host_cnt.jsp?hId="+hId, "popup","width=500, height=500");
		
	}// 유저 정보 수정(관리자)
	function hostUpdate(){
		var hId = document.list.user.value;
		window.open("admin_host_update.jsp?hId="+hId, "update","width=500, height=500");
	}
	function getReturn(){
		location.reload();
	}
	
</script>