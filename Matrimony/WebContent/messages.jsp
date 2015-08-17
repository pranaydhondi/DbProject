<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.Login" import ="login.Data"%>
    <%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" href="css/tabs.css">
<title>Inbox</title>
</head>

<body>
<div class="total">
	<div id="nav">
		<ul class="nav nav-tabs nav-justified" >
  			<li ><a href="home.jsp">Home</a></li>
  			<li><a href="profile.jsp">Profile</a></li>
  			<li class="active"><a href="messages.jsp">Messages<span class="badge">42</span></a></li>
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
 	<div class="tabs">
    	<input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked" />
    	<label for="tab-1" class="tab-label-1">All</label>
     
    	<input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
    	<label for="tab-2" class="tab-label-2">New</label>
     
    	<input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
    	<label for="tab-3" class="tab-label-3">Accepted</label>
     
    	<input id="tab-4" type="radio" name="radio-set" class="tab-selector-4" />
    	<label for="tab-4" class="tab-label-4">Rejected</label>
    	
    	<input id="tab-5" type="radio" name="radio-set" class="tab-selector-5" />
    	<label for="tab-5" class="tab-label-5">Not Replied</label>
             
             <%
ArrayList<Data> sent= user.getMsgsSent();
ArrayList<Data> recevied= user.getMsgsReceived();
String script = "<script type=\"text/javascript\">";
script+= "getElementById('s').innerHTML= '<p>'+'ajgbsh'+'</p>'; </script>";
out.println(script);
%>

    	<div class="clear-shadow"></div>                 
    	<div class="content">
        	<div class="content-1" id="content-1">
            	<p id="s">This folder contains all communications like personalised messages, interests, requests, etc that you have received from others.
 It also contains the responses for the communication you sent to others.<br></p>
 <% int i=sent.size()-1; 
 
	while(i>=0) {
	    Data s=sent.get(i);
	    out.println(
	    		"<a href='#'>"+"<img src='download.jpg' style='width:170px;height:228px'>"+
	    			"</a>"+
	    			"<button type='button' class='btn btn-success' style='float:right' id='"+ s.email+"' onClick='viewProfile(this.id)'>Profile</button>"+
	    			"<button type=button' class='btn btn-primary'style='float:right' id='"+ s.email+"' onClick='cancelRequest(this.id)'>Request Sent</button>"+
	    			"<p style='float:right'>"+
	    			"Name : "+s.name+"<br>"+
	    			"Age, Height: " + s.age+ " Yrs, "+ s.height+ "<br>"+
	    			"Religion :"+s.religion+"<br>"+
	    			"Location :"+ s.location+"<br>"+
	    			"</p>"+
	    			"<p><br></p>"
	    	  		
	    	  		
	    	  	
	    		);
	    i--;
	    }
	int j=recevied.size()-1;   
	while(j>=0) {
	    Data s=recevied.get(j);
	    out.println(
	    		"<a href='#'>"+"<img src='download.jpg' style='width:170px;height:228px'>"+
	    			"</a>"+
	    			"<button type='button' class='btn btn-success' style='float:right' id='"+ s.email+"' onClick='viewProfile(this.id)'>Profile</button>"+
	    			"<button type=button' class='btn btn-primary'style='float:right' id='"+ s.email+"' onClick='acceptRequest(this.id)'>Accept Request</button>"+
	    			"<p style='float:right'>"+
	    			"Name : "+s.name+"<br>"+
	    			"Age, Height: " + s.age+ " Yrs, "+ s.height+ "<br>"+
	    			"Religion :"+s.religion+"<br>"+
	    			"Location :"+ s.location+"<br>"+
	    			"</p>"+
	    			"<p><br></p>"
	    	  		
	    	  		
	    	  	
	    		);
	    j--;
	    }

 
 
 %>
        	</div>
        	<div class="content-2"id="content-2">
            	<p>This folder contains all the new communications that you have received from others. 
            It also contains the new responses for the communications you sent.<br></p>
           <%
           j=recevied.size()-1;   
       	while(j>=0) {
       	    Data s=recevied.get(j);
       	    if(!s.accept.equals("accepted")) {
       	    out.println(
       	    		"<a href='#'>"+"<img src='download.jpg' style='width:170px;height:228px'>"+
       	    			"</a>"+
       	    			"<button type='button' class='btn btn-success' style='float:right' id='"+ s.email+"' onClick='viewProfile(this.id)'>Profile</button>"+
       	    			"<button type=button' class='btn btn-primary'style='float:right' id='"+ s.email+"' onClick='acceptRequest(this.id)'>Accept Request</button>"+
       	    			"<p style='float:right'>"+
       	    			"Name : "+s.name+"<br>"+
       	    			"Age, Height: " + s.age+ " Yrs, "+ s.height+ "<br>"+
       	    			"Religion :"+s.religion+"<br>"+
       	    			"Location :"+ s.location+"<br>"+
       	    			"</p>"+
       	    			"<p><br></p>"
       	    	  		
       	    	  		
       	    	  	
       	    		);
       	    
       	    }
       	 j--;
       	}
           
           
           %> 
        	</div>
        	<div class="content-3"id="content-3">
           		<p>This folder contains all interests and requests that have been accepted either by you or by others<br></p>
           		
           <% i=sent.size()-1; 
 	while(i>=0) {
	    Data s=sent.get(i);
	  
	    if(s.accept.equals("accepted")) {
	    
	    out.println(
	    		"<a href='#'>"+"<img src='download.jpg' style='width:170px;height:228px'>"+
	    			"</a>"+
	    			"<button type='button' class='btn btn-success' style='float:right' id='"+ s.email+"' onClick='viewProfile(this.id)'>Profile</button>"+
	    			"<button type=button' class='btn btn-primary'style='float:right' id='"+ s.email+"' >Accepted</button>"+
	    			"<p style='float:right'>"+
	    			"Name : "+s.name+"<br>"+
	    			"Age, Height: " + s.age+ " Yrs, "+ s.height+ "<br>"+
	    			"Religion :"+s.religion+"<br>"+
	    			"Location :"+ s.location+"<br>"+
	    			"</p>"+
	    			"<p><br></p>"
	    	  		
	    	  		
	    	  	
	    		);
	    }
	    
	    i--;
	}
 	i=recevied.size()-1; 
 	while(i>=0) {
	    Data s=recevied.get(i);
	  
	    if(s.accept.equals("accepted")) {
	    
	    out.println(
	    		"<a href='#'>"+"<img src='download.jpg' style='width:170px;height:228px'>"+
	    			"</a>"+
	    			"<button type='button' class='btn btn-success' style='float:right' id='"+ s.email+"' onClick='viewProfile(this.id)'>Profile</button>"+
	    			"<button type=button' class='btn btn-primary'style='float:right' id='"+ s.email+"' >Accepted</button>"+
	    			"<p style='float:right'>"+
	    			"Name : "+s.name+"<br>"+
	    			"Age, Height: " + s.age+ " Yrs, "+ s.height+ "<br>"+
	    			"Religion :"+s.religion+"<br>"+
	    			"Location :"+ s.location+"<br>"+
	    			"</p>"+
	    			"<p><br></p>"
	    	  		
	    	  		
	    	  	
	    		);
	    }
	    
	    i--;
	}
 %>
        	</div>
        	<div class="content-4"id="content-4">
            	<p>This folder contains all communications that have been declined either by you or by others.	<br></p>
            	<% i=sent.size()-1; 
 	while(i>=0) {
	    Data s=sent.get(i);
	  
	    if(s.accept.equals("rejected")) {
	    
	    out.println(
	    		"<a href='#'>"+"<img src='download.jpg' style='width:170px;height:228px'>"+
	    			"</a>"+
	    			"<button type='button' class='btn btn-success' style='float:right' id='"+ s.email+"' onClick='viewProfile(this.id)'>Profile</button>"+
	    			"<button type=button' class='btn btn-primary'style='float:right' id='"+ s.email+"' >Rejected</button>"+
	    			"<p style='float:right'>"+
	    			"Name : "+s.name+"<br>"+
	    			"Age, Height: " + s.age+ " Yrs, "+ s.height+ "<br>"+
	    			"Religion :"+s.religion+"<br>"+
	    			"Location :"+ s.location+"<br>"+
	    			"</p>"+
	    			"<p><br></p>"
	    	  		
	    	  		
	    	  	
	    		);
	    }
	    
	    i--;
	}
 %>
       	 	</div>
       	 	<div class="content-5"id="content-5">
            	<p>This folder contains all communications that have been Not Replied.	</p>
            	<% i=sent.size()-1; 
 	while(i>=0) {
	    Data s=sent.get(i);
	  
	    if(s.accept.equals("pending")) {
	    
	    out.println(
	    		"<a href='#'>"+"<img src='download.jpg' style='width:170px;height:228px'>"+
	    			"</a>"+
	    			"<button type='button' class='btn btn-success' style='float:right' id='"+ s.email+"' onClick='viewProfile(this.id)'>Profile</button>"+
	    			"<button type=button' class='btn btn-primary'style='float:right' id='"+ s.email+"' onClick='cancelRequest(this.id)'>Request Sent</button>"+
	    			"<p style='float:right'>"+
	    			"Name : "+s.name+"<br>"+
	    			"Age, Height: " + s.age+ " Yrs, "+ s.height+ "<br>"+
	    			"Religion :"+s.religion+"<br>"+
	    			"Location :"+ s.location+"<br>"+
	    			"</p>"+
	    			"<p><br></p>"
	    	  		
	    	  		
	    	  	
	    		);
	    }
	    
	    i--;
	}
 %>
 
       	 	</div>
    	</div>
	</div>
</div>

	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
function acceptRequest(clicked_id){
	
	window.location="request.jsp?email="+clicked_id+"&do=accept";
}
function viewProfile(clicked_id){
	
	window.location="viewprofile.jsp?id="+clicked_id;
}
</script>
</body>

</html>