<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
﻿
<script src="../js/code.jquery.com_jquery-3.7.0.min.js"></script>
<title>Insert title here</title>
<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
}

tr, th, td {
	border: 1px solid black;
}

th, td {
	padding: 5px 20px;
}
</style>
</head>
<body>
	<%@ include file="../jdbc_set.jsp"%>
	<form name="list" action="jdbc_delete.jsp">
		<table width="300" border="1"> 
			<tr>
				<th></th>
				<!-- radio 넣을 열 하나 더 만들기 -->
				<th>이름</th>
				<th>학번</th>
			</tr>
			<%
				ResultSet rs = null;
				Statement stmt = null;
	
				try {
					String sql = "select * from student";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						String name = rs.getString("STU_NAME");
						String stuNo = rs.getString("STU_NO");
			%>
				<tr>
					<td><input type="checkbox" name="stu" value="<%=stuNo%>"></td>
					<td><%=name%></td>
					<td><%=stuNo%></td>
				</tr>
			<%
					}
				} catch (SQLException ex) {
					out.println("Member 테이블 호출이 실패했습니다.<br>");
					out.println("SQLException: " + ex.getMessage());
				}
			%>
		</table>
		<input type="button" onclick="update()" value="삭제" />
	</form>
</body>
</html>

<script>
	/* 체크된 애들 수정할거임 */
	function update() {
		var form = document.list;
		var vList = [];
		$("input:checkbox[name=stu]:checked").each(function(i, val) {
			console.log(i, "==>>" , val.value); // val 만 찍으면 객체가 나옴. .value 해줘야 value값 출력
			vList.push(val);
			/*val.checked = true;*/
			/*val.checked = false;*/
			
		});
		
		if(vList.length > 3){
			alert("3개까지만 선택 가능")
			for(var i=3; i<vList.length; i++){
				vList[i].checked = false;
			}
			return;
		}
		form.submit();
	}
</script>
