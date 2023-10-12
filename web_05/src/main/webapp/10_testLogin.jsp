<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
String id = "test";
String pwd = "1234";
String name = "Á¶Á¶";

if(id.equals(request.getParameter("id"))&&pwd.equals(request.getParameter("pwd"))){
	session.setAttribute("loginUser", name);
	response.sendRedirect("10_main.jsp");
}else{
	response.sendRedirect("10_loginForm.jsp");
}
%>
