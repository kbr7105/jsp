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
		String id = (String)session.getAttribute("id");
		String pwd = (String)session.getAttribute("pwd");
		String getAge = (String)session.getAttribute("age");
		int age = Integer.parseInt(getAge);
	%>
	
	<%=id %>
	<%=pwd %>
	<%=age %>
</body>
</html>