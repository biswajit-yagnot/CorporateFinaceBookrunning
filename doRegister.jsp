<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="block_chainning.RegisterBean,block_chainning.blockcontroller"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
				String fname=request.getParameter("rfname");
				String lname=request.getParameter("rsname");
				String id=request.getParameter("remail");
				String pass=request.getParameter("pass");
				String dob=request.getParameter("rdob");
				String gender=request.getParameter("rgender");
				String type=request.getParameter("rtype");
				boolean b=false;
				RegisterBean rb=RegisterBean.getRegisterBean();
				rb.setFname(fname);
				rb.setLname(lname);
				rb.setId(id);
				rb.setNewpass(pass);
				rb.setDob(dob);
				rb.setGender(gender);
				rb.setType(type);
				b=blockcontroller.Register();
				if(b)
				{
					RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
					rd.forward(request, response);
				}
				else{
					out.println("<center><font color='red'>Sorry Register again</font></center>");
					RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
				    rd.include(request,response);
				}
%>
				