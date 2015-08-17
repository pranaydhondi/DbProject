<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.Login"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Login user = (Login) session.getAttribute("object"); 
if(user==null)response.sendRedirect("/Matrimony/index.jsp");
String details = user.get_info();
String[] components = details.split(":");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>info details</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/style.css">
<style>
h4,h2{
 	font-family: Times New Roman;
 	color:#5F9FFF;
 	
 }
 tr{
 
 	border-bottom-style:grove ;
 	
 }


</style>
<script type="text/javascript">
function allocateValues(){
	<% String s1="document.getElementById('Email').value='"+components[1]+"';";
	out.println(s1);
	s1 = "document.getElementById('name').value='"+components[0]+"';";
	out.println(s1);
	s1="document.getElementById('register_by').value='"+components[2]+"';";
	out.println(s1);
	s1="document.getElementById('RELIGION').value='"+components[5]+"';";
	out.println(s1);
	if(components[6]== components[6]){
		s1="document.getElementById('zodiac').value='"+components[6]+"';";
		out.println(s1);
	}
	if(components[7]== components[7]){
		s1="document.getElementById('year').value='"+components[7]+"';";
		out.println(s1);
	}
	if(components[8]==components[8]){
		s1="document.getElementById('month').value='"+components[8]+"';";
		out.println(s1);
	}
	if(components[9]==components[9]){
		s1="document.getElementById('day').value='"+components[9]+"';";
		out.println(s1);
	}
	if(components[10]==components[10]){
		s1="document.getElementById('height').value='"+components[10]+"';";
		out.println(s1);
	}
	if(components[11]==components[11]){
		s1="document.getElementById('weight').value='"+components[11]+"';";
		out.println(s1);
	}
	if(components[12]==components[12]){
		s1="document.getElementById('marriage_status').value='"+components[12]+"';";
		out.println(s1);
	}
	if(components[13]==components[13]){
		s1="document.getElementById('btype').value='"+components[13]+"';";
		out.println(s1);
	}
	if(components[14]==components[14]){
		s1="document.getElementById('ctype').value='"+components[14]+"';";
		out.println(s1);
	} 
	if(components[15]==components[15]){
		s1="document.getElementById('pstatus').value='"+components[15]+"';";
		out.println(s1);
	}if(components[16]==components[16]){
		s1="document.getElementById('ehabit').value='"+components[16]+"';";
		out.println(s1);
	} 
	if(components[17]==components[17]){
		s1="document.getElementById('dhabit').value='"+components[17]+"';";
		out.println(s1);
	}
	if(components[18]==components[18]){
		s1="document.getElementById('shabit').value='"+components[18]+"';";
		out.println(s1);
	}
	if(components[19]==components[19]){
		s1="document.getElementById('state').value='"+components[19]+"';";
		out.println(s1);
	}
	if(components[20]==components[20]){
		s1="document.getElementById('city').value='"+components[20]+"';";
		out.println(s1);
	}
	%>
}
</script>
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
<h2> Enter your details below</h2>
<form method="post" action="Login">
<table> 
<tr><td>
<h4>Name:</h4> </td><td>
<input type="text" name="name"  id="name" placeholder="Type your name here " required ></td></tr>
<tr><td>
<h4>Email id:</h4> </td><td>
<input type="text" name="emailid" id="Email" value="" readonly></td></tr>
<tr><td>
<h4>Profile Created for :</h4></td><td>
<SELECT name="register_by" id="register_by">
	 <option value="2">Myself</option>
	 <option value="3">Son</option>
	 <option value="4">Daughter</option>
	 <option value="5">Brother</option>
	 <option value="6">Sister</option>
	 <option value="7">Relative</option>
	 <option value="8">Friend</option>
</SELECT>
</td></tr>
<tr><td>
<h4>Religion : </h4></td><td>
	<select  name="RELIGION" id="RELIGION">
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
	</select>
