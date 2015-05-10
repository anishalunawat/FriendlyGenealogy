<!-- anishaguiupdated -->
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
		
		
 		String ei=request.getParameter("ei");
 		ConnectionWithPerson conwithper = new ConnectionWithPerson();
 		String name = conwithper.getName(ei);
 		out.write(name);
		 %></u></font></h3></div>
	<table border="0" width="1200">
	<tr>
    <td width="300" align="center"><div>
		<img src="images/pic1.jpg" />
	</div>
    </td>
	<td>
	<% String[] b=conwithper.otherDetails(ei);%>
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
				    	
				        	<td width="100"><font color="#ba7b65" size="4"><b>Email-id:</b></font></td><td><font color="#398FA0" size="4"><% out.write(ei); %></font></td>
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
				        	<td colspan="2" width="100"><font color="#ba7b65"size="4"><b>Birthday:</b></font></td>
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
				       <tr></tr>
	        	</tbody>
	        </table>
	</div>
	</td>
    
    <td>
    
    
    
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
   <tr align="right"><td colspan="2"><font color="#21606d" size="6" style="font-stretch:normal" width="200">Family Members</font></td><td><font color="#21606d" size="6" style="font-stretch:normal" width="200">Friends</font></td></tr> 
    <tr>
    <td colspan="2">
    <div class="family">
	<table border="0">
	    <thead></thead>
	    <tbody> 
	    <%
	    String[] p=conwithper.getFather(ei);
	    String[] t=conwithper.getMother(ei);
	    String[] sp=conwithper.getspouse(ei);
	    String[][] ch=conwithper.getChildren(ei);
	    String[][] ss=conwithper.getBrothersAndSisters(ei,"female");
	    String[][] bb=conwithper.getBrothersAndSisters(ei,"male");
	    String[][] fr=conwithper.getFriends(ei);
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
        
        System.out.println("qqqqqqqqqqqqq   "+ei+"   wwwwwwwwwwwwwwww"+p[0]+"hhhhhh"+p[1]);
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
	    			%><tr><td><a href="displayprofiles.jsp?&ei=<%out.write(bb[i][1]);%>" target="_blank">
					<% out.write(bb[i][0]);%></a></td></tr><tr></tr><%
					
				}%>
				</table>	</td>
	   <td width="149"><table><% 
	    		for(int i=0;i<ss.length;i++){
	    			%><tr><td><a href="displayprofiles.jsp?&ei=<%out.write(ss[i][1]);%>" target="_blank">
					<% out.write(ss[i][0]);%></a></td></tr><tr></tr><%
					
				}%>	</table></td>
				<td width="149" ><table><% 
	    		for(int i=0;i<ch.length;i++){
	    			%><tr><td><a href="displayprofiles.jsp?&ei=<%out.write(ch[i][1]);%>" target="_blank">
					<% out.write(ch[i][0]);%></a></td></tr><tr></tr><%
					
				}%>	
	    </table></td>
	    
	    
	   </tr>
	    <tr align="center">
	    
	    
	    
	    </tr>
	    <tr align="center">
	        
	        
	      
	    </tr>
	    
	    <tr align="center">
	        
	        
	       
	    </tr>
	    </tbody>
	</table>
    </div>
    </td>
    <td colspan="2">
    <form action="relation.jsp">
    <table align="center" border="0">
    <tr id="relations" align="center"><td width="300" height="135" rowspan="3">
	        <select name="brother" size="4">
            
            
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
            <input type="button" value="Go">
            </td>
    <td colspan="2" width="220" ><font color="#ba7b65" size="4"><b>Friends:</b></font></td><tr><td align="center"> <% 
	    		for(int i=0;i<fr.length;i++){
	    			%><a href="displayprofiles.jsp?&ei=<%out.write(fr[i][1]);%>" target="_blank">
					<% out.write(fr[i][0]);%></a><%
					
				}%></td></tr><tr></tr>
	        
	    </tr>
        </table>
        </form>
    </td>
    </tr>
    </table>
</div>
</div>
</body>
</html>