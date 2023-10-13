<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	Connection con = null;
	PreparedStatement ps = null;
	
	//String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String url = "jdbc:mysql://127.0.0.1:3306/ezen";
	String uid = "test";
	String pass = "1234";
	String sql = "insert into member values(?,?,?,?,?,?)";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String admin = request.getParameter("admin");
	
	
	try{
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url,uid,pass);
		
		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, userid);
		ps.setString(3, pwd);
		ps.setString(4, email);
		ps.setString(5, phone);
		ps.setInt(6, Integer.parseInt(admin));
		
		int result = ps.executeUpdate();
		
	}catch(Exception e){
		e.getStackTrace();
		System.out.println(e.getMessage());
	}finally{
		try{
			if(ps != null){ps.close();}
			if(con != null){con.close();}
		}catch(Exception e){
			e.printStackTrace();
		}

	}
%>
<h3>회원가입 성공</h3>
<a href="01_allMember.jsp">메인페이지</a>
</body>
</html>