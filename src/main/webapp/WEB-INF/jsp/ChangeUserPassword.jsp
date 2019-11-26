<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
<style>

.error{
    color: crimson;
}

 body {
 		background-image: url('./resources/img/pencil.jpg');
        background-color: pink;
        font-family: 'Ubuntu', sans-serif;
    }
    
    .main {
        background-color: #FFFFFF;
        width: 400px;
/*         height: 400px;*/
		padding: 15px;
       margin: 7em auto;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
    .sign {
        padding-top: 40px;
        color: #8C55AA;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    .un {
    width: 95%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(146, 126, 126, 0.15);
    padding: 12px 10px 8px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    
    margin-left: 8px;
    text-align: center;
    margin-bottom: 10px;
    font-family: 'Ubuntu', sans-serif;
    
    }
    .pass {
            width: 95%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.15);
    padding: 12px 10px 8px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    
    margin-left: 8px;
    text-align: center;
    margin-bottom: 10px;
    font-family: 'Ubuntu', sans-serif;
    
    }
    form.form1 {
        padding-top: 40px;
    }
    
    
    
   
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .login {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #32CD32, #008000);
        border: 0;
        padding-left: 50px;
        padding-right: 50px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 15%;
        font-size: 15px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #9C27B0, #E040FB);
		
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 20%;
        font-size: 15px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
    .forgot {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        padding-top: 15px;
    }
    
    a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        text-decoration: none
    }
    
    @media (max-width: 600px) {
        .main {
            border-radius: 0px;
        }
        }
        .tooltip {        
     position: relative;
     bottom:40px; 
     left:10px;
     display: inline;
     font-size:12px;
     /* border-bottom: 1px dotted black; */
     }
     .tooltip .tooltiptext {
    visibility: hidden;
    height:50px;
    width: 250px;
  	background-color: #555;
  	color: #fff;
  	text-align: center;
  	border-radius: 20px;
  	padding: 5px 0;
  	position: absolute;
  	z-index: 1;
  	bottom: 125%;
  	left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
}
     .tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}
.tooltip:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}
        }
        
        
        


</style>
  <script>

		function valid()
		{   var opassword=document.getElementById('opassword').value;
		    var npassword=document.getElementById('npassword').value;
		    
		    
		     var id1=document.getElementById('id1');
	         var id2=document.getElementById('id2');
	         
	        
	         var npasswordregex=/^[a-zA-Z)0-9$#@]{6,}$/;
	         
	         var flag=true;
	         id1.innerHTML='';
	         id2.innerHTML='';
	         
	         if(opassword=='')
	         {
	            id1.innerHTML='Please fill password';
	            flag=false;
	         }
	        
	         
	         if(npassword=='')
	         {
	            id2.innerHTML='Please fill password';
	            flag=false;
	         }
	        else
	         if(npasswordregex.test(password)==false)
	        {
	          id2.innerHTML="Please fill correct password";
	          
	          flag=false;

	        }
	         return flag;
		
		}

</script>
</head>
<body>
<div class="main">
<p class="sign" align="center">Change Password</p>
	<form   action="changepassword.do" method="post" onsubmit="return valid()">
	<center>
		<table align="center">
			
			<tr>
				<td>Old Password:</td>
				<td><input class="pass" type="password" align="center"  placeholder="Old password" name="opassword" id="opassword" />
				<div id='id1' class="error"></div>
				</td>
			</tr>
			<tr>
				<td>New Password:</td>
				<td><input class="pass" type="password" align="center"  placeholder="New password" name="npassword" id="npassword" />
				<div class="tooltip"><i style='font-size:24px' class='fas'>&#xf501;</i>
  			`	<span class="tooltiptext">Atleast 6 characters,including alphabets,numbers and special characters</span>
				</div>
				<div id='id2' class="error"></div>
				</td>
			</tr>
						
			<tr>
				<td></td>
				 <td align="center"><input type="submit" class= "login" id="login" name="Update_Password" value="Update Password"></td>
				<!-- <td colspan="1">
                        <input type="submit" class="login" align="center"  id="login" name="Update_Password"  value="Update Password">
                        
                        <input type="reset" value='Clear'>
                        </td> -->
			</tr>
			<tr>
			<div Style="font-style: italic; color: red;">${message}</div>
			</tr>
		</table>
		</center>
	</form>
	</div>
</body>
</html>