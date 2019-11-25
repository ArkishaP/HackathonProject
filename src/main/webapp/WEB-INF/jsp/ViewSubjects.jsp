<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
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
</body>
</html>