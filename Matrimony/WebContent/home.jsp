<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.Login" import ="login.Data"%>
 <%
Login user = (Login) session.getAttribute("object"); 
if(user==null)response.sendRedirect("/Matrimony/index.jsp");
%>
<!DOCTYPE html SYSTEM "about:legacy-compat">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/style.css">
<title>Home</title>

</head>
<body>
<div class="total">
<div id="nav">
<ul class="nav nav-tabs nav-justified" >
  <li class="active"><a href="home.jsp">Home</a></li>
  <li><a href="profile.jsp">Profile</a></li>
  <li><a href="messages.jsp">Messages<span class="badge">42</span></a></li>
  <li><a href="browse.jsp">Browse</a></li>
  <li class="dropdown">
    <a class="dropdown-toggle" href="#">Edit <span class="caret"></span></a>
    <ul class="dropdown-menu" >
	 <li><a href="info.jsp">Profile</a></li>
     <li><a href="preference.jsp">Preferences</a></li>
     <li class="divider"></li>
     <li><a href="logout.jsp" >Log Out</a></li>
    </ul>
  </li>
</ul>
</div>
<div class="messages" style="height:100% display:block;">
<div id="new">
<a href="messages.jsp">New Messages<span class="badge">42</span></a>
</div>
<div id="accepted">
<a href="messages.jsp">Accepted <span class="badge">42</span></a>
</div>
<div id="read/notreplied">
<a href="messages.jsp">Read/Not Replied <span class="badge">42</span></a>
</div>
</div>
<%
ArrayList<Data> v= user.getData();
int i=v.size()-1;
while(i>=0) {
    Data s=v.get(i);
    out.println(" <div class='data' style='display:block; border-bottom-style:groove'>"+
    		"<div style='height:250px;width:500px;'>"+
    		"<a href='#'>"+
    			"<img src='download.jpg' style='width:170px;height:228px'>"+
    			"</a>"+
    			"<p style='float:right'>"+
    			"Profile Created for "+ s.profilefor +"<br>"+
    			"Name : "+s.name+"<br>"+
    			"Age, Height: " + s.age+ " Yrs, "+ s.height+ "<br>"+
    			"Religion :"+s.religion+"<br>"+
    			"Zodiac Sign :"+ s.zodiac+"<br>"+
    			"Location :"+ s.location+"<br>"+
    			"</p>"+
    		"</div>"+
    		"<div style='width:500px'>"+
    			"<div style='margin: -50px 50px 10px 10px;float:right'>"+
    	  		"<button type=button' class='btn btn-primary'style='background-color:green' id='"+ s.email+"' onClick='sendRequest(this.id)'>Send Interest</button>"+
    	  		"<button type='button' class='btn btn-success' id='"+ s.email+"' onClick='viewProfile(this.id)'>Profile</button>"+
    			
    			"</div>"+
    		"</div>"+
    	"</div>");
    
    i--;
}
%>

<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function sendRequest(clicked_id){
	document.getElementById(clicked_id).innerHTML= "Request Sent";
	setTimeout('', 5000);
	window.location="request.jsp?email="+clicked_id+"&do=send";
}
function viewProfile(clicked_id){
	
	window.location="viewprofile.jsp?id="+clicked_id;
}

</script>
</div>
</body>
</html>


