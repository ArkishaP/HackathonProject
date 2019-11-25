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
$(window).on('pageshow', function() {
	var test = $(".question").val();
	var option = "${questionmap[question.questionId]}";
	switch (option) {
	  case $('#option1').val():
		  console.log("option1");
		$("#option1").prop('checked', true);
	    break;
	  case $('#option2').val():
		  console.log("option2");
			$("#option2").prop('checked', true);
		    break;
	  case $('#option3').val():
		  console.log("option3");
			$("#option3").prop('checked', true);
		    break;
	  case $('#option4').val():
		  console.log("option4");
			$("#option4").prop('checked', true);
		    break;
	}
	console.log(test);
	console.log(option);
});
	$(document).ready(function(){
		//countdown timer - seconds
		var starttime = ${startTime};
		var interval = setInterval(function() {
		var timer = timer2.split(':');
		//by parsing integer, I avoid all extra string processing
		var minutes = parseInt(timer[0], 10);
		var seconds = parseInt(timer[1], 10);
	 	--seconds;
	 	minutes = (seconds < 0) ? --minutes : minutes;
	 	if (minutes < 0) clearInterval(interval);
	 	seconds = (seconds < 0) ? 59 : seconds;
	 	seconds = (seconds < 10) ? '0' + seconds : seconds;
	 	//minutes = (minutes < 10) ?  minutes : minutes;
	 	$('#countdown').html(minutes + ':' + seconds);
	 	timer2 = minutes + ':' + seconds;
		}, 1000);
		$(".questiono-form").submit(function(e){
			e.preventDefault();
			
			$(".questionId").val($(".question").val());
			$(".response").val($("input[name=option]:checked").val());
			this.submit();
		});
	});
	

	jQuery(function ($) {
	    var fiveMinutes = 5,
	        display = $('#countdown');
	    startTimer(fiveMinutes, display);
	});
</script>
</head>
<body>
<%=session.getAttribute("subject") %>
<%
	
%>
<hr>
<div>
	${questionmap }<br>
	<c:set var="count" value="0"/>
	<c:forEach items="${subject.questions }" var="question">
		<form action="exam.do" method="POST" class="questiono-form">
			<input type="hidden" name="question" value="${subject.questions[count].questionId }"/>
			<input type="hidden" name="questionId" class="questionId" value=""/>
			<input type="hidden" name="response" class="response" value=""/>
			<input type="submit" value="${count+1 }"/>
		</form>
		<c:set var="count" value="${count+1 }"/>
	</c:forEach>
</div>
<hr>
<div id="countdown"></div>
<hr>
<div>
<!-- 	<form class="question-form" action="setanswer.do" method="POST"> -->
	${question.question }<br>
	<input type="hidden" name="questionId" class="question" value="${question.questionId }"/>
	<input type="radio" name="option" id="option1" value="${question.option1 }">${question.option1 }
	<input type="radio" name="option" id="option2" value="${question.option2 }">${question.option2 }
	<input type="radio" name="option" id="option3" value="${question.option3 }">${question.option3 }
	<input type="radio" name="option" id="option4" value="${question.option4 }">${question.option4 }
<!-- 	</form> -->
</div>
${question }
<br>
<a href="finishexam.do" class="finish">Finish Exam</a>

</body>
</html>