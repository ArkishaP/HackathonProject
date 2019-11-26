<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analysis Page</title>
<style>
.Container {
            text-align: left;
            
            justify-content: space-around;
            width: 30%;
            padding: 20px;
            background-color: rgba(255, 255, 255,0.1);
            margin: auto;
            margin-top: 3%;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            border-radius: 5px;
        }
 
 
        </style>
</head>
<body><%-- 
<%=${replist.report[5]}%> --%> 
<center>
<h1>Your Exam Analysis:</h1>

<p > </p>
<p></p>
<div class="Container">

<c:forEach items="${replist}" var="report">


<div class="correct">
<h3>Your Score ${report[5]} % :</h3>

<div  style="background-color: green; height: 60px; width:${report[5]*3}px"></div>
</div>
<br>
<br>
<div class="incorrect">
<h3>Error Percentage ${100-report[5]}% :</h3>

<div  style="background-color: red; height: 60px; width:${(100-report[5])*3}px"></div>
</div>
<br>
 </c:forEach> 

</div>
</center>
  

</body>


</html>