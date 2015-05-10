<!-- tointegrate -->
<%@ page import=" controller.*" import="javax.servlet.http.HttpServletResponse" %>
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
        String eid=request.getParameter("eid");
        String gender = request.getParameter("sex");
        
        System.out.println("i am---------------------------"+gender);
        String dob=request.getParameter("dob");
        String place=request.getParameter("place");
        String occupation=request.getParameter("occupation");
       boolean b=details.editDetails(fname,lname,eid,gender,place,occupation,dob);
if(b){
	String s1=eid;
    HttpSession ss=request.getSession();
    ss.setAttribute("eid",s1);
response.sendRedirect("editing.jsp");
}        else
    response.sendRedirect("index.jsp");
%>

</body>
</html>