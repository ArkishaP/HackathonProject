<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignUp form</title>
<style>
.error{
    color: crimson;
}
body {
 		 background-image: url('./resources/img/pencil.jpg'); 
       /*  background-color: pink; */
        font-family: 'Ubuntu', sans-serif;
    }
    
    .main {
        background-color: #FFFFFF;
        width: 620px;
/*         height: 700px; */
        margin: 1em auto;
        border-radius: 1.5em;
		padding:15px;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
    .sign {
        padding-top: 15px;
		
        color: #8C55AA;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    .un {
    width: 95%;
    color: rgb(38, 50, 96);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(166, 126, 186, 0.15);
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
        padding-top: 5	px;
    }
    
    .pass {
            width: 95%;
    color: rgb(38, 50, 96);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(166, 126, 186, 0.15);
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
        padding-right: 40px;
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
        padding-left: 50px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 50%;
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
         var fname=document.getElementById('fname').value;
         var lname=document.getElementById('lname').value;
//          var gender=document.getElementById('gender').value;
         var email=document.getElementById('email').value;
         var password=document.getElementById('password').value;
         var dob=document.getElementById('dob').value;
         var city=document.getElementById('city').value;
         var state=document.getElementById('state').value;
         var phoneno=document.getElementById('phoneno').value;
         
         var id1=document.getElementById('id1');
         var id2=document.getElementById('id2');
         var id3=document.getElementById('id3');
 //        var id4=document.getElementById('id4');
         var id5=document.getElementById('id5');
         var id6=document.getElementById('id6');
         var id7=document.getElementById('id7');
         var id8=document.getElementById('id8');
         var id9=document.getElementById('id9');
         var id10=document.getElementById('id10');
         
         var sidregex=/^[A-Za-z0-9]{5,}$/;
         var fnameregex=/^[A-Za-z ]{4,}$/;
         var lnameregex=/^[A-Za-z ]{4,}$/;
         var emailregex=/^[a-z0-9]{6,}[@]{1}[a-z]{4,}[.][a-z]{2,}$/;
         var passwordregex=/^[a-zA-Z)0-9$#@]{6,}$/;
    //     var dobregex=;         
         var phoneregex=/^[+]{1}[9]{1}[1]{1}[-]{1}[0-9]{10}$/;
         
         
         var flag=true;
         id1.innerHTML='';
         id2.innerHTML='';
         id3.innerHTML='';
        // id4.innerHTML='';
         id5.innerHTML='';
         id6.innerHTML='';
         id7.innerHTML='';
         id8.innerHTML='';
         id9.innerHTML='';
         id10.innerHTML='';

         //Student Id
         if(studentid=='')
         {
            id1.innerHTML='plz fill Student Id';
            flag=false;

         }
         else
           if(sidregex.test(studentid)==false)
        {
          id1.innerHTML="Improper Id";
          
          flag=false;

        }

        //first name

        if(fname=='')
         {
            id2.innerHTML='Please fill first name';
            flag=false;
         }
        else
         if(fnameregex.test(fname)==false)
        {
          id2.innerHTML="Please fill correct first name";
          
          flag=false;

        }
        //last name
        if(lname=='')
         {
            id3.innerHTML='Please fill last name';
            flag=false;
         }
        else
         if(lnameregex.test(lname)==false)
        {
          id3.innerHTML="Please fill last name";
          
          flag=false;

        }
        //genderid4
        //email
        if(email=='')
         {
            id5.innerHTML='Please fill your email';
            flag=false;
         }
        else
         if(emailregex.test(email)==false)
        {
          id5.innerHTML="Please fill correct email";
          
          flag=false;

        }
        
        //password
        if(password=='')
         {
            id6.innerHTML='Please fill password';
            flag=false;
         }
        else
         if(passwordregex.test(password)==false)
        {
          id6.innerHTML="Please fill correct password";
          
          flag=false;

        }
        
        
        //date of birth
         if(dob=='')
         {
            id7.innerHTML='plz fill DOB';
            flag=false;
         }
        else{
         var date1=new Date();
         var date2=new Date(dob);
         if(date1.getFullYear()-date2.getFullYear()<18)
         {   
			id7.innerHTML="AGE SHOULD BE 18 YEARS";
			flag=false;
		}
		}
        
        /* if(dob=='')
         {
            id7.innerHTML='plz fill DOB';
            flag=false;
         } */
        /* else{
         var date1=new Date();
         var date2=new Date(dob);
         if(date1.getFullYear()-date2.getFullYear()<18)
         {   
          id3.innerHTML="AGE SHOULD BE 18 YEARS";
         
          //location.replace()
          flag=false;

        }
        } */
        
        //city
        if(city=='')
         {
            id8.innerHTML='plz fill your city';
            flag=false;
         }
        
        //state
        if(state=='')
         {
            id9.innerHTML='Please fill your state ';
            flag=false;
         }
        
        //phone
        if(phoneno=='')
         {
            id10.innerHTML='plz fill mobile number';
            flag=false;
         }
        else
         if(phoneregex.test(phoneno)==false)
        {
          id9.innerHTML="plz fill correct mobile number";
         
          flag=false;

        }
        
        /* if (flag) {
            document.forms['Registration Form'].submit();
        } */
        return flag;
    
     }     
        

    </script>

</head>
<body>
<div class="main">
    <p class="sign" align="center">Register Now</p>
<Form  class="form1" action="register.do" name="Registration Form" method="post" onsubmit="return valid()">

        <center>
			
            <table>
                <tr>
                    <th> Student id:</th>
                    <td> <input type="text"  class="un" placeholder="studentid" name='studentid' id="studentid"></input>
                   <div id='id1' class="error"></div>
                    </td>
                </tr>
                <tr>
                    <th>First Name:</th>
                    <td> <input type="text"  class="un"  placeholder="first name" name='fname' id="fname"></input>
                    <div id='id2' class="error"></div> 
                    </td>
                </tr>
                <tr>
                    <th>Last Name:</th>
                    <td> <input type="text"  class="un"  placeholder="last name" name='lname' id="lname"></input>
                     <div id='id3' class="error"></div> 
                    </td>
                </tr>
                <tr>
                    <th>Gender:</th>&nbsp &nbsp &nbsp
                    <td align="center"> <input type="radio"   name="gender" value="male" checked>Male</input>
                    <input type="radio" name="gender" value="female" >Female</input>
                    
                    </td>
                </tr>
                 <tr>
                        <th> Email id:</th>
                        <td> <input type="email"  class="un"  name='email'  placeholder="abcdefgh@gmail.com" id="email"></input>
                         <div id='id5' class="error"></div>
                        </td>
                </tr>
                <tr>
                    <th> Password:</th>
                    <td> <input type="password"  class="pass"  placeholder="password" name='password' id="password"  ></input>
                     <div id='id6' class="error"></div>
                    </td>
                </tr>
                 <tr>
                        <th> Date Of Birth:</th>
                        <td> <input type="date"  class="un"  name='dob'  id="dob"></input>
                        <div id='id7' class="error"></div>
                        </td>
                </tr>
                <tr>
                    <th>City:</th>
                    <td> <input type="text"  class="un"  name='city' id="city"  ></input>
                    <div id='id8' class="error"></div>
                    </td>
                </tr>
                <tr>
                    <th> State:</th>
                    <td> <input type="text"  class="un"  name='state' id="state"  ></input>
                    <div id='id9' class="error"></div>
                    </td>
                </tr>
                <tr>
                        <th> Contact no.: </th>
                        <td> <input type="text"  class="un"   name='phoneno'  id="phoneno"></input>
                        <div id='id10' class="error"></div> 
                        </td>
                </tr>
                <tr>
				<th>Upload Profile Image:</th>
				<td><input type="file" name="file" id="image"></td>
			</tr>
            
                
                <tr>
                        <tr></tr>
						<tr></tr>
								
						<td colspan="1"><a href="login.do" class="login">Login</a></td>
						<td colspan="1">
                        <input type="submit" class="submit" align="center" value="Sign Up">
                        
                        <!-- <input type="reset" value='Clear'> -->
                        </td>
						
                </tr>
                
            </table>

        </center>
    </Form>
    </div>
</body>
</html>