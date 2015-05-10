<%@ page import="model.*" language="java" contentType="text/html; charset=ISO-8859-1" import="javax.servlet.http.HttpServletResponse"
    pageEncoding="ISO-8859-1"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- tointegrate -->
<%@ page import="controller.*" import = "model.*"  import="javax.servlet.http.HttpServletResponse"  %>

<!-- anishaguiupdated -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link href="family_css.css" rel="stylesheet" type="text/css"  />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Friendly Geneaology</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="images/icon.ico" /> 
<script type="text/javascript" src="iepngfix_tilebg.js"></script> 
<script type="text/javascript" src="iepngfix.js"></script> 
</head>

<body>
<div id="mainWrap">

<div id="mainPanel">

 <div id="menu">
  <ul>
   <li><a href="#"><span>Home</span></a></li>
   <li><div class="blank"></div></li>
   <li><a href="#"><span>About&nbsp;Us</span></a></li>
   <li><div class="blank"></div></li>
   <li><a href="#"><span>Support</span></a></li>
   <li><div class="blank"></div></li>
   <li><a href="#"><span>Forum</span></a></li>
   <li><div class="blank"></div></li>
   <li><a href="#"><span>Development</span></a></li>
   <li><div class="blank"></div></li>
   <li><a href="#"><span>Conact&nbsp;Us</span></a></li>
  </ul>
 </div>
 
  <div id="logoWrap"><h1>Friendly Geneaology</h1></div>
 <div id="loginPanel">
 <form action="login.jsp">
<div>
<table align="center" border="0"><tbody align="center">
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td><font color="#21606d" size="+2" style="font-stretch:normal" width="200">&nbsp;&nbsp;<b>
<%

			HttpSession sss=request.getSession();
			String eid=(String)sss.getAttribute("eid");
			String relation = request.getParameter("relation");
			String[][] persons;
			ConnectionWithPerson conwithper= new ConnectionWithPerson();
			if(relation.equals("cousin")){
				out.write("List of Cousins");
				 persons= conwithper.getCousins(eid);
			for(int i=0;i<persons.length;i++){ %></b></font></td></tr><tr></tr><tr></tr><tr></tr><tr></tr>
			<tr><td><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></td></tr>	

			<% }//for
			}//if
			else if(relation.equals("SIL")){
				out.write("List of Son in Laws");
				 persons= conwithper.getSonAndDaughterInLaw(eid, "female");
				 for(int i=0;i<persons.length;i++){ %>
					<tr><td><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></td></tr>	

					<%}//for
					}
			
			else if(relation.equals("DIL")){
				out.write("List of Daughter in Laws");
				 persons= conwithper.getSonAndDaughterInLaw(eid, "male");
				 for(int i=0;i<persons.length;i++){ %>
					<tr><td><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></td></tr>	

					<%}//for
					}
			
			else if(relation.equals("FIL")){
				out.write("Father in Law");
				 persons= conwithper.getMotherInLawAndFatherInLaw(eid, "male");
				 for(int i=0;i<persons.length;i++){ %>
					<tr><td><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></td></tr>	

					<%}//for
					}
			else if(relation.equals("MIL")){
				out.write("Mother in Law");
				 persons= conwithper.getCousins(eid);
				 for(int i=0;i<persons.length;i++){ %>
					<tr><td><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></td></tr>	

					<%}//for
					}
			else if(relation.equals("niece")){
				out.write("List of niece");
				System.out.println("hello i  m searchin neice");
				 persons= conwithper.getNeiceOrNephew(eid, "female");
				 for(int i=0;persons !=null && i<persons.length;i++){ %>
					<tr><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></tr>	

					<%}//for
					}
			else if(relation.equals("nephew")){
				out.write("List of nephew");
				 persons= conwithper.getNeiceOrNephew(eid, "male");
				 for(int i=0;persons !=null && i<persons.length;i++){ %>
					<tr><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></tr>	

					<%}//for
					}
			else if(relation.equals("grandfather")){
				out.write("Grand Father");
				 persons= conwithper. getGrandFatherAndGrandMother(eid, "male");
				 for(int i=0;persons !=null && i<persons.length;i++){ %>
					<tr><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></tr>	

					<%}//for
					}
			else if(relation.equals("grandMother")){
				out.write("Grand Mother");
				 persons= conwithper. getGrandFatherAndGrandMother(eid, "female");
				 for(int i=0;persons !=null && i<persons.length;i++){ %>
					<tr><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></tr>	

					<%}//for
					}
			else if(relation.equals("grandDaughter")){
				out.write("Grand Daughters");
				 persons= conwithper. getGrandSonAndGrandDaughter(eid, "female");
				 for(int i=0;persons !=null && i<persons.length;i++){ %>
					<tr><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></tr>	

					<%}//for
					}
			else if(relation.equals("grandSon")){
				out.write("Grand Sons");
				 persons= conwithper. getGrandSonAndGrandDaughter(eid, "male");
				 for(int i=0;persons !=null && i<persons.length;i++){ %>
					<tr><a href="displayprofiles.jsp?&ei=<%out.write(persons[i][1]);%>" target="_blank"><%out.write(persons[i][0]);%></a></tr>	

					<%}//for
					}
			
			

%>
</tbody>
</table>


</form>
<table ><tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr></table>
<div>
 
  

 </div>

 
</div>

 

</div>
  </div>
 
 
  
</body>
</html>
<!--  html>
<div align="center">
 
</div>
</html>-->