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
<%-- 	<%
	Connection conn;
	Class.forName("com.mysql.jdbc.Driver"); 
	String db_url = "jdbc:mysql://127.0.0.1/jsp";
	String db_id = "root";
	String db_pw = "test123";
	conn = DriverManager.getConnection(db_url, db_id, db_pw);
	/* out.println("DB 연결 완료"); */
	%> --%>
	<%
	  Connection conn=null;
	
	  try{
	    String db_url = "jdbc:mysql://127.0.0.1/jsp";
	    String db_id = "root";
	    String db_pw = "test123";
	   
	    Class.forName("com.mysql.jdbc.Driver");
	    conn = DriverManager.getConnection(db_url,db_id ,db_pw );
	    out.println("제대로 연결되었습니다.");
	  }catch(Exception e){ 
	    e.printStackTrace();
	  }
	%>
</body>
</html>