<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="./resources/css/admin.css">
<title>Admin Dashboard</title>
<style>
  body{
    background-color: rgba(0, 0, 0, 0.849);
  }
.wrapper {
  display: grid;
  grid-template-columns: repeat(2, 2fr);
  grid-template-rows: repeat(2, 2fr);
  grid-gap: 25px;
  padding: 6% 9% 0;
  /* grid-auto-rows: minmax(100px, auto); */
  /* background-color: #2196F3; */
  border-radius: 12px;
  /* box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24); */
}
.one {
  grid-column: 1 ;
  grid-row: 1;

  text-align: center;
  padding: 15%;
  font-size: 40px;

  background-color: rgba(16, 124, 212, 0.2);
  transition: background-color .5s;

  border-radius: 10px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.two { 
  grid-column: 2 ;
  grid-row: 1;

  text-align: center;
  padding: 15%;
  font-size: 40px;
  background-color: rgba(217, 255, 0, 0.2);
  border-radius: 10px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.three {
  grid-column: 1;
  grid-row: 2;

  text-align: center;
  padding: 15%;
  font-size: 40px;
  background-color: rgba(255, 77, 7, 0.2);
  border-radius: 10px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.four {
  grid-column: 2;
  grid-row: 2;

  text-align: center;
  padding: 15%;
  font-size: 40px;
  background-color: rgba(185, 0, 0, 0.2);
  border-radius: 10px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

div #boom:hover{
    background-color: rgb(209, 208, 199);

}
a{
  text-decoration: none;
  color: black;
}
.logout {
  text-align: left;
  
  color:blanchedalmond
}

</style>
</head>
<body>
<a class="logout" href="logout.do">Log out</a>
    <br>


<div class="wrapper">
    <div class="one" id="boom">
        <a href="welcome.do">Add Question</a>
    </div>
    <div class="two" id="boom">
        <a href="#">Remove Question</a>
    </div>
    <div class="three" id="boom">
        <a href="#">Search Students</a>
    </div>
    <div class="four" id="boom">
        <a href="#">Admin Approval</a>
    </div>
    

  </div>

<%-- <div class="topnav">
   <%@include file="adminmenu.html" %>
</div> --%>

</body>
</html>