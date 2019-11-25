<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Searched Student</title>
</head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>

<body bgcolor="#FFF0F5">
<script>
function myfun(){
	window.location="adminLogin.do";
}

</script>
<button type="submit" name="logout" id="b2" value="text" style="float:right" onclick="myfun();">LOGOUT</button>
<center><h1>---:SEARCHED STUDENT REPORT:--</h1>

<table>

<tr>
<th><b>Student ID </b></th>
<th><b>Student's First Name </b></th>
<th><b>Gender </b></th>
<th><b>Email</b></th>
<th><b>DOB </b></th>
<th><b>City </b></th>
<th><b>State </b></th>
<th><b>Contact No. </b></th>
<th><b>Subject Name </b></th>
<th><b>Difficulty </b></th>
<th><b>Exam ID </b>
<th><b>Date of Exam </b></th>
<th><b>Time taken </b></th>
<th><b>Score </b></th>

</tr>

<c:forEach items="${stlist}" var="search">
  
 <tr>   
<td>${search[0]}</td> 
<td>${search[1]}</td> 
<td>${search[2]}</td> 
<td>${search[3]}</td> 
<td>${search[4]}</td>
<td>${search[5]}</td> 
<td>${search[6]}</td>
<td>${search[7]}</td>
<td>${search[8]}</td>
<td>${search[9]}</td>
<td>${search[10]}</td>
<td>${search[11]}</td>
<td>${search[12]}</td>
<td>${search[13]}</td> 

</tr>  
               
</c:forEach> 
</table>


</center>

</body>
</html>