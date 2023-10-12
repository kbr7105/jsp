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
	Cookie cookie = new Cookie("id", "");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	Cookie c = new Cookie("pwd", "ee");
	c.setMaxAge(0);
	response.addCookie(c);
	
%>

<h3>id 쿠키가 삭제되었습니다.</h3>
<a href="02_getCookie.jsp">쿠키 삭제를 클릭하세요..</a>
</body>
</html>