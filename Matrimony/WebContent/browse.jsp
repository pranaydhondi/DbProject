<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.Login" import="java.util.ArrayList" import="login.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Login user = (Login) session.getAttribute("object"); 
if(user==null)response.sendRedirect("/Matrimony/index.jsp");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Browse Profiles</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/style.css">
<style>
.total{
	
}
 	.browse {
 		height: 100%;
		width:25%;
		background-color:white;
		float:left;
	}
	.search{
		width:100%;
		
	}
	
	.Age{
		
	}
	.marriage{
		
	}
	.religion{
		
	}
	h5{
	ont-family: Times New Roman;
 	color:#5F9FFF;

	}
	.browse div {
	border-color:#F0F0FF;
		border-style: outset;
	}
	.search div{
		border:hidden;
	}
	.profiles{
		width:75%;
		border-color:#F0F0FF;
		border-style: outset;
		float:right;
	}
</style>
</head>
<body>
<div class="total">
<div id="nav">
<ul class="nav nav-tabs nav-justified" >
  <li ><a href="home.jsp">Home</a></li>
  <li><a href="profile.jsp">Profile</a></li>
  <li><a href="messages.jsp">Messages<span class="badge">42</span></a></li>
  <li class="active"><a href="browse.jsp">Browse</a></li>
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

<div class="browse">
	<div class="search">
	<h5>Search</h5>
    	<div class="input-group input-group-sm" >
      	<input type="text" id= "search" class="form-control" placeholder="search by name">
      	<span class="input-group-btn">
        	<button class="btn btn-primary btn-sm" type="button" onclick="getResults()">Go!</button>
      	</span>
    	</div><!-- /input-group -->
	</div>
	<div class="Age">
		<h5>Age</h5>
		<center>
		<input type="radio" id="age1" name="age" value="25" checked> &lt;=25 <br>
		<input type="radio" id="age2" name="age" value="30"> &lt;=30 <br>
		<input type="radio" id="age3" name="age" value="35"> &lt;=35 <br>
		<input type="radio" id="age4" name="age" value="40"> &lt;=40 <br>
		<input type="radio" id="age5" name="age" value="45"> &lt;=45 <br>
		</center>
	</div>
	<div class="marriage">
		<h5>Marital Status</h5>
		<center>
		
		<input type="checkbox" name="UnMarried" value=1 checked> UnMarried <br>
		<input type="checkbox" name="Divorsed" value=2> Divorsed&nbsp;&nbsp;&nbsp; <br>
		<input type="checkbox" name="Widoed" value=4> Widoed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
		</center>
	</div>
	<div class="religion">
		<h5>Religion</h5>
		<center>
		<input type="checkbox" name="Hindhu" value=1 checked> Hindhu&nbsp;&nbsp;&nbsp;<br>
		<input type="checkbox" name="Muslim" value=2> Muslim&nbsp;&nbsp;&nbsp;<br>
		<input type="checkbox" name="Christian" value=4> Christian <br>
		</center>
	</div>
</div>
<div class="profiles">
	<p>	
	</p>


</div>

<% ArrayList<Data> results = new ArrayList<Data>();
if(!(request.getParameter("name")==null)){
	out.println((request.getParameter("name")));
	results = user.getSearchResults(request.getParameter("name"),request.getParameter("age"),
			request.getParameter("mstatus"),request.getParameter("religion"));
	
}else if(request.getParameter("age") !=null){
	results = user.getSearchResults(":::::::",request.getParameter("age"),
	request.getParameter("mstatus"),request.getParameter("religion"));
}
int i=results.size()-1;
while(i>=0) {
    Data s=results.get(i);
    out.println(" <div class='data' style='display:block;'>"+
    		"<div style='height:250px;width:500px'>"+
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
    			"<div style='margin: 10px 50px 10px 10px;float:right'>"+
    			"<div class='btn-group' role='group' aria-label='...'>"+
    	  		"<button type=button' class='btn btn-primary'style='background-color:green'>Send Interest</button>"+
    	 
    	  		"<button type='button' class='btn btn-success'>Profile</button>"+
    			"</div>"+
    			"</div>"+
    		"</div>"+
    	"</div>");
    i=i-1;
}
%>


</div>
<script type="text/javascript">
function getResults(){
	var sname = document.getElementById("search").value;
	var i;
	var sage=0;
	if(document.getElementById("age1").checked) sage=25;
	if(document.getElementById("age2").checked) sage=30;
	if(document.getElementById("age3").checked) sage=35;
	if(document.getElementById("age4").checked) sage=40;
	if(document.getElementById("age5").checked) sage=45;
			
		
	var sMStatus=0; 
	if(document.getElementsByName("UnMarried")[0].checked) sMStatus+=1;
	if(document.getElementsByName("Divorsed")[0].checked) sMStatus+=2;
	if(document.getElementsByName("Widoed")[0].checked) sMStatus+=4;

	var sReligion=0; 
	if(document.getElementsByName("Hindhu")[0].checked) sReligion+=1;
	if(document.getElementsByName("Muslim")[0].checked) sReligion+=2;
	if(document.getElementsByName("Christian")[0].checked) sReligion+=4;
	window.location="browse.jsp?name="+sname+"&age="+sage+"&mstatus="+sMStatus+"&religion="+sReligion;
	
}
</script>
</body>
</html>