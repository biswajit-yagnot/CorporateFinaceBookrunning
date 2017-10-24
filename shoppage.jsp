<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="block_chainning.NotificationBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Corporate transaction</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    

    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
       /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
.one{
background-image:url("bqamzuyze62a4m_kt9fzwuxdz4ceokk0.jpg");
width:1250px;
height:550px;
}
  </style>
  <script>
function validateRegForm2()
{
var regname7=document.log.pname.value;
if(regname7==null || regname7=="")
{
	alert("Product name can't be blank")
	document.log.pname.focus(); 
	return false;
}
var regname8=document.log.cost.value;
if(regname8==null || regname8=="")
{
	alert("Cost can't be blank")
	document.log.cost.focus(); 
	return false;
}
}
</script>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-eye-open"></span><b>Quest</b></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<%
						String uid=(String)session.getAttribute("uid");
						session.setAttribute("uid", uid);
						NotificationBean nb=NotificationBean.getNotificationBean();
						nb.setId(uid);
						int n=nb.count();
						out.println("<li><a href='notification.jsp'>Notification<sup><font color='red' size='3'>"+n+"</font></sup></a></li>");
					%>
					<li><a href="transaction.jsp">Transaction</a></li>
					<li><a href="profile.jsp">Profile</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><form action="logout.jsp"><span class="glyphicon glyphicon-log-out" style="color:red;"></span><button class="btn btn-link" style="text-decoration:none;">Logout</button></form></li>
				</ul>
			</div>
		</div>
	</nav>
		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="1750">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				
			</ol>

			<!-- Wrapper for slides -->
			
		<div class="carousel-inner">
			
			<div class="item active" > 
						<img src="dell.jpg" alt="Text for the image">
						<div class="carousel-caption">
							<h3> DELL </h3>
							<p> Hello DELL </p>
							</br>
							
						</div>
					</div>
			<div class="item">
				<img src="moto.jpg" alt="MOTOROLA">
			</div>

			<div class="item">
				<img src="apple.jpg" alt="APPLE">
			</div>
			<div class="item">
				<img src="windows.jpg" alt="MICROSOFT">
			</div>
			
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	
	<!-- jumbotron -->
	<div class="container jumbotron">
		<section>
		<div class="page-header">
		<div class="col-lg-8  panel panel-default panel-body">
					<form name="log" action="doShop.jsp" class="form-horizontal" onsubmit="return validateRegForm2();">
						<div class="form-group">
							<label for="user-name" class="col-lg-2 control-label">Product			
							</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="user-name" placeholder="Enter the product name" name="pname">
							</div>
						</div> <!-- end of form group panel -->
						
						<div class="form-group">
							<label for="user-email" class="col-lg-2 control-label">Cost			
							</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="user-email" name="cost" placeholder="&#8377 0.00">
							</div>
						</div> <!-- end of form group panel -->
						
						
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2" >
								<button type="submit" class="btn btn-primary" > Submit </button>
							</div>
						</div>
						
						
					</form> <!-- end of form -->
				</div>
		</section>
		</div>
	</div>
</body>
</html>