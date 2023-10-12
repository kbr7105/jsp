<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	session.setAttribute("id", "test");
	session.setAttribute("pwd", "1234");
	session.setAttribute("age", "20");
	
	%>
	
	<h3>세션 설정</h3>
</body>
</html>