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
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");
		
		Statement stmt = null;
		ResultSet rs = null;
		
		/*String update = "UPDATE STUDENT SET STU_DEPT = '" + stuNo + "', STU_GRADE = '" + stuGrade + "' WHERE STU_NO = '" + stuNo + "'";*/
		
		/* try{
			String select = "DELETE FROM STUDENT WHERE STU_NO = '" + stuNo + "' AND STU_GRADE = '" + stuGrade + "' AND STU_DEPT = '" + stuDept + "'"; 
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeUpdate(select);
			}
		} catch (SQLException ex){
			out.println("실패");
		} */

		
		// 입력한 학번이 있으면서 학과와 학년이 동일하면 삭제
		// 입력한 학번만 동일하면 학과와 학년을 입력한 값으로 업데이트
		try{
			stmt = conn.createStatement();
			String select = "SELECT * FROM STUDENT WHERE STU_NO = " + stuNo;
			rs = stmt.executeQuery(select);
			if(rs.next()){
				if(stuNo.equals("STU_NO".trim()) && stuDept.equals("STU_DEPT") && stuGrade.equals("STU_GRADE")){
					String delete = "DELETE FROM STUDENT WHERE STU_NO = '" + stuNo;
					stmt.executeUpdate(delete);
					out.println("STUDENT 테이블 삭제 성공");
				} else{
					String update = "UPDATE STUDENT SET STU_DEPT = '" + stuDept + "', STU_GRADE = '" + stuGrade + "' WHERE STU_NO = '" + stuNo + "'";
					stmt.executeUpdate(update);
					out.println("STUDENT 테이블 업데이트 성공");
				}
			} else {
				out.println("해당 학생이 존재하지 않습니다.");
			}
		} catch (SQLException ex){
			out.println("STUDENT 테이블 삽입 실패 <br>");
			out.println("SQLExcettion: " + ex.getMessage());
		}
	%>
</body>
</html>