<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>����������</h3>
	<%
	if (session.getAttribute("loginUser") == null) {
		response.sendRedirect("10_loginForm.jsp");
	} else {
	%>
	<%=session.getAttribute("loginUser")%>�� �ȳ��ϼ���!
	<form method="post" action="10_logout.jsp">
		<input type="submit" value="�α׾ƿ�" onclick="logout()">
	</form>
	<%
	}
	%>
	
	<script type="text/javascript">
		function logout(){
			alert("�α׾ƿ��Ǿ����ϴ�.");
		}
	</script>
</body>
</html>