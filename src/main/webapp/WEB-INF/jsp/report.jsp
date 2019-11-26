
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="css/mycss.css">

<title>Report</title>
</head>
<style>
body{
	margin:0;
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
<body bgcolor="aliceblue">
<script>
function myf1(){
	
	window.location="register.do";
	
}
function myf2(){
	
	window.location="login.do";
	
}
function myfun(){
	
	window.location="viewGraph.do";
	
}

</script>
 <header class="topnav">
        <nav>
        <a href="studentlogout.do" style="width:auto;float:right; font-weight:bold">Logout</a>
        <a href="dashboard.do" style="width:auto;float:right;float:top; font-weight:bold">New Exam</a>
        <a href="changepassword.do" style="width:auto;float:right;float:top; font-weight:bold">Change Password</a>
        </nav>
    </header>

<center><h2>WELCOME TO STUDENT'S REPORT</h2>
 <hr size="4" color="gray"/>
 

<table>
<tr>
<th><b>Student ID </b></th>
<th><b>Student Name </b></th>
<th><b>Subject Name </b></th>
<th><b>Level </b></th>
<th><b>Score </b></th>
<th><b>View Graph</b></th>
</tr>

<c:forEach items="${replist}" var="report">
  
 <tr>   
<td>${report[0]}</td>
<td>${report[1]}</td> 
<td>${report[2]}</td> 
<td>${report[3]}</td> 
<td>${report[5]}</td> 
<td><button type="submit"  name="b3" id="b3" onclick="myfun();">View Graph</button>

</tr>  
               
</c:forEach> 
</table>
</center>
</body>
</html>