</td></tr>
<tr><td>
<h4>Zodiac/star sign :</h4></td><td>
<select name="zodiac" id="zodiac">
<option value="Aries">Aries</option>
<option value="Taurus">Taurus</option>
<option value="Gemini">Gemini</option>
<option value="Cancer">Cancer</option>
<option value="Leo">Leo</option>
<option value="Virgo">Virgo</option>
<option value="Libra">Libra</option>
<option value="Scorpio">Scorpio</option>
<option value="Sagittarius">Sagittarius</option>
<option value="Capricorn">Capricorn</option>
<option value="Aquarius">Aquarius</option>
<option value="Pisces">Aries</option>
</select>
</td></tr>
<tr><td>
<h4>Date of Birth :</h4></td><td>
<select name="date" id="day" >		
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
<option value=13>13</option>
<option value=14>14</option>
<option value=15>15</option>
<option value=16>16</option>
<option value=17>17</option>
<option value=18>18</option>
<option value=19>19</option>
<option value=20>20</option>
<option value=21>21</option>
<option value=22>22</option>
<option value=23>23</option>
<option value=24>24</option>
<option value=25>25</option>
<option value=26>26</option>
<option value=27>27</option>
<option value=28>28</option>
<option value=29>29</option>
<option value=30>30</option>
<option value=31>31</option>
</td><td>
</select>
<select name="month" id="month" onchange="datacheck()">
<option value=1>Jan</option>
<option value=2>Feb</option>
<option value=3>Mar</option>
<option value=4>April</option>
<option value=5>May</option>
<option value=6>Jun</option>
<option value=7>Jul</option>
<option value=8>Aug</option>
<option value=9>Sep</option>
<option value=10>Oct</option>
<option value=11>Nov</option>
<option value=12>Dec</option>
</select>
</td><td>
<select name="year" id="year" onChange="datacheck()">
<option value=1934>1934</option>
<option value=1935>1935</option>
<option value=1936>1936</option>
<option value=1937>1937</option>
<option value=1938>1938</option>
<option value=1939>1939</option>
<option value=1940>1940</option>
<option value=1941>1941</option>
<option value=1942>1942</option>
<option value=1943>1943</option>
<option value=1944>1944</option>
<option value=1945>1945</option>
<option value=1946>1946</option>
<option value=1947>1947</option>
<option value=1948>1948</option>
<option value=1949>1949</option>
<option value=1950>1950</option>
<option value=1951>1951</option>
<option value=1952>1952</option>
<option value=1953>1953</option>
<option value=1954>1954</option>
<option value=1955>1955</option>
<option value=1956>1956</option>
<option value=1957>1957</option>
<option value=1958>1958</option>
<option value=1959>1959</option>
<option value=1960>1960</option>
<option value=1961>1961</option>
<option value=1962>1962</option>
<option value=1963>1963</option>
<option value=1964>1964</option>
<option value=1965>1965</option>
<option value=1966>1966</option>
<option value=1967>1967</option>
<option value=1968>1968</option>
<option value=1969>1969</option>
<option value=1970>1970</option>
<option value=1971>1971</option>
<option value=1972>1972</option>
<option value=1973>1973</option>
<option value=1974>1974</option>
<option value=1975>1975</option>
<option value=1976>1976</option>
<option value=1977>1977</option>
<option value=1978>1978</option>
<option value=1979>1979</option>
<option value=1980>1980</option>
<option value=1981>1981</option>
<option value=1982>1982</option>
<option value=1983>1983</option>
<option value=1984>1984</option>
<option value=1985>1985</option>
<option value=1986>1986</option>
<option value=1987>1987</option>
<option value=1988>1988</option>
<option value=1989>1989</option>
<option value=1990>1990</option>
<option value=1991>1991</option>
<option value=1992>1992</option>
<option value=1993>1993</option>
<option value=1994>1994</option>
<option value=1995>1995</option>
<option value=1996>1996</option>
</select>
</td></tr>

