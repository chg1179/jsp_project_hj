<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table{
		border : 1px solid black;
		border-collapse: collapse;
	}
	tr, th, td{
      border : 1px solid black;
    }
     th, td{
      padding : 5px 20px;
    }
</style>
</head>
<body>
	<table>
	<tr>
		<th>이름</th>
		<th>학번</th>
	</tr>
	<%@ include file="../jdbc_set.jsp"%>
	<%
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from student");
		
		while(rs.next()){
				out.println(
					"<tr><td>" + rs.getNString("stu_name") + "</td>" 
						+ "<td>" + rs.getNString("stu_no") + "</td></tr>");
				}
	%>
	</table>
</body>
</html>