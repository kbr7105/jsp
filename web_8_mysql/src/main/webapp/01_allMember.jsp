<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	//String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String url = "jdbc:mysql://127.0.0.1:3306/ezen";
	String uid = "test";
	String pass = "1234";
	String sql = "select * from member";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="800" border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>암호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>권한(1:관리자, 0:일반회원)</th>
		</tr>
	
	<%
	try{
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url,uid,pass);
		
		System.out.println("mysql 연결 성공!"+con);
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString("name")+"</td>");
			out.println("<td>"+rs.getString("userid")+"</td>");
			out.println("<td>"+rs.getString("pwd")+"</td>");
			out.println("<td>"+rs.getString("email")+"</td>");
			out.println("<td>"+rs.getString("phone")+"</td>");
			out.println("<td>"+rs.getString("admin")+"</td>");
			out.println("</tr>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null){rs.close();}
			if(stmt != null){stmt.close();}
			if(con != null){con.close();}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	%>
	</table>
</body>
</html>