<script >
function datacheck(){
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;
	var dayid=document.getElementById("day");
	
        if(year % 4 == 0)
        {
            if(month==2){
            	dayid.options[28].disabled = false;
            	dayid.options[29].disabled = true;
            	dayid.options[30].disabled = true;
            	
            }
            else if(month % 2 ==0){
            	dayid.options[28].disabled = false;
            	dayid.options[29].disabled = false;
            	dayid.options[30].disabled = true;
            }else{
            	dayid.options[28].disabled = false;
            	dayid.options[29].disabled = false;
            	dayid.options[30].disabled = false;
        	}
        }
        else
        {
            if(month==2){
           	dayid.options[28].disabled = true;
            	dayid.options[29].disabled = true;
            	dayid.options[30].disabled = true;
            	
            }
            else if((month<=7 && month % 2 ==0) || (month>7 && month % 2 !=0) ){
            	dayid.options[28].disabled = false;
            	dayid.options[29].disabled = false;
            	dayid.options[30].disabled = true;
            }else{
            	dayid.options[28].disabled = false;
            	dayid.options[29].disabled = false;
            	dayid.options[30].disabled = false;
        	} 
        }
}
</script>
<tr><td>
<h4>Height(in ft/inches):</h4></td><td>
<select name="height" id='height'>
<option value="1"> 4ft 6in </option>
<option value="2"> 4ft 7in </option>
<option value="3"> 4ft 8in </option> 
<option value="4"> 4ft 9in </option>
<option value="5"> 4ft 10in </option>
<option value="6"> 4ft 11in </option>
<option value="7"> 5ft </option>
<option value="8"> 5ft 1in </option>
<option value="9"> 5ft 2in </option>
<option value="10"> 5ft 3in </option>
<option value="11"> 5ft 4in </option>
<option value="12"> 5ft 5in </option>
<option value="13"> 5ft 6in </option>
<option value="14"> 5ft 7in </option>
<option value="15"> 5ft 8in </option> 
<option value="16"> 5ft 9in </option>
<option value="17"> 5ft 10in </option>
<option value="18"> 5ft 11in </option>
<option value="19"> 6ft </option>
<option value="20"> 6ft 1in </option>
<option value="21"> 6ft 2in </option>
<option value="22"> 6ft 3in </option>
<option value="23"> 6ft 4in </option>
<option value="24"> 6ft 5in </option>
<option value="25"> 6ft 6in </option>
<option value="26"> 6ft 7in </option>
<option value="27"> 6ft 8in </option> 
<option value="28"> 6ft 9in </option>
<option value="29"> 6ft 10in </option>
<option value="30"> 6ft 11in </option>
<option value="31"> 7ft </option>
</select>
</td></tr>
<tr><td>
<h4>Weight(in kgs):</h4></td><td>
<select name="weight" id="weight">
<option value=57>57</option>
<option value=58>58</option>
<option value=59>59</option>
<option value=60>60</option>
<option value=61>61</option>
<option value=62>62</option>
<option value=63>63</option>
<option value=64>64</option>
<option value=65>65</option>
<option value=66>66</option>
<option value=67>67</option>
<option value=68>68</option>
<option value=69>69</option>
<option value=70>70</option>
<option value=71>71</option>
<option value=72>72</option>
<option value=73>73</option>
<option value=74>74</option>
<option value=75>75</option>
<option value=76>76</option>
<option value=77>77</option>
<option value=78>78</option>
<option value=79>79</option>
<option value=80>80</option>
<option value=81>81</option>
<option value=82>82</option>
<option value=83>83</option>
<option value=84>84</option>
<option value=85>85</option>
<option value=86>86</option>
<option value=87>87</option>
<option value=88>88</option>
<option value=89>89</option>
<option value=90>90</option>
<option value=91>91</option>
<option value=92>92</option>
<option value=93>93</option>
<option value=94>94</option>
<option value=95>95</option>
<option value=96>96</option>
<option value=97>97</option>
<option value=98>98</option>
<option value=99>99</option>
<option value=100>100</option>
<option value=101>101</option>
<option value=102>102</option>
<option value=103>103</option>
<option value=104>104</option>
<option value=105>105</option>
<option value=106>106</option>
<option value=107>107</option>
<option value=108>108</option>
<option value=109>109</option>
<option value=110>110</option>
<option value=111>111</option>
<option value=112>112</option>
<option value=113>113</option>
<option value=114>114</option>
<option value=115>115</option>
<option value=116>116</option>
<option value=117>117</option>
<option value=118>118</option>
<option value=119>119</option>
<option value=120>120</option>
<option value=121>121</option>
<option value=122>122</option>
<option value=123>123</option>
<option value=124>124</option>
<option value=125>125</option>
<option value=126>126</option>
<option value=127>127</option>
<option value=128>128</option>
<option value=129>129</option>
<option value=130>130</option>
<option value=131>131</option>
<option value=132>132</option>
<option value=133>133</option>
<option value=134>134</option>
<option value=135>135</option>
<option value=136>136</option>
<option value=137>137</option>
<option value=138>138</option>
<option value=139>139</option>
<option value=140>140</option>
<option value=141>141</option>
<option value=142>142</option>
<option value=143>143</option>
<option value=144>144</option>
<option value=145>145</option>
<option value=146>146</option>
<option value=147>147</option>
<option value=148>148</option>
<option value=149>149</option>
</select></td></tr>
<tr><td>
<h4>Marital Status:</h4></td><td>
<select name="marrial_status" id="marriage_status">
<option value="1">Never Married</option>
<option value="2">Widower</option>
<option value="4">Divorced</option>
<option value="8">Awaiting Divorce</option>
</select>
</select></td></tr>
<tr><td>
<h4>Body Type :</h4></td><td> 
<select name="body_type" id="btype">
<option value="Slim">Slim</option>
<option value="Athletic">Athletic</option>
<option value="Average">Average</option>
<option value="Heavy">Heavy</option>
</select></td></tr>
<tr><td>
<h4>Complexion:</h4></td><td>
<select name="complexation" id="ctype">
<option value ="veryfair">veryfair</option>
<option value ="fair">fair</option>
<option value ="Wheatish">Wheatish</option>
<option value ="Wheatish Brown">Wheatish Brown</option>
<option value ="Dark">Dark</option>
</select></td></tr>
<tr><td>
<h4>Physical Status:</h4></td><td>
<select name="pstatus" id="pstatus">
<option  value="Normal">Normal</option>
<option  value="physically challenged">physically challenged</option>
</select>
</td></tr>
<tr><td>
<h4>Eating habits :</h4></td><td>
<select name="ehabit" id="ehabit">
<option value="1">Vegetarian</option>
<option value="2">Non Vegetarian</option>
<option value="4">Eggetarian</option>
</select>
</td></tr>
<tr><td>
<h4>Drinking Habits:</h4></td><td> 
<select name="dhabit" id="dhabit">
	<option value="1">No</option>
	<option value="2">Occasionally</option>
	<option value="4">Yes</option>
