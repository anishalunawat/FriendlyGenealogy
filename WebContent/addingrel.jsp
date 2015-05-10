<!-- anishaguiupdated -->
<%@ page import="model.*" language="java" contentType="text/html; charset=ISO-8859-1" import="javax.servlet.http.HttpServletResponse"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String mailid=request.getParameter("mailid");
        String rel=request.getParameter("relation");
        
        HttpSession sss=request.getSession();
 		String eid=(String)sss.getAttribute("eid");
 		System.out.println("hahaha");
 		System.out.println(fname);
 		System.out.println(eid);
 		System.out.println(rel);
 		
 		ConnectionWithPerson conwithper= new ConnectionWithPerson();
 		if(rel.equals("father")){
        	conwithper.addFather(eid,fname,lname,mailid);
        	System.out.println(fname+"i am in addingrel");
        	response.sendRedirect("editing.jsp");
 		}
 		else if(rel.equals("mother")){
        	conwithper.addMother(eid,fname,lname,mailid);
        	System.out.println(fname+"i am in addingrel");
        	response.sendRedirect("editing.jsp");
 		}
 		else if(rel.equals("spouse")){
 			System.out.println(fname+"i am in addingrel");
        	conwithper.addSpouse(eid,fname,lname,mailid);
        	System.out.println(fname+"i am in addingrel");
        	response.sendRedirect("editing.jsp");
 		}
 		else if(rel.equals("child")){
 			System.out.println(fname+"i am in addingrel");
        	conwithper.addChildren(eid,fname,lname,mailid);
        	System.out.println(fname+"i am in addingrel");
        	response.sendRedirect("editing.jsp");
 		}
 		else if(rel.equals("brother")){
 			System.out.println(fname+"i am in addingrel");
        	conwithper.addBrother(eid,mailid,lname,fname);
        	System.out.println(fname+"i am in addingrel");
        	response.sendRedirect("editing.jsp");
 		}
 		else if(rel.equals("sister")){
 			System.out.println(fname+"i am in addingrel");
        	conwithper.addSister(eid,mailid,lname,fname);
        	System.out.println(fname+"i am in addingrel");
        	response.sendRedirect("editing.jsp");
 		}
 		else if(rel.equals("friend")){
 			System.out.println(fname+"i am in addingrel");
        	conwithper.addFriend(eid,mailid,lname,fname);
        	System.out.println(fname+"i am in addingrel");
        	response.sendRedirect("editing.jsp");
 		}
%>
</body>
</html>