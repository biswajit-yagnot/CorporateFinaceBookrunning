<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,block_chainning.ProfileBean,block_chainning.NotificationBean"%>
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
        <li><a href="transaction.jsp">Transaction</a></li>
        <li class="active"><a href="profile.jsp">Profile</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><form action="logout.jsp"><span class="glyphicon glyphicon-log-out" style="color:red;"></span><button class="btn btn-link" style="text-decoration:none;">Logout</button></form></li>
      </ul>
    </div>
  </div>
</nav>
<br>
<br>
<div class="well container text-centre">
<%
	
	ProfileBean pb=ProfileBean.getProfileBean();
	pb.setId(uid);
	boolean b=pb.profile();
	ArrayList al=ProfileBean.getArrayList();
	Iterator ii=al.iterator();
	if(b)
	{
		while(ii.hasNext())
		{
			String str=(String)ii.next();
			String a[]=str.split("_");
			out.println("<h2><b>Your Transaction ID  :<u><font color='cyan'>"+a[5]+"</font></u></b></h2><br><br><h3><br>");
			out.println("<p class='text-center'><b>Profile-Name  :</b>"+a[1]+"<br>");
			out.println("<b>Profile-ID    :</b>"+a[0]+"<br>");
			out.println("<b>Date Of Birth :</b>"+a[2]+"<br>");
			out.println("<b>Gender        :</b>"+a[3]+"<br>");
			out.println("<b>Account Type  :</b>"+a[4]+" account type</h3>");
		}
		
	}
%>
</p>
</div>