</select>
</td></tr>
<tr><td>
<h4>Smoking Habits:</h4></td><td>
<select name="shabit" id="shabit">
	<option value="1">No</option>
	<option value="2">Occasionally</option>
	<option value="4">Yes</option>
</select>
</td></tr>


<tr id="state">
</tr>

<tr><td>
<h4>City:</h4></td><td>
<input type="text" name="city" id="city" required>
	</td></tr>
<tr>
	<td></td>
	<td>
	
<input name="form_name" value="info" hidden></td><td>
<button class="btn btn-primary " type="submit">Submit</button> 

</td>
<td></td>

<tr>
</form>
</table>
</center>
<script>
function changeStates(){
	var s; 
	if(<%if(components[5].equals("98"))out.println("true");
			else out.println("false"); %>){
		s = "<td><h4>State:</h4> </td><select name='state'>"+"<option value='Andhra Pradesh'>Andhra Pradesh</option>"+
		"<option value='Arunachal Pradesh'>Arunachal Pradesh</option>"+
		"<option value='Assam'>Assam</option>"+
		"<option value='Bihar'>Bihar</option>"+
		"<option value='Chhattisgarh'>Chhattisgarh</option>"+
		"<option value='Goa'>Goa</option>"+
		"<option value='Gujarat'>Gujarat</option>"+
		"<option value='Haryana'>Haryana</option>"+
		"<option value='Himachal Pradesh'>Himachal Pradesh</option>"+
		"<option value='Jammu and Kashmir'> Jammu and Kashmir</option>"+
		"<option value='Jharkhand'>Jharkhand</option>"+
		"<option value='Karnataka'>Karnataka</option>"+
		"<option value='Kerala'>Kerala</option>"+
		"<option value='Madhya Pradesh'>Madhya Pradesh</option>"+
		"<option value='Maharashtra'>Maharashtra</option>"+
		"<option value='Manipur'>Manipur</option>"+
		"<option value='Meghalaya'>Meghalaya</option>"+
		"<option value='Mizoram'>Mizoram</option>"+
		"<option value='Nagaland'>Nagaland</option>"+
		"<option value='Odisha'>Odisha</option>"+
		"<option value='Punjab'>Punjab</option>"+
		"<option value='Rajasthan'>Rajasthan</option>"+
		"<option value='Sikkim'>Sikkim</option>"+
		"<option value='Tamil Nadu'>Tamil Nadu</option>"+
		"<option value='Telangana'>Telangana</option>"+
		"<option value='Tripura'>Tripura</option>"+
		"<option value='Uttar Pradesh'>Uttar Pradesh</option>"+
		"<option value='Uttarakhand'>Uttarakhand</option>"+
		"<option value='West Bengal'>West Bengal</option>"+
		"<option value='Union Territories'>Union Territories</option>"+
		"</select></td>";
		
		document.getElementById("state").innerHTML=s;
	}else {
	s="state :<input name='state' hint='type state here' required>";
	document.getElementById("state").innerHTML=s;
	}
	
}
changeStates();
allocateValues();
</script>
</div>
</body>
</html>
