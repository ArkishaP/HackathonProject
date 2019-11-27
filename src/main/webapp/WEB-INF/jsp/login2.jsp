<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<style >
/* body{
background-image: url('./image/image1.jpg');
height:100vh;
backgroung-size:cover;
background-position:center;
background-repeat:no-repeat;
} */
/* div {
  height:20%;
  width:20%;
 /*  padding:30px; */
 /*  border: 3px solid gray;
  margin: 0;
  text-align:center;
 
}
.button1{
 background-color: #4CAF50;

}
.button2{
 background-color:crimson;

}  */

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

 </head>
 <body>
<div class="main">
    <p class="sign" align="center">Sign in</p>
<Form action="login.do" name="Login Form" method="post">
        <center>
            <table>
                <tr>
                    <th> Student id:</th>
                    <td> <input  class="un" type="text" align="center" placeholder="studentid" name='studentid' id="studentid" ></input>
                   
                    </td>
                </tr>
                
                <tr>
                    <th> Password:</th>
                    <td> <input  class="pass" type="password" align="center" placeholder="password" name='password' id="password"  ></input>
                  
                    </td>
                </tr>
<!-- 				<tr>
				<td></td>
                <th><a href="#" >forget password ?</a></th>
				</tr> -->
				<tr>
				<td></td>
                <th><a href="changepwd.do" >Change Password ?</a></th>
				</tr>
                <tr>
						<td colspan="1"><a href="register.do" class="submit">Register</a></td>
						<td colspan="1">
                        <input type="submit" class="login" align="center" value="Login">
                        
                        <!-- <input type="reset" value='Clear'> -->
                        </td>
                </tr>
                <tr>
				<td></td>
				
			</tr>
			
                 </table>
				<div Style="font-style: italic; color: red;">${message}</div>
        </center>
    </Form>
    
    <%-- <table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table> --%>
	</div>
</body> 

<!-- <body>
  <div class="main">
    <p class="sign" align="center">Sign in</p>
    <form class="form1">
      <input class="un " type="text" align="center" placeholder="Username">
      <input class="pass" type="password" align="center" placeholder="Password">
      <a class="submit" align="center">Sign in</a>
      <p class="forgot" align="center"><a href="#">Forgot Password?</p>
            
                
    </div>
     
</body>
 -->
</html>