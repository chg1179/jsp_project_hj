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
      String hId = request.getParameter("hId");
      ResultSet rs = null;
      Statement stmt = null;
      
      try{
         stmt = conn.createStatement();
         String select = "SELECT * FROM HJ_TBL_HOST WHERE H_ID = '" + hId + "'";
         rs = stmt.executeQuery(select);
         if(rs.next()){
            if("Y".equals(rs.getString("BANYN"))){
               String delete = "DELETE FROM HJ_TBL_HOST WHERE H_ID = '" + hId + "'";
                stmt.executeUpdate(delete);
                out.println("삭제되었습니다.");
            } else {
               out.println("정지회원만 삭제할 수 있습니다.");
            }
            
         } else {
            out.println("해당 학생이 존재하지 않습니다.");
         }
      
      } catch (SQLException e){
         out.println(e.getMessage());
      }
   %>
   <input type="button" onclick="back()" value="되돌아가기">
</body>
</html>
<script>
	function back(){
		location.href="admin_host_table.jsp";
	}
</script>