<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../jdbc_set.jsp"%>	
	
	<%
		request.setCharacterEncoding("EUC-KR");
	
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");
		
		Statement stmt = null; // ���� ȣ���� ���� ��ü
		ResultSet rs = null; // ����� ��� ���� ��ü
		
		try{
			stmt = conn.createStatement(); // ���� ȣ��
			String select = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'"; // ������ select ������ ���
			rs = stmt.executeQuery(select); // ������ �����ϰ� ����� rs ��ü�� ��ȯ
			
			if(rs.next()){ // Ŀ���� �������� �̵��ϰ� �ִٸ� true, ���ٸ� false true�� ���Դٴ� �� �ش� �л��� �����Ѵٴ� ��. 
				out.println("�̹� �ִ� �л��Դϴ�.");
			} else {
				String sql =  "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT, STU_GRADE) VALUES('" + stuNo + "','" + stuName + "', '" + stuDept + "', '" + stuGrade + "')";
				stmt.executeUpdate(sql);
				out.println("���̺� ���Կ� �����Ͽ����ϴ�.");
			}
				
			
			
			
		} catch(SQLException ex) {
				out.println("STUDENT ���̺� ������ �����߽��ϴ�.<br>");
				out.println("SQLException: " + ex.getMessage());
			}

	%> 

</html>