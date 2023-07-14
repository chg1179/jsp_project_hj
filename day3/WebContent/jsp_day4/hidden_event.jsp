<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../jdbc_set.jsp" %>
	<% 
		String stuNo = request.getParameter("stuNo");
		String kind = request.getParameter("btnKind");
		
		ResultSet rs = null; // 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			if(kind.equals("search")){
				// db 검색(select)
				String sql = "SELECT * FROM STUDENT WHERE STU_NO = '"  + stuNo + "'";
				rs = stmt.executeQuery(sql);
				// 이름: 000 학번: 00000000 출력
				if(rs.next()){
					out.println("이름 : " + rs.getString("STU_NAME"));
					out.println(", 학번 :  " + rs.getString("STU_NO"));
				} else {
					out.println("그런 사람 없음");
				}
					
			} else if(kind.equals("insert")){
				// db 삽입(insert)
				// 똑같은 학번이 존재하면 '이미 있는 학번입니다.'
				// 없으면 '삽입되었습니다.'
				
				String select = "SELECT * FROM STUDENT WHERE STU_NO = '"  + stuNo + "'";
				rs = stmt.executeQuery(select);
				
				if(rs.next()){
					out.println("이미 있는 학번입니다.");
				} else {
					String sql = "INSERT INTO STUDENT(STU_NO) VALUES('"+ stuNo +"')";
					int num = stmt.executeUpdate(sql);
					out.println("삽입 되었습니다.");
				}
				
				/*String select = "SELECT COUNT(*) AS CNT FROM STUDENT WHERE STU_NO = '"  + stuNo + "'";
				rs = stmt.executeQuery(select);
				rs.next();
				int cnt = Integer.parseInt(rs.getString("CNT"));
				if(cnt == 1){
					out.println("이미 있는 학번입니다.");
					
				} else { 
					String sql = "INSERT INTO STUDENT(STU_NO) VALUES('"+ stuNo +"')";
					int num = stmt.executeUpdate(sql);
					out.println("삽입 되었습니다.");
				} */
				
			} else if (kind.equals("remove")){
				// db 삭제(delete)
				String sql = "DELETE FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
				int num = stmt.executeUpdate(sql);
				out.println("삭제 되었습니다.");
			}
		} catch(SQLException e) {
			out.println(e.getMessage());
		}
		
		
	%>
	 
</body>
</html>