<%@page import="java.util.IdentityHashMap"%>
<%@page import="block_chainning.TransactionBean,java.util.*,block_chainning.blockcontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	boolean bb=false;
	String uid=(String)session.getAttribute("uid");
	session.setAttribute("uid", uid);
	String s=(String)request.getParameter("buttn1");
	String str[]=s.split("_");
	TransactionBean lb=TransactionBean.getTransactionBean();
	lb.setId(uid);
	lb.setRid(str[0]);
	lb.setPrice(str[1]);
	lb.setProduct(str[2]);
	bb=blockcontroller.Transaction();
	ArrayList ih=TransactionBean.getArrayList();
	Iterator ii=ih.iterator();
	String s1="";
	if(bb){
	while(ii.hasNext())
	{
		s1=(String)ii.next();
	}
	IdentityHashMap hm=new IdentityHashMap();
	hm.put(s1, "");
	boolean b=lb.check(hm);
	if(b){
		session.setAttribute("uid", uid);
		RequestDispatcher rd=request.getRequestDispatcher("/doSearch.jsp");
		rd.forward(request,response);
	}
	}
%>