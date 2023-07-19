<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css">
</head>
<body>
<form name="check">
<%@ include file="../jdbc_set2.jsp"%>	
	
	<%	
	request.setCharacterEncoding("UTF-8");
	
	String hId = request.getParameter("hId");
	String pwd = request.getParameter("pwd");
	
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		stmt = conn.createStatement();
		String sql = "SELECT * FROM HJ_TBL_HOST WHERE H_ID = '" + hId + "' AND PWD = '" + pwd + "'";
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){ // 아이디와 비밀번호가 맞을 때
			response.sendRedirect("host_main.jsp");
			if(rs.getString("BANYN").equals("Y")){
				out.println("정지된 회원입니다.");
				
			} else if(rs.getInt("CNT") >= 5){ // 5번 이상 실패
				out.println("비밀번호 5회 이상 오류. 관리자에게 문의하세요.");
				
			} else {
				session.setAttribute("hostId", hId); // key값 userId value값 uid
				session.setAttribute("hostName", rs.getString("H_NAME"));
				// 로그인 시도 횟수 초기화
				String update = "UPDATE HJ_TBL_HOST SET CNT = 0 WHERE H_ID = '" + hId + "'";
				stmt.executeUpdate(update);
			}
		} else { 
			sql = "SELECT * FROM HJ_TBL_HOST WHERE H_ID = '" + hId + "'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){ // 아이디만 맞을 때
				if(rs.getInt("CNT") >= 5){ // 5번 이상 실패
					out.println("비밀번호 5회 이상 오류. 관리자에게 문의하세요.");
				} else {
					String update = "UPDATE HJ_TBL_HOST SET CNT = CNT + 1 WHERE H_ID = '" + hId + "'";
					stmt.executeUpdate(update);
					response.sendRedirect("user_login_find.jsp");
				}
			} 
		}
		out.println("없는 회원입니다.회원가입 후 다시 시도해주세요.");
		
		
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
		location.href="host_login.jsp";
	}
</script>
