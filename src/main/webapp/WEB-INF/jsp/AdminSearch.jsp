<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
					div {
						width: 50%;
						height: 50%;
						padding: 10px;
						border: 5px solid gray;
						margin: 0;
						text-align: center;
					  }
					</style>

</head>
		<body>
		<center>
				SEARCH STUDENTS
		<div>
			<form action="adminSearch.do" method="POST"  >

				Subject Name:
				    <select name="subName">	
				    	<c:forEach items="${subName }" var="sub">
				    	<option value="${sub}">${sub}</option>
				    	</c:forEach>
			   			 </select>
					
			    Level :
						 <select name="difficulty">
                            <c:forEach items="${difficulty}" var="diff">
							<option value="${diff}">${diff}</option>
				    	    </c:forEach>
			   			     </select>	
			    Score :
			                  <input type="number" name="score" id= "score"> <br>
							  <input type="submit" name="search" value="Search Students">
							</div>
							</cforEach>
							</form>
						</center>
		</body>
</html>