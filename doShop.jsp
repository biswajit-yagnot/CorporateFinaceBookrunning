<%@page import="block_chainning.SellerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String uid=(String)session.getAttribute("uid");
session.setAttribute("uid", uid);
String pname=request.getParameter("pname");
String cost=request.getParameter("cost");
SellerBean sb=SellerBean.getSellerBean();
sb.setPname(pname);
sb.setCost(cost);
sb.setId(uid);
boolean bb=sb.store();
if(bb)
{
	RequestDispatcher rd=request.getRequestDispatcher("/shoppage.jsp");
	rd.forward(request,response);
}
%>