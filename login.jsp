<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome To Vision Quest</title>
<script>
function validateRegForm2()
{
var regname7=document.log.logUserName.value;
if(regname7==null || regname7=="")
{
	alert("User name can't be blank")
	document.log.logUserName.focus(); 
	return false;
}
var regname8=document.log.logPassword.value;
if(regname8==null || regname8=="")
{
	alert("Password can't be blank")
	document.log.logPassword.focus(); 
	return false;
}
}
function validateRegForm1()
{
var regname3=document.regis.rfname.value;
if(regname3==null || regname3=="")
{
	alert("First name can't be blank")
	document.regis.rfname.focus(); 
	return false;
}
var regname4=document.regis.rsname.value;
if(regname4==null || regname4=="")
{
	alert("Surname can't be blank")
	document.regis.rsname.focus(); 
	return false;
}
var regname5=document.regis.remail.value;
if(regname5==null || regname5=="")
{
	alert("Email can't be blank")
	document.regis.remail.focus(); 
	return false;
}
var regname1=document.regis.pass.value;
if(regname1==null || regname1=="")
{
	alert("Password can't be blank")
	document.regis.pass.focus(); 
	return false;
}
var regname2=document.regis.repass.value;
if(regname2==null || regname2=="")
{
	alert("Please Re-enter your password.")
	document.regis.repass.focus(); 
	return false;
}
if(regname1!=regname2)
{
	alert("Your password is not matched.");
	document.regis.repass.focus();
	return false;
}
var regname6=document.regis.rdob.value;
if(regname6==null || regname6=="")
{
	alert("Date of Birth can't be blank")
	document.regis.rdob.focus(); 
	return false;
}
}
</script>
<style>
#First
{
background-image:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9oIO444AO_f-bl0GAwJnm56rNdfo9zEdU0iMim7hHyMxWkSxK");
background-repeat:no-repeat;
background-size:2055px 225px;
}
#Second
{
background-image:url("http://blog.unibulmerchantservices.com/wp-content/uploads/2010/01/E-Commerce-Transaction-Settlement1.jpg");
background-repeat:no-repeat;
background-size:2055px 825px;
margin:none;
}
.button
{
background-color:#228B22;
border:none;
text-align:center;
text:decoration:none;
display:inline-block;
font-size:16px;
margin:4px 2px;
cursor:pointer;
}
.button1{
border-radius: 8px;
padding:14px 40px;
}
.normal
{
margin-left:900px;
}
.one
{
border:30px;
border-radius:5px;
background-color:white;
height:40px;
text-align:center;
}
.normal1
{
margin-left:850px;
}
.button5 {border-radius: 50%;
	background-color:yellow;
}
</style>
</head>
<body bgcolor="#e3e3e3">
<div id="First">
<div class="normal">
<form name="log" action="doLogin.jsp" onsubmit="return validateRegForm2();">
<table cellpadding="5" cellspacing="5">
<tr>
<td><label><b><font color="white"> Phone</font></b></label></td>
<td><label><b><font color="white">Password</font></b></label></td>
<td></td>
</tr>
<tr>
<td><input type="text" name="uid"></td>
<td><input type="password" name="upassword"></td>
<td><input type="submit" value="Log In"></td>
</tr>
<tr>
<td></td>

</table>
</form>
</div>
</div>
<div  id="Second">
<div class="normal1"><font color="black">
<h1>Create a new account</h1>
<h3>It's free and always will be.</h3>
<form name="regis" action="doRegister.jsp" onsubmit="return validateRegForm1();" method="post">
<table cellspacing="10" cellpadding="10">
<tr>
<td><input type="text" placeholder="First name" class="one" name="rfname"></td>
<td><input type="text" placeholder="Surname" class="one" name="rsname"></td>
</tr>
</table>
<font size="30">
<table cellspacing="10" cellpadding="10">
<tr>
<td><input type="text" placeholder="Mobile number" class="one" size="50" name="remail"></td>
</tr>
<tr>
<td><input type="password" placeholder="New password" class="one" size="50" name="pass"></td>
</tr>
<tr>
<tr>
<td><input type="password" placeholder="Confirm password" class="one" size="50" name="repass"></td>
</tr>
<tr>
<td><input type="text" placeholder="Date Of Birth(DD/MM/YYYY)" class="one" size="50" name="rdob"></td>
</tr>
<tr>
<td><font size="3"><b><input type="radio" name="rgender" value="female"checked>Female &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="rgender" value="male">Male</b></font></td>
</tr>
<td><font size="3"><b><input type="radio" name="rtype" value="user"checked>Buyer &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="rtype" value="shop">Shopkeeper</b></font></td>
</tr>

</table></font>
<b>By clicking Create Account, you agree to our Terms and confirm<br>that you have read our Data Policy, including our Cookie Use<br>Policy. You may receive SMS message notifications from<br>Vision Quest and can opt out at any time.  
</b><br>
<button class="button button1"><font color="white">Create Account</font></button>
<br><b>________________________________________________________________</b><br>
</font>
</div>
<br><br><br><br>
</div>
</form>
</body>
</html>