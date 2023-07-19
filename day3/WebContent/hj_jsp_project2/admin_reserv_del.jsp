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
 
<%@ include file="../jdbc_set2.jsp"%>
   <%
      request.setCharacterEncoding("UTF-8");
      String rNo = request.getParameter("rNo");
      ResultSet rs = null;
      Statement stmt = null;
      
      try{
         stmt = conn.createStatement();   
         String select = "SELECT * FROM HJ_TBL_RESERV R INNER JOIN HJ_TBL_USER U ON R.U_ID = U.U_ID WHERE R_NO = '" + rNo + "'";
         rs = stmt.executeQuery(select);
         
         if(rs.next()){
        	 String delete = "DELETE FROM HJ_TBL_RESERV WHERE R_NO = '" + rNo + "'";
             stmt.executeUpdate(delete);
             out.println("예약 취소되었습니다.");
         }
         
      } catch (SQLException e){
         out.println(e.getMessage());
      }
      System.out.println(rNo);
   %>
   <input type="button" onclick="back()" value="되돌아가기">
  
</body>

</html>
<script>
	function back(){
		location.href="admin_reserv_table.jsp";
	}
</script>