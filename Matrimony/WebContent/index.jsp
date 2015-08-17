<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MARRYME.COM | matrimonial site</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<style> 

body{
background-image:url("hands.png");
background-repeat: no-repeat;
background-size: 100%;
}
img {
	height:900px;
	width:900px;
	z-index:-1;
}

.container{
	margin-top:150px;
}
.usr {
	width:250px;
	margin-top:20px;
}
.psw {
	width:250px;
	
	margin-bottom:20px;
}
h1{
	color:#00005C;
}
</style>
<body>
<% 
String msg = null;
if(session.getAttribute("message") == null){
}
else{ msg = (String) session.getAttribute("message");
session.setAttribute("message","");
}
%>
<div class="total">
<center>
<div class="container">
      <form class="form-signin" method="POST" action="Login">
        <h1 class="form-signin-heading">Welcome !</h1>
        <div class="usr">
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" name="username" class="form-control" placeholder="User Name" required="" autofocus="">
        </div>
        <div class="psw">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Password" required="">
        </div>
        <h4><%if(msg!=null)out.println(msg); %></h4>
        <button class="btn btn-primary " type="submit">Sign in</button>
        <a href="register.html"><button type="button" class="btn  btn-primary">Sign up</button></a>
      </form>

    </div> <!-- /container -->
</center>

</div>
</body>
</html>

