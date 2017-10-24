<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,block_chainning.UserNotificationBean"%>
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
        <li ><a href="doSearch.jsp">Home</a></li>
        <li class="active"><a href="usernotification.jsp">Notification</a></li>
        <li><a href="transaction.jsp">Transaction</a></li>
        <li><a href="profile.jsp">Profile</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><form action="logout.jsp"><span class="glyphicon glyphicon-log-out" style="color:red;"></span><button class="btn btn-link" style="text-decoration:none;">Logout</button></form></li>
      </ul>
    </div>
  </div>
</nav>
<br>
<br>
<%
	String uid=(String)session.getAttribute("uid");
	session.setAttribute("uid", uid);
	UserNotificationBean unb=UserNotificationBean.getUserNotificationBean();
	unb.setId(uid);
	boolean bb=unb.usernotification();
	ArrayList al=UserNotificationBean.getArrayList();
	ArrayList al1=UserNotificationBean.getArrayList1();
	ArrayList al2=UserNotificationBean.getArrayList2();
	ArrayList al3=UserNotificationBean.getArrayList3();
	Iterator ii=al.iterator();
	Iterator ii1=al1.iterator();
	Iterator ii2=al2.iterator();
	Iterator ii3=al3.iterator();
	if(bb){
		out.println("<div class='well '>");
		out.println("<div class='container text-centre '> <h1>Process Transaction</h1>");

	while(ii.hasNext()&&ii1.hasNext()&&ii3.hasNext()){
		out.println("Your transaction of "+(String)ii3.next()+" priced at &#8377;"+(String)ii.next()+" is processing.<br>");
		out.println("<div class='progress'><div class='progress-bar progress-bar-striped bg-success' role='progressbar' style='width:25%' aria-valuemin='0' aria-valuemax='100'></div></div>");
	}
	out.println("</div></div>");
	}
%>

<br><br>
<div class="well container text-centre">
<p class="text-center">
<u>Sender</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Receiver</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Amount</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<u>Time Of Transaction</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Product</u><br>
<%
	while(ii2.hasNext())
	{
		String s=(String)ii2.next();
		String ss[]=s.split("_");
		out.println("<font color='blue'>"+ss[0]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ss[1]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ss[2]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ss[3]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ss[4]+"<br>");
	}
%>
</p>
</div>