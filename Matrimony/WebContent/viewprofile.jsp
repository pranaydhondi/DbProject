<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.Login" %>
<%
Login user = (Login) session.getAttribute("object"); 
if(user==null)response.sendRedirect("/Matrimony/index.jsp");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/style.css">
<title>Profile Info</title>
<style>
 .pic {
 	width:800px;
 	height:100%
 }
 
 h2 , h4{
 	font-family: Times New Roman;
 	color:#5F9FFF;
 	
 	border-bottom-style: groove;
 }
 
</style>
</head>
<body>
<div class="total">
<div id="nav">
<ul class="nav nav-tabs nav-justified" >
  <li ><a href="home.jsp">Home</a></li>
  <li class="active"><a href="profile.jsp">Profile</a></li>
  <li><a href="messages.jsp">Messages<span class="badge">42</span></a></li>
  <li><a href="browse.jsp">Browse</a></li>
  <li class="dropdown">
    <a class="dropdown-toggle" href="#">Edit <span class="caret"></span></a>
    <ul class="dropdown-menu" >
	 <li><a href="info.jsp">Profile</a></li>
     <li><a href="preference.jsp">Preferences</a></li>
     <li class="divider"></li>
     <li><a href="logout.jsp">Log Out</a></li>
    </ul>
  </li>
</ul>
</div>
<center>
	<h2>Profile Information</h2><br>
	<div class="pic" align="left"> 
	<img src="download.jpg" style='width:170px;height:230px'>
	</div>
<%
String details = user.getOthersDetails(request.getParameter("id"));
String[] components = details.split(":");
%>
<div class="details">
	<h4>Basic Details</h4>
	<div align="center" style="display:inline-block;width:45%">
	<table>
		<tr>
			<td>Profile Created for</td>  
			<td>: <%= components[0] %></td> 
		</tr>
		<tr>
			<td>Body Type/Complexion</td> 
			<td>:<%= components[5] %></td> 
		</tr>
		<tr>
			<td>Physical Status</td>
			<td>: <%= components[6] %> </td> 
		</tr>
		<tr><td>Weight</td>               <td>: <%= components[8] %></td> </tr>
		<tr><td>Marital Status</td>       <td>: <%= components[10] %></td></tr>
		<tr><td>Drinking habits</td>      <td>: <%= components[12] %></td></tr>
	</table>
	</div>
	<div align="center" style="display:inline-block;width:45%">
	<table>
	<tr><td>Name      </td>  <td>   : <%= components[1] %></td></tr>
	<tr><td>Age       </td>  <td>  : <%= components[14] %></td></tr>
	<tr><td>Height    </td>  <td>  : <%= components[7] %></td></tr>
	<tr><td>Mother Tongue </td>  <td> : <%= components[3] %></td></tr>
	<tr><td>Eating Habits </td>  <td> : <%= components[11] %></td></tr>
	<tr><td>Smoking Habits</td>  <td> : <%= components[13] %></td></tr>
	</table>
	</div>
	<h4>Religious Information</h4>
	<div>
	<table>
	<tr><td>Religion  </td>  <td>: <%= components[2] %> </td></tr>
	<tr><td>Zodiac </td>  <td>: <%= components[9] %></td></tr>
	</table>
	</div>
	<h4>Location</h4>
	<div align="center">
	<table>
	<tr><td>Country</td>  <td>: <%= components[4] %> </td></tr>
	<tr><td>State/City	</td>  <td> : <%= components[15] %></td></tr>
	</table>	
	</div>
	</div>
</center>
</div>
</body>
</html>
