<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="./resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("form").submit();
	});
</script>
</head>
<body>
${subject }
<form action="exam.do" method="POST">
	<input type="hidden" name="question" value="${subject.questions[0].questionId }">
	<br>
	<input type="submit" value="">
</form>
</body>
</html>