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
		session.invalidate();
		//response.sendRedirect("10_main.jsp");
	%>
	<script type="text/javascript">
		alert("�α׾ƿ� �Ǿ����ϴ�.");
		location.href="10_main.jsp";
	</script>
</body>
</html>