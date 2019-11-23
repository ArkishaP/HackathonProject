<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-- The exam is for ${exam} --%>
${subject.difficulty }
The exam will be of ${subject.duration } minutes.
${subject.subjectId }
<form action="exam.do" method="POST">
	<input type="hidden" name="question" value="${subject.questions[0].questionId }">
	<br>
	<input type="submit" value="Start Exam">
</form>
</body>
</html>