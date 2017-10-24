<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,block_chainning.ViewBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
int value=Integer.parseInt(request.getParameter("buttn"));
ViewBean vb=ViewBean.getViewBean();
ArrayList al=ViewBean.getArrayList();
ArrayList al1=ViewBean.getArrayList1();
ArrayList al2=ViewBean.getArrayList2();
ArrayList al3=ViewBean.getArrayList3();
int i=value+1;
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
      <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-eye-open"></span><b>Quest</b></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="doSearch.jsp">Home</a></li>
        <li><a href="usernotification.jsp">Notification</a></li>
        <li><a href="transaction.jsp">Transaction</a></li>
        <li><a href="profile.jsp">Profile</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><form action="logout.jsp"><span class="glyphicon glyphicon-log-out"style="color:red"></span><button class="btn btn-link" style="text-decoration:none;">Logout</button></form></li>
      </ul>
    </div>
  </div>
</nav>
<br>
<br>

<div class="col-md-9">

                    <div class="row" id="productMain">
                        <div class="col-sm-6">
                            <div id="mainImage">
                              <%
                              out.println("<img src='image_"+i+".jpg' class='img-responsive'>");
                              %>  
                            </div>

                            

                        </div>
                        <div class="col-sm-6">
                            <div class="box">
                               <p class="text-center"><font size="6" face="sans-serif">
                               <%
	out.println("Product ID:-"+(String)al.get(value)+"<br>");
	out.println("Product-Name:-"+(String)al1.get(value)+"<br>");
	out.println("Seller Id:-"+(String)al2.get(value)+"<br>");
	out.println("Price:-&#8377;"+(String)al3.get(value)+"<br></font></p>");
	out.println("<form action='payment.jsp'>");
	%>	
    <p class="text-center buttons">
    <%
   		out.println("<button class='btn btn-warning' name='buttn1' value='"+al2.get(value)+"_"+al3.get(value)+"_"+al1.get(value)+"'><span class='glyphicon glyphicon-shopping-cart'>Buy</span></button></form>");
    %>
</p>
</div>
