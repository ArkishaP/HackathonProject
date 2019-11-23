<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="./resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[type='radio']").click(function(){
			$(".question-form").submit();
		});
	});
</script>
</head>
<body>

<%=session.getAttribute("subject") %>
<hr>
<div>
	${questionmap }<br>
	<c:set var="count" value="0"/>
	<c:forEach items="${subject.questions }" var="question">
		<form action="exam.do" method="POST">
			<input type="hidden" name="question" value="${subject.questions[count].questionId }"/>
			<input type="submit" value="${count+1 }"/>
		</form>
		<c:set var="count" value="${count+1 }"/>
<%-- 		<span><c:out value="${count }"/></span> --%>
	</c:forEach>
	<span></span>
</div>
<div>
	<form class="question-form" action="setanswer.do" method="POST">
	${question.question }<br>
	<input type="hidden" name="questionId" value="${question.questionId }"/>
	<input type="radio" name="option" value="${question.option1 }">${question.option1 }
	<input type="radio" name="option" value="${question.option2 }">${question.option2 }
	<input type="radio" name="option" value="${question.option3 }">${question.option3 }
	<input type="radio" name="option" value="${question.option4 }">${question.option4 }
	</form>
</div>
${question }
<br>
<a href="report.do">Finish Exam</a>
<%-- ${subject }
${student }<br>
${exam }<br>
${questions }
<hr>
<form method="POST">
<c:forEach items="${questions }" var="qrecord">
<div>
	<label>${qrecord.question}</label>
	<input type="radio" name="option" value="${qrecord.option1 }">${qrecord.option2 }
	<input type="radio" name="option" value="${qrecord.option2 }">${qrecord.option2 }
	<input type="radio" name="option" value="${qrecord.option3 }">${qrecord.option3 }
	<input type="radio" name="option" value="${qrecord.option4 }">${qrecord.option4 }
	<input type="submit" value="answer">
</c:forEach>
</div>
</form> --%>
</body>
</html>