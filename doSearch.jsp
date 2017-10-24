<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,block_chainning.blockcontroller,block_chainning.ViewBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
%>
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
      width: 100%; /* Set width to 100% */
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
        <li class="active"><a href="doSearch.jsp">Home</a></li>
        <li><a href="usernotification.jsp">Notification</a></li>
        <li><a href="transaction.jsp">Transaction</a></li>
        <li><a href="profile.jsp">Profile</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><form action="logout.jsp"><span class="glyphicon glyphicon-log-out" style="color:red;"></span><button class="btn btn-link" style="text-decoration:none;">Logout</button></form></li>
      </ul>
    </div>
  </div>
</nav>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>
	<!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="dell.jpg" alt="DELL">
    </div>

    <div class="item">
      <img src="apple.jpg" alt="Apple">
    </div>
    <div class="item">
      <img src="moto.jpg" alt="Motorola">
    </div>
    <div class="item">
      <img src="windows.jpg" alt="Microsoft">
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
</div><br><br>
<%
			boolean bb=false;	
			ViewBean vb=ViewBean.getViewBean(); 
			bb=blockcontroller.Search();
			ArrayList al=ViewBean.getArrayList();
			int size1=al.size();
			ArrayList al1=ViewBean.getArrayList1();
			String rid1=null;
			int j=0,i=1;
			out.println("<form action='doView.jsp'><center>");
			if(bb)
			{
				ListIterator li=al.listIterator();
				ListIterator li1=al1.listIterator();
				while(li.hasNext()&& li1.hasNext())
				{	
					String s2=(String)li1.next();	
					String s1=(String)li.next();
					out.println("<img src='image_"+i+".jpg' align='middle' width='150' height='150' style='float:center'>&nbsp;&nbsp;&nbsp;&nbsp;<button name='buttn' class='btn btn-link' height='20' width='20' value="+j+">"+s2+"</button></font><br><br>");
					j++;
					i++;
				}
			}
			out.println("</center></form>");
%>