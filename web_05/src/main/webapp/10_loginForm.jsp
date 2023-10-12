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
		아이디 : <input type="text" name="id" id="id"><br> 
		암호 : <input type="password" name="pwd" id="pwd"><br> 
		<input type="submit" value="로그인" onclick="check()">
	</form>

	<script type="text/javascript">
		function check() {
			if(document.getElementById("id").value == ""){
				console.log("id");
				alert("아이디 값을 입력 해 주세요");
			}else if(document.getElementById("pwd").value == ""){
				alert("비밀번호 값을 입력 해 주세요");
				console.log("pwd");
			}else{
				alert("메인 창으로 이동합니다.");
			}
		}
	</script>
</body>
</html>