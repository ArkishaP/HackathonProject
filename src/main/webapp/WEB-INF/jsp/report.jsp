
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">

<title>Report</title>
</head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
<body bgcolor="#FDF5E6">
<script>
function myf1(){
	
	window.location="register.do";
	
}
function myf2(){
	
	window.location="login.do";
	
}

</script>
<a href="studentlogout.do">Logout</a>
<button type="submit" name="home" id="b1" value="text" style="float:left" onclick="myf1();">HOME</button>
<button type="submit" name="logout" id="b2" value="text" style="float:right" onclick="myf2();">LOGOUT</button>

<center><h2>WELCOME TO STUDENT'S REPORT</h2>
 <hr size="4" color="gray"/>
 

<table>
<tr>
<th><b>Student ID </b></th>
<th><b>Student Name </b></th>
<th><b>Subject Name </b></th>
<th><b>Level </b></th>
<th><b>Report ID </b></th>
<th><b>Score </b></th>
<th><b>Exam ID </b></th>
<th><b>Certificate</b>
</tr>

<c:forEach items="${replist}" var="report">
  
 <tr>   
<td>${report[0]}</td>
<td>${report[1]}</td> 
<td>${report[2]}</td> 
<td>${report[3]}</td> 
<td>${report[4]}</td>
<td>${report[5]}</td> 
<td>${report[6]}</td>
 <td><button type="submit" value="download" id="download">DOWNLOAD</button>

</tr>  
               
</c:forEach> 
</table>
</center>
</body>
</html>
