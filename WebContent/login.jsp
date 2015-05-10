<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ page import=" controller.*" %>
<body>
	<%
		
       String eid=request.getParameter("eid");
       String pwd=request.getParameter("pwd");
       String b=Login.checkLogin(eid, pwd);

       if(b!=null)
           {
    	   String s1=eid;
           HttpSession ss=request.getSession();
           ss.setAttribute("eid",s1);
           response.sendRedirect("editing.jsp");
       }

       else
           response.sendRedirect("index.jsp");
       


%>

</body>
</html>