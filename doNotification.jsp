<%@page import="block_chainning.UpdateBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String uid=(String)session.getAttribute("uid");
	session.setAttribute("uid", uid);
	String btnid=request.getParameter("bttn3");
	String btnid1=request.getParameter("bttn4");
	if(btnid.length()>0){
		
		UpdateBean ub=UpdateBean.getUpdateBean();
		ub.setValue(btnid);
		ub.setId(uid);
		boolean bb=ub.updateyesaccount();
		if(bb){
			RequestDispatcher rd=request.getRequestDispatcher("/transaction.jsp");
			rd.forward(request,response);
		}
	}
	else{
		UpdateBean ub=UpdateBean.getUpdateBean();
		ub.setValue(btnid1);
		ub.setId(uid);
		boolean bb=ub.updatenoaccount();
		if(bb){
			RequestDispatcher rd=request.getRequestDispatcher("/profile.jsp");
			rd.forward(request,response);
		}
	}
%>