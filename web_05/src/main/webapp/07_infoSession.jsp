<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3>세션정보 얻어오는 메소드 사용</h3>
	<%
		String id_str = session.getId();
		long lastTime = session.getLastAccessedTime();
		long createTime = session.getCreationTime();
		long timeUsed = (lastTime-createTime)/6000;
		int inactive = session.getMaxInactiveInterval()/60;
		boolean b_new = session.isNew();
		
	%>
	
	id : <%=id_str %><br>
	사용시간 : <%=timeUsed %><br>
	유효시간 : <%=inactive %><br>
	
	세션이 새로 만들어 졌나요?<br>
	<%
	if(b_new){
		out.print("새로운 세션이 생성되었습니다.");
	}else{
		out.print("아니요, 기존 세션이 유지중입니다.");
	}
	%>
	
</body>
</html>