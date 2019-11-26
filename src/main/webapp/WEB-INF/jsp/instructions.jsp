<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="./resources/css/exam.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="min-height:'500px'">
		<div>${subject.subjectName } ${subject.difficulty }</div>
		The exam will be of ${subject.duration } minutes.
		<div>Best of luck!</div>
		<a href="startexam.do" class="btn">Start Exam</a>
	</div>
</body>
</html>