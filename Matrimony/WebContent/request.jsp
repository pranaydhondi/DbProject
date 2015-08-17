<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.Login" %>
<%
Login user = (Login) session.getAttribute("object"); 
String doi= request.getParameter("do");
if(user==null);
else if(doi.equals("send")){
	user.send_interest(request.getParameter("email"));
	response.sendRedirect("/Matrimony/home.jsp");
}
else if(doi.equals("cancel")){
	user.cancel_interest(request.getParameter("email"));
	response.sendRedirect("/Matrimony/home.jsp");
}
else if(doi.equals("accept")){
	user.accept_interest(request.getParameter("email"));
	response.sendRedirect("/Matrimony/messages.jsp");
}
else{
response.sendRedirect("/Matrimony/home.jsp");
}
%>