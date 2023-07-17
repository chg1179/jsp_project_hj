<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../jdbc_set2.jsp"%>
   <%
      request.setCharacterEncoding("UTF-8");
      String rNo = request.getParameter("rNo");
      ResultSet rs = null;
      Statement stmt = null;
      
      try{
         stmt = conn.createStatement();
         String select = "SELECT * FROM HJ_TBL_ACCM A INNER JOIN HJ_TBL_RESERV R ON A.A_NAME = R.A_NAME WHERE R.R_NO='"+ rNo +"'";
         stmt.executeQuery(select);
         String delete = "DELETE FROM HJ_TBL_RESERV WHERE R_NO = '" + rNo + "'";
         stmt.executeUpdate(delete);
         out.println("예약 취소되었습니다.");
            
      } catch (SQLException e){
         out.println(e.getMessage());
      }
   %>
   <input type="button" onclick="back()" value="되돌아가기">
</body>

</html>
<script>
	function back(){
		location.href="user_reserv_check.jsp";
	}
</script>