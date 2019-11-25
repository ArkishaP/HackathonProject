<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Searched Student</title>
</head>


<body>
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
<td>${report[0]}</td>
<td>${report[1]}</td> 
<td>${report[2]}</td> 
<td>${report[3]}</td> 
<td>${report[4]}</td>
<td>${report[5]}</td> 
<td>${report[6]}</td>
<td>${report[7]}</td>
<td>${report[8]}</td>
<td>${report[9]}</td>
<td>${report[10]}</td>
<td>${report[11]}</td>
<td>${report[12]}</td>
<td>${report[13]}</td>

</tr>  
               
</c:forEach> 
</table>




</body>
</html>