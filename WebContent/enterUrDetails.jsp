<!-- anishaupdatedgui -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />
		<script type="text/javascript" src="jsDatePick.min.1.3.js"></script>
		<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"dob",
			dateFormat:"%d-%M-%Y"
		});
	};
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

  <div id="logoWrap"><h1>Friendly Geneaology</h1></div>
 <div id="loginPanel">
 <h3><b><font color="#21606d" size="6" style="font-stretch:normal">Photo Upload</font></b></h3>
<b><font color="#ba7b65"  size="4">Select a file to upload: </font></b><br />
<form action="UploadServlet" method="post" onsubmit="alert('Photo uploaded successfully !!');" enctype="multipart/form-data">
<input type="file" name="file" size="100" />
<br />
<input type="submit" value="Upload" class="login"  />

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
<tr><td></td></tr></table>

<div>


 <div id="leftPanel">
 

  <form action="detail.jsp">
    <div>
    
    	<table>

            <tbody>
           <tr> <th height="38" align="center" width="500" colspan="2"><font color="#21606d" size="6" style="font-stretch:normal">Enter User Details</font></th></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                    <td height="35" ><b><font color="#ba7b65"  size="4">First Name </font></b></td><td><b><font color="#ba7b65"  size="4">Last Name</font></b></td>
                </tr>
                <tr>
                    <td height="35" width="140"><input type="text"  name="fname" value="First Name" onfocus="if(this.value=='First Name')this.value=''" onblur="if(this.value=='')this.value='First Name'" size="20" size="4" /></td><td><input type="text" name="lname" value="Last Name" onfocus="if(this.value=='Last Name')this.value=''" onblur="if(this.value=='')this.value='Last Name'" size="20" /></td>
                </tr>
                <tr></tr><tr></tr><tr></tr><tr></tr>
                
                <tr>
                
                    <td height="20"><b><font color="#ba7b65" >Male<input type="radio" name=sex id="gend" value="Male" checked="checked" size="2" class=""/> </font></b></td><td><b><font color="#ba7b65" size="4">Female<input type="radio" name=sex id="gend" value="Female" size="2"/></font></b></td>
                
                </tr>
               <tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                    <td colspan="2"><b><font color="#ba7b65" size="4">Email Id</font></b></td>
                </tr>
                <tr>
                    <td height="35" colspan="2"><input type="text" name="eid" value="<% 
                    		HttpSession sss=request.getSession();
             		String eid=(String)sss.getAttribute("eid");
                    out.write(eid); %>" id="a" size="48" readonly="readonly" /></td>
                </tr>
                <tr></tr>
				<tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                    <td colspan="2"><b><font color="#ba7b65" size="4"> Date of Birth</font></b></td>
                </tr>
                <tr>
                    <td height="35" colspan="2" ><input type="text" name="dob" value=""  id="dob" size="48" /></td>
                </tr>
                <tr></tr>
                <tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                    <td colspan="2"><b><font color="#ba7b65" size="4" >Place</font></b></td>
                </tr>
                <tr>
                    <td height="35" colspan="2"><input type="text" name="place" value="Place" onfocus="if(this.value=='Place')this.value=''" onblur="if(this.value=='')this.value='Place'" id="place" size="48" /></td>
                </tr>
                <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                    <td colspan="2"><b><font color="#ba7b65" size="4">Occupation</font></b></td>
                </tr>
                <tr>
                    <td height="35"  colspan="2"><input type="text" name="occupation" value="Occupation" onfocus="if(this.value=='Occupation')this.value=''" onblur="if(this.value=='')this.value='Occupation'" id="occupation" size="48" /></td>
                </tr>
                <tr></tr>
           <tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                    <td height="35" align="center" colspan="2" ><input name="Submit" type="submit" id="Submit" value="Save" class="login"/></td>

                </tr>
            </tbody>
        </table>
        </div>
        </form>
	
  
 </div>
  


 
 </div>
 
</div>
</div>
  </div>
 
 
  
</body>
</html>


<!--  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<table><tr></tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr></table>
</div>
</form>
 </div>
 
 <div id="rightPanel" align="left">
  <div class="about">
 <form action="detail.jsp">
    <div align="center">
    
    	<table width="334" border="0" align="center">

            <tbody>
           <tr> <th height="38" align="center" width="1000"><font color="#21606d" size="6" style="font-stretch:normal">Enter User Details</font></th></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr><tr></tr><tr></tr><tr></tr>
                <tr>
                    <td height="20" ><b><font color="#ba7b65"  size="4">First Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Last Name</font></b></td>
                </tr>
                <tr>
                    <td height="35"><input type="text"  name="fname" value="" size="20" size="4" />&nbsp;&nbsp; &nbsp;&nbsp;<input type="text" name="lname" value="" size="20" /></td>
                </tr>
                
                <tr>
                    <td height="20"><b><font color="#ba7b65" size="4">Gender &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name=sex id="gend" value="Male" checked>Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name=sex id="gend" value="Female">Female</font></b></td>
                </tr>
               
                
                
                <tr>
                    <td><b><font color="#ba7b65" size="4">Email Id</font></b></td>
                </tr>
                <tr>
                    <td height="35"><input type="text" name="eid" value="" id="a" size="48" /></td>
                </tr>
                <tr></tr>

                <tr>
                    <td><b><font color="#ba7b65" size="4"> Date of Birth:</font></b></td>
                </tr>
                <tr>
                    <td height="35" ><input type="text" name="dob" value="" id="dob" size="48" /></td>
                </tr>
                <tr></tr>
                <tr>
                    <td><b><font color="#ba7b65" size="4">Place</font></b></td>
                </tr>
                <tr>
                    <td height="35"><input type="text" name="place" value="" id="place" size="48" /></td>
                </tr>
                <tr></tr>
                <tr>
                    <td><b><font color="#ba7b65" size="4">Occupation</font></b></td>
                </tr>
                <tr>
                    <td height="35" ><input type="text" name="occupation" value="" id="occupation" size="48" /></td>
                </tr>
                <tr></tr>
           
                <tr>
                    <td height="35" align="center" colspan="2" ><input name="Submit" type="submit" id="Submit" value="Save" class="login"/></td>

                </tr>
            </tbody>
        </table>
        </div>
        </form>
	
</div>
</div>
  </div>
  </div>
 
 
</body>
</html>
-->