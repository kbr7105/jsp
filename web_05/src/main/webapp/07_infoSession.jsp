<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3>�������� ������ �޼ҵ� ���</h3>
	<%
		String id_str = session.getId();
		long lastTime = session.getLastAccessedTime();
		long createTime = session.getCreationTime();
		long timeUsed = (lastTime-createTime)/6000;
		int inactive = session.getMaxInactiveInterval()/60;
		boolean b_new = session.isNew();
		
	%>
	
	id : <%=id_str %><br>
	���ð� : <%=timeUsed %><br>
	��ȿ�ð� : <%=inactive %><br>
	
	������ ���� ����� ������?<br>
	<%
	if(b_new){
		out.print("���ο� ������ �����Ǿ����ϴ�.");
	}else{
		out.print("�ƴϿ�, ���� ������ �������Դϴ�.");
	}
	%>
	
</body>
</html>