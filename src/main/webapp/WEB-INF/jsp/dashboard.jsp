<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/exam.css">
<title>Insert title here</title>
<style>
	.error{
		color:red;
		font-size:14px;
		font-style:italic;
	}
</style>
</head>
<body>
 <header class="topnav">
        <nav>
        <a href="studentlogout.do" style="width:auto;float:right; font-weight:bold">Logout</a>
        <a href="report.do" style="width:auto;float:right;float:top; font-weight:bold">Report</a>
        <a href="changepassword.do" style="width:auto;float:right;float:top; font-weight:bold">Change Password</a>
        </nav>
    </header>

<div class="container">
<div class="error">${message }</div>
	<div><h1>Select exam</h1></div>
    <div class="grid-container">
    	<c:forEach items="${subjects}" var="subject">
		<a href="instruction.do?subject=${subject}">
        	<div class="grid-item">
            	<h2>${subject}</h2>
            </div>
		</a>
		</c:forEach>
	</div>
</div>
</body>
</html>