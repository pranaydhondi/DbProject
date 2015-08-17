<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.Login" %>
<%
Login user = (Login) session.getAttribute("object"); 
if(user==null);
else {
	session.invalidate();
}
response.sendRedirect("/Matrimony/index.jsp");
%>