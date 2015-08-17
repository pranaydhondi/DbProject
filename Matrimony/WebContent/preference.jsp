<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.Login"%>
    <%
Login user = (Login) session.getAttribute("object"); 
if(user==null)response.sendRedirect("/Matrimony/index.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Preferences</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/style.css">

<style>
h4{
 	font-family: Times New Roman;
 	color:#5F9FFF;
 	
 }
 tr{
 
 	border-bottom-style:grove ;
 	
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
		<h1> Partner Preference</h1>
		<form method="post" action="Login">
		<table style="width:100%">
		<tr>
				<td><h4>Preferred Age:</h4></td>
				<td>
					<div id="From">
					From 
					<SELECT name="fromAge" id="fromAge" onchange="checkAge()">
					<option value="18" selected>18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					</SELECT> 
					</div> 
				</td>
				<td>
					<div id="To">
					to 
					<SELECT name="toAge" id="toAge" onchange="checkAge()">
					<option value="18" >18</option>
					<option value="19" selected>19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					</SELECT> 
				</div> 
				</td>
				<td></td>
				<td></td>
		</tr>
		<tr>
			<td><h4>Marital Status:</h4></td>
			<td><input type="checkbox" name="MStatus" value="1" checked> Unmaried</td>
			<td><input type="checkbox" name="MStatus" value="2" > Widow </td>
			<td><input type="checkbox" name="MStatus" value="4"> Divorsed</td>
			<td></td>
		</tr>
		<tr>
			<td><h4>Have Children:</h4>
			<td><input type="radio" name="Children" value="fine" checked> Doesn't matter</td>
			<td><input type="radio" name="Children" value="Yes"> Yes. living together</td>
			<td><input type="radio" name="Children" value="YesBut"> Yes. not living together</td>
			<td><input type="radio" name="Children" value="no"> No</td>
		</tr>
		<tr>
			<td><h4>Physical Status:</h4></td>
			<td><input type="radio" name="Physic" value="normal" checked> normal</td>
			<td><input type="radio" name="Physic" value="challenged">Physically Challenged</td>
			<td><input type="radio" name="Physic" value="fine"> Doesn't matter</td>
			<td></td>
		</tr>
		<tr>
			<td><h4>Eating Habits:</h4>	
			<td><input type="checkbox" name="EatingHabits" value="1" checked> Vegetarian</td>
			<td><input type="checkbox" name="EatingHabits" value="4" > Non Vegetarian</td>
			<td><input type="checkbox" name="EatingHabits" value="2"> eggetatian</td>
			<td></td>
		</tr>
		<tr>
			<td><h4>Drinking Habits:</h4>
			<td><input type="checkbox" name="DrinkingHabits" value="1" checked> Non-Drinker</td>
			<td><input type="checkbox" name="DrinkingHabits" value="2" > Light/Social-Drinker</td>
			<td><input type="checkbox" name="DrinkingHabits" value="4"> Regular Drinker</td>
			<td></td>
		</tr>
		<tr>
			<td><h4>Smoking Habits:</h4>
			<td><input type="checkbox" name="SmokingHabits" value="1" checked> Non-Smoker</td>
			<td><input type="checkbox" name="SmokingHabits" value="2" > Light/Social-Smoker</td>
			<td><input type="checkbox" name="SmokingHabits" value="4"> Regular Smoker</td>
			<td></td>
		</tr>
		<tr>
			<td><h4>Religion</h4></td>
			<td><select  name="religion"   >
			<option value="1">Hindu</option>
			<option value="10">Muslim - Shia</option>
			<option value="11">Muslim - Sunni</option>
			<option value="2">Muslim - Others</option>
			<option value="12">Christian - Catholic</option>
			<option value="13">Christian - Orthodox</option>
			<option value="14">Christian - Protestant</option>
			<option value="3">Christian - Others</option>
			<option value="4">Sikh</option>
			<option value="15">Jain - Digambar</option>
			<option value="16">Jain - Shwetambar</option>
			<option value="5">Jain - Others</option>
			<option value="6">Parsi</option><option value="7">Buddhist</option>
			<option value="8">Inter-Religion</option>
			<option value="9">No Religious Belief</option>
			</SELECT> </td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
		<td></td>
			<td></td>
			<td>
	<input name="form_name" value="preferences" hidden>
	 <button class="btn btn-primary " type="submit">Submit</button>
	</td>
		</tr>
		</table>
	</form>
		</center>
	</div>
	<script>
	function checkAge(){
		if(document.getElementById('fromAge').value>document.getElementById('toAge').value){
			alert("From Age should be less or equal to To Age");
			document.getElementById('toAge').value = document.getElementById('fromAge').value;
		}
	}
</script>
</body>