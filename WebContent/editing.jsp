<!-- tointegrate -->
<%@ page import="controller.*" import = "model.*"  import="javax.servlet.http.HttpServletResponse"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="o">
.login{width:66px; height:20px; margin:10px 0 0 0; padding:0px; float:left; font-family:Arial; font-size:11px; color:#943415; line-height:20px; text-align:center; text-decoration:none; background:url(images/loginBg.jpg) no-repeat}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Friendly Geneaology</title>
<link href="styles1.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="images/icon.ico" /> 
<script type="text/javascript" src="iepngfix_tilebg.js"></script> 
<script type="text/javascript" src="iepngfix.js"></script> 
<script>

</script>
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
   <li><a href="logout.jsp"><span>Logout</span></a></li>
  </ul>
 </div>
  <div id="name"><h3><font color="#21606d" size="6" style="font-stretch:normal" ><u><% 
		
		HttpSession sss=request.getSession();
 		String eid=(String)sss.getAttribute("eid");
 		ConnectionWithPerson conwithper = new ConnectionWithPerson();
 		String name = conwithper.getName(eid);
 		out.write(name);
		 %>'s Family</u></font></h3></div>
	<table border="0" width="1200">
	<tr>
    <td width="300" align="center"><div>
		<img src="images/pic1.jpg" />
	</div>
    </td>
	<td>
	<% String[] b=conwithper.otherDetails(eid);
	String fname[]= name.split(" ");
	    		   String dob = b[4];
	    		   String occupation=b[5];
	    		   String place=b[0];%>
	<div id = "details">
	    	<table width="400">
	    		<tbody>
	    		</tr>
            <th height="38" align="center" colspan="2"><font color="#21606d" size="+2" style="font-stretch:normal" width="200">User Information</font></th></tr>
                </tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr><tr></tr><tr></tr><tr></tr>
                
	    			<tr>
				    	
				        	<td width="100"><font color="#ba7b65" size="4"><b>Email-id:</b></font></td><td><font color="#398FA0" size="4"><% out.write(eid); %></font></td>
				    </tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr>
				        	<td><font color="#ba7b65" size="4" width="100"><b>Gender:</b></font></td><td><font color="#398FA0" size="4"><%
				        	if(b[1]==null)
				        	{
				        		out.write("N/A");
				        	}
				        	else
				        	out.write(b[1]);%></font></td>
				     </tr>
				     <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				     <tr>				        	
				        	<td colspan="2" width="100"><font color="#ba7b65"size="4"><b>Birthday:</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#398FA0" size="4"><%
	        	if(dob==null)
	        	{
	        		out.write("N/A");
	        	}
	        	else
	        		out.write(dob);%></font></td>
				     </tr>
				     <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				     <tr>
				        	<td><font color="#ba7b65" size="4" width="100"><b>Occupation:</b></font></td><td><font color="#398FA0" size="4"><%
				        	if(b[5]==null)
				        	{
				        		out.write("N/A");
				        	}
				        	else
				        		out.write(b[5]);%></font></td>
				      </tr>
				      <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				      <tr>
				        	<td><font color="#ba7b65" size="4" width="100"><b>Address:</b></font></td><td><font color="#398FA0" size="4"><%
				        	if(b[0]==null)
				        	{
				        		out.write("N/A");
				        	}
				        	else
				        		out.write(b[0]);%></font></td>
				       </tr>
				       <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    <tr></tr>
				    
				    <tr></tr>
				    <tr></tr><tr></tr>
				    <tr></tr><tr></tr>
				    <tr></tr>
				    <%System.out.println("fname in editng b4 eurprof is "+fname[0]+"lname is"+fname[1]+"occupations is"+occupation+"dob is "+dob+"place is"+place); %>
				       <tr><td colspan="2" align="center"><div id ="editUrProfile.jsp"><a href="editUrProfile.jsp?&mid=<%out.write(eid);%>&fname=<%out.write(fname[0]);%>&lname=<%out.write(fname[1]);%>&place=<%out.write(place);%>&occupation=<%out.write(occupation);%>&dob=<%out.write(dob);%>">Edit Your Profile</a></div></td></tr>
	        		
	        	</tbody>
	        </table>
	</div>
	</td>
    
    <td>
    
    <form action="addingrel.jsp">
    
    <div class="loginPanel" align="center">
    	<table width="200" height="250" border="0" align="center">

            <tbody><tr></tr>
            <th height="38" align="center" colspan="2"><font color="#21606d" size="+2" style="font-stretch:normal" width="200">Enter Family Members</font></th></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                    <td height="35" ><b><font color="#ba7b65"  size="4">First Name </font></b></td><td><b><font color="#ba7b65"  size="4">Last Name</font></b></td>
                </tr>
                <tr>
                    <td height="35" width="180"><input type="text"  name="fname" value="" size="20" /></td><td width="180"><input type="text" name="lname" value=""  size="20" /></td>
                </tr>
                
                <tr>
                    <td colspan="2" height="35"><b><font color="#ba7b65" size="4">Email Id</font></b></td>
                </tr>
                <tr>
                    <td height="35" colspan="2"><input type="text" name="mailid"  id="a" size="48" /></td>
                </tr>
                <tr>
                <td height="35" colspan="2" align="left">
                <select name="relation" id=relations>
            <option value="father" selected>Father</option>
            <option value="mother">Mother</option>
            <option value="brother">Brother</option>
            <option value="sister">Sister</option>
            <option value="child">Child</option>
            <option value="spouse">Spouse</option>
            <option value="friend">Friend</option>
            </select>
            </td>
                </tr>
          		
                <tr>
                    <td height="35" align="center" colspan="2"><input name="Submit" type="submit" id="Submit" value="Save" class="o" /></td>

                </tr>
            </tbody>
        </table>
        </div>
        </form>
    
 <!--    FName:<input type="text" name="fname">
    <br>
    LName:<input type="text" name="lname">
    <br>
    Email:&nbsp;  <input type="text" name="mailid">
    <br>
    <select name="relation" id=relations>
            <option value="father" selected>Father
            <option value="mother">Mother
            <option value="brother">Brother
            <option value="sister">Sister
            <option value="son">Son
            <option value="daughter">Daughter
            </select>
           <input type="button" value="Add Relation"> 
    </form>-->
  <!--   <div id = "enterRelationDetails.jsp"><a href="enterRelationDetails.jsp">Add Relations</a></div> -->
 </td></tr>
 <tr><td colspan="3"></td></tr>
 <tr><td colspan="3"></td></tr>
 <tr><td colspan="3"></td></tr>
 <tr><td colspan="3"></td></tr>
 <tr><td colspan="3"></td></tr>
 <tr><td colspan="3"></td></tr>
 <tr><td colspan="3"></td></tr>
   <tr align="center"><td colspan="2"><font color="#21606d" size="6" style="font-stretch:normal" width="200">Family Members</font></td><td><font color="#21606d" size="6" style="font-stretch:normal" width="200">Friends</font></td></tr> 
    <tr>
    <td colspan="2">
    <div class="family">
	<table border="0">
	    <thead></thead>
	    <tbody> 
	    <%
	    String[] p=conwithper.getFather(eid);
	    String[] t=conwithper.getMother(eid);
	    String[] sp=conwithper.getspouse(eid);
	    String[][] ch=conwithper.getChildren(eid);
	    String[][] ss=conwithper.getBrothersAndSisters(eid,"female");
	    String[][] bb=conwithper.getBrothersAndSisters(eid,"male");
	    String[][] fr=conwithper.getFriends(eid);
	    String[][] re = conwithper.pendingRequest(eid);
        ConnectionWithPerson f=new ConnectionWithPerson(); 
        if(p==null){
        	p= new String[2];
        	p[0]="n/a";
        	p[1]="N/A";
        	
        }
        
        if(t==null){
        	t= new String[2];
        	t[0]="n/a";
        	t[1]="n/a";
        	
        }
        if(sp==null){
        	sp= new String[2];
        	sp[0]="n/a";
        	sp[1]="n/a";
        	
        }
        if(ch[0][0]==null){
        	ch= new String[1][2];
        	
				
				ch[0][0]="n/a";
				ch[0][1]="n/a";
			
        	
        }
        if(bb==null){
        	bb= new String[1][2];
        	
				
				bb[0][0]="N/A";
				bb[0][1]="N/A";
		}
        if(ss==null){
        	ss= new String[1][2];
        	
				
				ss[0][0]="N/A";
				ss[0][1]="N/A";
		}
        if(fr[0][0]==null){
        	fr= new String[1][2];
        	
				
				fr[0][0]="N/A";
				fr[0][1]="N/A";
		} 
        if(re == null){
        	re = new String[1][3];
        	System.out.println("hello i am here ");
        	re[0][0]="No Pending Request";
        	re[0][2] = "123";
        	re[0][1] = "123";
        }
        System.out.println("qqqqqqqqqqqqq   "+eid+"   wwwwwwwwwwwwwwww"+p[0]+"hhhhhh"+p[1]);
        %>
	     
	    <tr align="center" ><td width="238" height="43"><font color="#ba7b65" size="4"><b>Father: </b></font><font color="#398FA0" size="4"><a href="displayprofiles.jsp?&ei=<%out.write(p[1]);%>" target="_blank"><% out.write(p[0]);
	   %></a></font></td>
	    <td width="220" ><font color="#ba7b65" size="4"><b>Mother:</b></font><font color="#398FA0" size="4"> <a href="displayprofiles.jsp?&ei=<%out.write(t[1]);%>" target="_blank"><% out.write(t[0]);
	    %></a></font></td><td width="220" ><font color="#ba7b65" size="4"><b>Spouse:</b></font><font color="#398FA0" size="4"><a href="displayprofiles.jsp?&ei=<%out.write(sp[1]);%>" target="_blank"> <% out.write(sp[0]);%></a></font></td></tr>
	    <%System.out.println(sp[0]+"i am in conection"); %>
	    <tr ></tr>
	    <tr ></tr>
	    <tr ></tr>
	    <tr ></tr>
	    <tr ></tr><tr ></tr><tr ></tr><tr ></tr><tr ></tr><tr ></tr>    
	    <tr align="center" ><td width="220" height="43"><font color="#ba7b65" size="4"><b>Brothers:</b></font></td>
	    <td width="220" ><font color="#ba7b65" size="4"><b>Sisters:</b></font></td>
	    <td width="220" ><font color="#ba7b65" size="4"><b>Children:</b></font></td>
	     </tr>
	    <%System.out.println(sp[0]+"i am in conection"); %>
	    <tr align="center" >
	   <td width="149" >
	   <table><% 
	    		for(int i=0;i<bb.length;i++){
	    			%><tr><td align="center"><a href="displayprofiles.jsp?&ei=<%out.write(bb[i][1]);%>" target="_blank">
					<% out.write(bb[i][0]);%></a></td></tr><tr></tr><%
					
				}%>
				</table>	</td>
	   <td width="149"><table><% 
	    		for(int i=0;i<ss.length;i++){
	    			%><tr><td align="center"><a href="displayprofiles.jsp?&ei=<%out.write(ss[i][1]);%>" target="_blank">
					<% out.write(ss[i][0]);%></a></td></tr><tr></tr><%
					
				}%>	</table></td>
				<td width="149" ><table><% 
	    		for(int i=0;i<ch.length;i++){
	    			%><tr><td align="center"><a href="displayprofiles.jsp?&ei=<%out.write(ch[i][1]);%>" target="_blank">
					<% out.write(ch[i][0]);%></a></td></tr><tr></tr><%
					
				}%>	
	    </table></td>
	    
	    </tr>
	    <tr align="center">
	    <td colspan="3">
	     <form action="relation.jsp">
	    <table align="center" border="0">
	        <tr id="relations" align="center"><td width="300" height="135" rowspan="3">
	        <select name="relation" size="4">
            <option value="grandfather">GrandFather</option>
            <option value="grandMother">GrandMother</option>
            <option value="FIL">Father In Law</option>
            <option value="MIL">Mother In Law</option>
            <option value="cousin">Cousins</option>
            
            <option value="SIL">Son in law</option>
            <option value="DIL">Daughter In Law</option>
            
            <option value="niece">Niece</option>
            <option value="nephew">Nephew</option>
            
            <option value="grandSon">GrandSon</option>
            <option value="grandDaughter">GrandDaughter</option>
            </select>
            <input type="submit" value="Go" id="gob" />
            </td>
            </tr>
            </table>
            </form>
	    </td>
	   
	    </tr>
	     </tbody>
	</table>
	
	</div>
	</td>
	<td>
	<table border="0" width="400" align="center" ><tbody align="center"><tr><td><font color="#ba7b65" size="4"><b>Friends:</b></font></td></tr> <% 
	    		for(int i=0;i<fr.length;i++){
	    			%><tr><td><a href="displayprofiles.jsp?&ei=<%out.write(fr[i][1]);%>" target="_blank">
					<% out.write(fr[i][0]);%></a></td></tr><%
					
				}%>
	</td></tr>
	
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr>
	    <form action= "request.jsp">
	    <table border="0" align="center"><tbody align="center">
	    <tr align="center">
	         <td width="250" ><font color="#21606d" size="+2" style="font-stretch:normal" width="200">&nbsp;&nbsp;<b>Pending Requests:</b></font></td></tr>
	      <tr>   <% //display father request
	      String child;
	         if(re[0][2].equalsIgnoreCase("father")){%>
	         	<td width ="149">Father:&nbsp;&nbsp;<a href = "displayprofiles.jsp?&ei=<%out.write(re[0][1]);%>" target="_blank">
				         	<% out.write(re[0][0]);%></a>
				         	<!-- <input type = "hidden" name= "eid" value = "eid" />-->
				         	<%  child=  "father";%>
				         	<input type = "hidden" name = "relation" value = "<%out.write(re[0][2]);%>" />
				         	<input type= "hidden" name ="email" value = "<% out.write(re[0][1]); %>" />
				         	<% System.out.println("inside the form"+ re[0][1]);%>
				         	<input name="accept" type="submit" id="accept" value="accept" />&nbsp;&nbsp;
				         	<input name="accept" type="submit" id="accept" value="reject" /></td>
	        </tr>
	        <tr>
	        <% }
	         //display mother request 
	         if(re[0][2].equalsIgnoreCase("mother")){%> 
	        <td width ="149">Mother:&nbsp;&nbsp;<a href = "displayprofiles.jsp?&ei=<%out.write(re[0][1]);%>" target="_blank">
				         	<% out.write(re[0][0]);%></a>
				         	<!-- <input type = "hidden" name= "eid" value = "eid" />-->
				         	<%  child=  "mother";%>
				         	<input type = "hidden" name = "relation" value = "<%out.write(re[0][1]);%>" />
				         	<input type= "hidden" name ="email" value = "<% out.write(re[0][1]); %>" />
				         	<% System.out.println("inside the form"+ re[0][1]);%>
				         	<input name="accept" type="submit" id="accept" value="accept" />&nbsp;&nbsp;
				         	<input name="accept" type="submit" id="accept" value="reject" /></td>
	        	
	         <%} if(re.length >= 2 && re[1][2].equalsIgnoreCase("mother")){ %>
		         	 <td width ="149">Mother:&nbsp;&nbsp;<a href = "displayprofiles.jsp?&ei=<%out.write(re[1][1]);%>" target="_blank">
				         	<% out.write(re[1][0]);%></a>
				         	<!-- <input type = "hidden" name= "eid" value = "eid" />-->
				         	<% child=  "mother";%>
				         	<input type = "hidden" name = "relation" value = "<%out.write(re[1][1]);%>" />
				         	<input type= "hidden" name ="email" value = "<% out.write(re[1][1]); %>" />
				         	<% System.out.println("inside the form"+ re[1][1]);%>
				         	<input name="accept" type="submit" id="accept" value="accept" />&nbsp;&nbsp;
				         	<input name="accept" type="submit" id="accept" value="reject" /></td>
	        </tr>
	    	<tr>  	<%}// display spouse request 
	      	if(re[0][2].equalsIgnoreCase("spouse")){%> 
	         	<td width ="149">Spouse:&nbsp;&nbsp;<a href = "displayprofiles.jsp?&ei=<%out.write(re[0][1]);%>" target="_blank">
				         	<% out.write(re[0][0]);%></a>
				         	<!-- <input type = "hidden" name= "eid" value = "eid" />-->
				         	<% child=  "spouse";%>
				         	<input type = "hidden" name = "relation" value = "<%out.write(re[0][2]);%>" />
				         	<input type= "hidden" name ="email" value = "<% out.write(re[0][1]); %>" />
				         	<% System.out.println("inside the form"+ re[0][1]);%>
				         	<input name="accept" type="submit" id="accept" value="accept" />&nbsp;&nbsp;
				         	<input name="accept" type="submit" id="accept" value="reject" /></td>
	        <%  } 
	      	if(re.length >= 2 && re[1][2].equalsIgnoreCase("spouse")){%> 
	         	<td width ="149">Spouse:&nbsp;&nbsp;<a href = "displayprofiles.jsp?&ei=<%out.write(re[1][1]);%>" target="_blank">
				         	<% out.write(re[1][0]);%></a>
				         	<!-- <input type = "hidden" name= "eid" value = "eid" />-->
				         	<% child=  "spouse";%>
				         	<input type = "hidden" name = "relation" value ="<%out.write(re[0][2]);%>" />
				         	<input type= "hidden" name ="email" value = "<% out.write(re[1][1]); %>" />
				         	<% System.out.println("inside the form"+ re[1][1]);%>
				         	<input name="accept" type="submit" id="accept" value="accept" />&nbsp;&nbsp;
				         	<input name="accept" type="submit" id="accept" value="reject" /></td>
	         	
	         <%}
	         if(re.length >= 3 && re[2][2].equalsIgnoreCase("spouse")){%> 
	         	<td width ="149">Spouse:&nbsp;&nbsp;<a href = "displayprofiles.jsp?&ei=<%out.write(re[2][1]);%>" target="_blank">
				         	<% out.write(re[2][0]);%></a>
				         	<!-- <input type = "hidden" name= "eid" value = "eid" />-->
				         	<%  child=  "spouse";%>
				         	<input type = "hidden" name = "relation" value = "<%out.write(re[0][2]);%>" />
				         	<input type= "hidden" name ="email" value = "<% out.write(re[2][1]); %>" />
				         	<% System.out.println("inside the form"+ re[2][1]);%>
				         	<input name="accept" type="submit" id="accept" value="accept" />&nbsp;&nbsp;
				         	<input name="accept" type="submit" id="accept" value="reject" /></td>
	       </tr><%} %>
	       <tr>
	       <% int i,size =re.length;
	       for(i=0;i<size && (!re[i][2].equalsIgnoreCase("child"));i++){
	       		if(i==0 && re[i][2].equalsIgnoreCase("friend")){%>
	       			<td width = "149">Friends:&nbsp;&nbsp;</td>
	       			   	<% }if(re[i][2].equalsIgnoreCase("friend")){%>
				       		<td width ="149"><a href = "displayprofiles.jsp?&ei=<%out.write(re[i][1]);%>" target="_blank">
				         	<% out.write(re[i][0]);%></a>
				         	<!-- <input type = "hidden" name= "eid" value = "eid" />-->
				         	<% child=  "friend";%>
				         	<input type = "hidden" name = "relation" value = "child" />
				         	<input type= "hidden" name ="email" value = "<% out.write(re[i][1]); %>" />
				         	<% System.out.println("inside the form"+ re[i][1]);%>
				         	<input name="accept" type="submit" id="accept" value="accept" />&nbsp;&nbsp;
				         	<input name="accept" type="submit" id="accept" value="reject" /></td>
			       	<% 	}
	       }
			       		int pos=i;%> 
	       		
	       </tr>  
	    	<tr>
	       <% size =re.length;
	       for(;i<size;i++){
	       		if(pos==i && re[i][2].equalsIgnoreCase("child")){%>
	       			<td width = "149">Children:</td>
	    	   	<%}
	       		if(re[i][2].equalsIgnoreCase("child")){%>
	       		<td width ="149"><a href = "displayprofiles.jsp?&ei=<%out.write(re[i][1]);%>" target="_blank">
	         	<% out.write(re[i][0]);%></a>
	         	<!-- <input type = "hidden" name= "eid" value = "eid" />-->
	         	<% child=  "child";%>
	         	<input type = "hidden" name = "relation" value = "child" />
	         	<input type= "hidden" name ="email" value = "<% out.write(re[i][1]); %>" />
	         	<% System.out.println("inside the form"+ re[i][1]);%>
	         	<input name="accept" type="submit" id="accept" value="accept" />&nbsp;&nbsp;
	         	<input name="accept" type="submit" id="accept" value="reject" /></td>
	         	
	         	<% System.out.println("Requesting children id is  "+re[i][1]);}
	       		}%>
	       </tr>  
	    </tr>
	   <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr><tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr><tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr><tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr><tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	    <tr></tr>
	   </tbody> 
	</table>
	</form> 
	</table></table>
	  
	   
	   
    </div>
    </td>
    
   
    
          
   
	        
	    
        
   
   
    </table>
</div>
</div>
</body>
</html>