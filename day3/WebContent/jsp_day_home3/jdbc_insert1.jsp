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
		
		Statement stmt = null; // 쿼리 호출을 위한 객체
		ResultSet rs = null; // 결과를 담기 위한 객체
		
		try{
			stmt = conn.createStatement(); // 쿼리 호출
			String select = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'"; // 쿼리를 select 변수에 담기
			rs = stmt.executeQuery(select); // 뭐리를 수행하고 결과를 rs 객체에 반환
			
			if(rs.next()){ // 커서가 다음으로 이동하고 있다면 true, 없다면 false true가 나왔다는 건 해당 학생이 존재한다는 뜻. 
				out.println("이미 있는 학생입니다.");
			} else {
				String sql =  "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT, STU_GRADE) VALUES('" + stuNo + "','" + stuName + "', '" + stuDept + "', '" + stuGrade + "')";
				stmt.executeUpdate(sql);
				out.println("테이블 삽입에 성공하였습니다.");
			}
				
			
			
			
		} catch(SQLException ex) {
				out.println("STUDENT 테이블 삽입이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			}

	%> 

</html>