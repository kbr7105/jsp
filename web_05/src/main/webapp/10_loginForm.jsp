<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="10_testLogin.jsp" method="post">
		���̵� : <input type="text" name="id" id="id"><br> 
		��ȣ : <input type="password" name="pwd" id="pwd"><br> 
		<input type="submit" value="�α���" onclick="check()">
	</form>

	<script type="text/javascript">
		function check() {
			if(document.getElementById("id").value == ""){
				console.log("id");
				alert("���̵� ���� �Է� �� �ּ���");
			}else if(document.getElementById("pwd").value == ""){
				alert("��й�ȣ ���� �Է� �� �ּ���");
				console.log("pwd");
			}else{
				alert("���� â���� �̵��մϴ�.");
			}
		}
	</script>
</body>
</html>