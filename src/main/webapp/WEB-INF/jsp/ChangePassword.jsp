<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
        


</style>
  <script>

		function valid()
		{   
			var studentid=document.getElementById('studentid').value;
		
			var opassword=document.getElementById('opassword').value;
		    var npassword=document.getElementById('npassword').value;
		    
		    
		     var id1=document.getElementById('id1');
	         var id2=document.getElementById('id2');
	         var id3=document.getElementById('id3');
	         
	         
	        
	        
	         var npasswordregex=/^[a-zA-Z)0-9$#@]{6,}$/;
	         
	         var flag=true;
	         id1.innerHTML='';
	         id2.innerHTML='';
	         id3.innerHTML='';
	         
	         if(studentid=='')
	         {
	            id1.innerHTML='plz fill Student Id';
	            flag=false;

	         }
	         
	         
	         if(opassword=='')
	         {
	            id2.innerHTML='Please fill password';
	            flag=false;
	         }
	        
	         
	         if(npassword=='')
	         {
	            id3.innerHTML='Please fill password';
	            flag=false;
	         }
	        else
	         if(npasswordregex.test(password)==false)
	        {
	          id3.innerHTML="Please fill correct password";
	          
	          flag=false;

	        }
	         return flag;
		
		}

</script>

</head>
<body>
<div class="main">
<p class="sign" align="center">Change Password</p>
	<form   action="changepwd.do" method="post" onsubmit="return valid()">
	<center>
		<table align="center">
			<tr>
				<td>Student Id:</td>
				<td><input  class="un" type="text"  align="center"  placeholder="Studentid"  name="studentid" id="studentid" />
				<div id='id1' class="error"></div>
				</td>
			</tr>
			<tr>
				<td>Old Password:</td>
				<td><input class="pass" type="password" align="center"  placeholder="Old password" name="opassword" id="opassword" />
				<div id='id2' class="error"></div>
				</td>
			</tr>
			<tr>
				<td>New Password:</td>
				<td><input class="pass" type="password" align="center"  placeholder="New password" name="npassword" id="npassword" />
				<div id='id3' class="error"></div>
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