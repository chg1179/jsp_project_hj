<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="check">
<%@ include file="../jdbc_set.jsp"%>	
	
	<%	
	request.setCharacterEncoding("EUC-KR");
	
	String uId = request.getParameter("uId");
	String pwd = request.getParameter("pwd");
	String stat = request.getParameter("stat");
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		stmt = conn.createStatement();
		String sql = "SELECT * FROM TBL_USER WHERE U_ID = '" + uId + "' AND PWD = '" + pwd + "' AND STATUS = '" + stat + "'";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){ // 아이디와 비밀번호가 맞을 때
			if(rs.getString("BANYN").equals("Y")){
				out.println("정지된 회원입니다. 반성하세요.");
				
			} else if(rs.getInt("CNT") >= 5){ // 5번 이상 실패
				out.println("비밀번호 5회 이상 오류. 관리자에게 문의하세요.");
				
			} else {
				session.setAttribute("userId", uId); // key값 userId value값 uid
				session.setAttribute("userName", rs.getString("U_NAME"));
				session.setAttribute("status", rs.getString("STATUS"));
				// 로그인 시도 횟수 초기화
				String update = "UPDATE TBL_USER SET CNT = 0 WHERE U_ID = '" + uId + "'";
				stmt.executeUpdate(update);
				
				// 관리자
				if(stat.equals("A")){
					response.sendRedirect("login_user.jsp");
				} else { // 일반 사용자
					response.sendRedirect("login_main.jsp");
				}
			}
			
		} else { 
			sql = "SELECT * FROM TBL_USER WHERE U_ID = '" + uId + "'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){ // 아이디만 맞을 때
				if(rs.getInt("CNT") >= 5){ // 5번 이상 실패
					out.println("비밀번호 5회 이상 오류. 관리자에게 문의하세요.");
				} else {
					String update = "UPDATE TBL_USER SET CNT = CNT + 1 WHERE U_ID = '" + uId + "'";
					stmt.executeUpdate(update);
					response.sendRedirect("login_find.jsp");
				}
			}
		}
	} catch (SQLException e) {
		out.println(e.getMessage());
	}
	
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</form>
</body>
</html>
<script>
	function back(){
		location.href="login.jsp";
	}
</script>
