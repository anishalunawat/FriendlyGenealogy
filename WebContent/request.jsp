<%@ page import="model.*" language="java" contentType="text/html; charset=ISO-8859-1" import="javax.servlet.http.HttpServletResponse"
    pageEncoding="ISO-8859-1"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
			HttpSession sss=request.getSession();
			String eid=(String)sss.getAttribute("eid");
			
			String button = request.getParameter("accept");
			String email = request.getParameter("email");
			String relation = request.getParameter("relation");
			
			
			ConnectionWithPerson conwithper= new ConnectionWithPerson();
			if(button.equalsIgnoreCase("accept")){
				if(relation.equals("child")){
					conwithper.acceptRequest(eid, email, relation);
					System.out.println("congratulations");
					response.sendRedirect("editing.jsp");
				}
				else if(relation.equals("father")){
					conwithper.acceptRequest(eid, email, relation);
					System.out.println("congratulations");
					response.sendRedirect("editing.jsp");
				}
				
				else if(relation.equals("mother")){
					conwithper.acceptRequest(eid, email, relation);
					System.out.println("congratulations");
					response.sendRedirect("editing.jsp");
				}
				
				else if(relation.equals("spouse")){
					conwithper.acceptRequest(eid, email, relation);
					System.out.println("congratulations hello");
					response.sendRedirect("editing.jsp");
				}
				
				else if(relation.equals("friend")){
					conwithper.acceptRequest(eid, email, relation);
					System.out.println("congratulations");
					response.sendRedirect("editing.jsp");
				}
				
			}
				else
				{
					if(relation.equals("child")){
						conwithper.deleteRequest(eid, email, relation);
						System.out.println("congratulations");
						response.sendRedirect("editing.jsp");
					}
					
					else if(relation.equals("father")){
						conwithper.deleteRequest(eid, email, relation);
						System.out.println("congratulations");
						response.sendRedirect("editing.jsp");
					}
					
					else if(relation.equals("mother")){
						conwithper.deleteRequest(eid, email, relation);
						System.out.println("congratulations");
						response.sendRedirect("editing.jsp");
					}
					
					else if(relation.equals("spouse")){
						conwithper.deleteRequest(eid, email, relation);
						System.out.println("congratulations helllo");
						response.sendRedirect("editing.jsp");
					}
					
					else if(relation.equals("friend")){
						conwithper.deleteRequest(eid, email, relation);
						System.out.println("congratulations");
						response.sendRedirect("editing.jsp");
					}
					
					
				}
			
			
%>
</body>
</html>