<%@page import="block_chainning.GetTransactionIdBean"%>
<%@page import="block_chainning.AllTransactionBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="block_chainning.NotificationBean,block_chainning.ProfileBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
%>
<head>
  <title>Corporate transaction</title>
  <meta charset="utf-8">
  <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
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
      <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-eye-open"></span>Quest</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <% 
      ProfileBean pb1=ProfileBean.getProfileBean();
  	pb1.setId(uid);
  	boolean bb=pb1.profile();
  	ArrayList al1=ProfileBean.getArrayList();
  	Iterator ii1=al1.iterator();
  	if(bb)
  	{
  		while(ii1.hasNext()){
  			String str1=(String)ii1.next();
			String b[]=str1.split("_");
			if(b[4].equals("user")){
  		out.println("<li><a href='doSearch.jsp'>Home</a></li>");
        out.println("<li><a href='usernotification.jsp'>Notification</a></li>");
			}
			else{
				NotificationBean nb=NotificationBean.getNotificationBean();
				nb.setId(uid);
				int n=nb.count();
				out.println("<li><a href='shoppage.jsp'>Home</a></li>");
				out.println("<li><a href='notification.jsp'>Notification<sup><font color='red' size='3'>"+n+"</font></sup></a></li>");
			}
  		}
  	} 
        %>
        <li class="active"><a  href="transaction.jsp">Transaction</a></li>
        <li><a href="profile.jsp">Profile</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"style="color:red"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<br>
<br>

<!-- gallery -->
<div class="container" style="width:100%; overflow:auto;">
	<div style="float:left; width:60%;">
		<section>
			<div class="" id="gallery">
				<!--<h2>Gallery<small>Check out the awesome Gallery</small> </h2> -->
			</div>
			
			<div class="carousel slide" id="screenshot-carousel" data-ride="carousel" data-interval="1750">
				<ol class="carousel-indicators">
					<li data-target="#screenshot-carousel" data-slide-to="0" class="active"> </li>
					<li data-target="#screenshot-carousel" data-slide-to="1"> </li>
					<li data-target="#screenshot-carousel" data-slide-to="2"> </li>
					<li data-target="#screenshot-carousel" data-slide-to="3"> </li>
				</ol>
				<div class="carousel-inner">
					<div class="item active" > 
						<img src="dell.jpg" alt="Text for the image">
						<div class="carousel-caption">
							<h3> DELL </h3>
							<p> Hello DELL </p>
							</br>
							
						</div>
					</div>
					<div class="item " > 
						<img src="moto.jpg" alt="Text for the image">
						<div class="carousel-caption">
							<h3> Motorola </h3>
							<p> Hello moto </p>
							</br>
							
						</div>
					</div>
					<div class="item"> 
						<img src="windows.jpg" alt="Text for the image">
						<div class="carousel-caption">
							<h3>Microsoft </h3>
							<p> Windows Product </p> </br>
							
						</div>
					</div>
					<div class="item"> 
						<img src="apple.jpg" alt="Text for the image">
						<div class="carousel-caption">
							<h3> Apple </h3>
							<p> Iphone X </p>
							</br>
							
						</div>
					</div>
					
				</div><!-- End Carousel inner-->
				<a href="#screenshot-carousel" class="left carousel-control" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"> </span>
				</a>
				<a href="#screenshot-carousel" class="right carousel-control" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"> </span>
				</a>
			</div><!-- end carousel -->
			
		</section>
		
	</div>
	
	<div class=" well" style="float:left; width:40%;">
		<h1> Transaction</h1>
		<table>
		<tr><td><b><u>ID</u></b></td><td><b><u>Time</u></b></td><td>&nbsp;&nbsp;&nbsp;<b><u>Product</u></b></td></tr>
		<br>
		<%
			AllTransactionBean alb=AllTransactionBean.getAllTransactionBean();
			ArrayList al=AllTransactionBean.getArrayList();
			boolean b=alb.transaction();
			GetTransactionIdBean gb=GetTransactionIdBean.getGetTransactionIdBean();
			/* ArrayList a=GetTransactionIdBean.getArrayList(); */
			if(b)
			{
				Iterator ii=al.iterator();
				while(ii.hasNext()){
					String s=(String)ii.next();
					String r="";
					String str[]=s.split("_");
					String tod=str[4];
					gb.setId(tod);
					boolean d=gb.gettransaction();
					String t=gb.getTId();
					String tid[]=t.split("_");
					out.println("<tr><td>");
					for(int y=0;y<tid.length;y++){
					out.println("<textarea disabled='disabled' style='resize:none; width:43px; height: 27px;'>"+tid[y]+"</textarea>");
					}
					out.println("</td><td>"+str[2]+"</td><td>&nbsp;&nbsp;&nbsp;"+str[3]+"</td></tr>");
				}
				out.println("</table>");
			}
			
		%>
		</div>
</div>