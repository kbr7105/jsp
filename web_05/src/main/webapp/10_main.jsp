<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>메인페이지</h3>
	<%
	if (session.getAttribute("loginUser") == null) {
		response.sendRedirect("10_loginForm.jsp");
	} else {
	%>
	<%=session.getAttribute("loginUser")%>님 안녕하세요!
	<form method="post" action="10_logout.jsp">
		<input type="submit" value="로그아웃" onclick="logout()">
	</form>
	<%
	}
	%>
	
	<script type="text/javascript">
		function logout(){
			alert("로그아웃되었습니다.");
		}
	</script>
</body>
</html>