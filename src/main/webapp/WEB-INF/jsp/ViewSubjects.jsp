<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="./resources/css/admin.css">
<style>

table{
		color:white;
		font-size:18px;
		
	}
	.ucontainer {
            text-align: center;
            width: 50%;
            padding: 30px;
            background-color: rgba(255, 255, 255,0.1);
            margin: auto;
            margin-top: 8%; 
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
      a{
      	color:white;
      }
      a:hover{
      	font-weight:bold;
      }
      th{
      	color: rgb(255, 165, 132);
      }
	
</style>
<title>Insert title here</title>
</head>
<body>
<div class="topnav">
   <%@include file="adminmenu.html" %>
</div>
<div class="ucontainer">
	<table cellspacing="20px">
		<tr>
			<th>Subject Id</th>
			<th>Subject Name</th>
			<th>Subject Level</th>
			<th>No. of questions</th>
			<th>Download</th>
			<th></th>
		</tr>
		<c:forEach items="${subjects }" var="subject">
			<tr>
				<td>${subject.subjectId}</td>
				<td>${subject.subjectName}</td>
				<td>${subject.difficulty}</td>
				<td>${subject.questions.size()}</td>
				<td><a href="">${subject.questionFile }</a></td>
				<td><a href="remove.do?subject=${subject.subjectId }">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>