<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="block_chainning.blockcontroller,block_chainning.LoginBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
          	String id=request.getParameter("uid");
			String pass=request.getParameter("upassword");
			int i;
			LoginBean lb=LoginBean.getLoginBean(); 
			lb.setId(id);
			lb.setPass(pass);
			i=blockcontroller.Login();
			if(i==1)
			{
				session.setAttribute("uid",id);
				RequestDispatcher rd=request.getRequestDispatcher("/doSearch.jsp");
				rd.forward(request,response);
			}
			else if(i==2)
			{
				session.setAttribute("uid",id);
				RequestDispatcher rd=request.getRequestDispatcher("/shoppage.jsp");
				rd.forward(request,response);
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
				rd.include(request,response);
			}
%>
			