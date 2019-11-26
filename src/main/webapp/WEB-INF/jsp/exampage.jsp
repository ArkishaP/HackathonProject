<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/exam.css">
	<script type="text/javascript" src="./resources/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(window).on('pageshow', function () {
			var min = ${startTimeMin};
			  var sec = ${startTimeSec};
			  sec = --sec;
			  setInterval(function() {
				  if(min<10){
					  $("#min").text("0"+min);
				  }else{
				  $("#min").text(min);
				  }if(sec<10){
					  $("#sec").text("0"+sec);
				  }else{
				  $("#sec").text(sec);
				  }
				  $(".question-container").show();
			    sec--;
			    if (sec <= 00) {
			      min--;
			      sec = 60;
			    if(min<0){
			    	window.location="finishexam.do";
			    }
			    }
			  }, 1000);
			  
			var test = $(".question").val();
			var option = "${questionmap[question.questionId]}";
			switch (option) {
				case $('#option1').val():
					$("#option1").prop('checked', true);
					break;
				case $('#option2').val():
					$("#option2").prop('checked', true);
					break;
				case $('#option3').val():
					$("#option3").prop('checked', true);
					break;
				case $('#option4').val():
					$("#option4").prop('checked', true);
					break;
			}
		});
		$(document).ready(function () {
			$(".question-container").hide();
			$(".finish").click(function (e) {
				$(".questiono-form").submit();
				$(".questionId").val($(".question").val());
				$(".response").val($("input[name=option]:checked").val());
			});
			
			$(".questiono-form").submit(function (event) {
				event.preventDefault();
				$(".questionId").val($(".question").val());
				$(".response").val($("input[name=option]:checked").val());
				$(".startTimeMin").val($("#min").text());
				$(".startTimeSec").val($("#sec").text());
				this.submit();
			});
			
		});
		 function preventBack(){window.history.forward();}
			  setTimeout("preventBack()", 0);
			  window.onunload=function(){null}; 
	</script>
	<style>
		.main{
			display: flex;
			height:400px;
		}
		.left-container{
			width:25%;
			display:grid;
			grid-template-columns: repeat(5, 20px);
			grid-gap:10px;
			border-right: 10px solid black;
		}
		.right-container{
			width:75%;
			border: 1px solid black;
		}
		 .num{
			height:30px;
			width:30px;
			border-radius:0;
		} 
		.num:hover{
			color:white;
			background-color:black;
		}
		.finish{
			border: 1px solid  black;
			font-weight:bold;
		}
		.question-name{
			font-size:20px;
		}
		#countdown{
			font-size:25px;
			float:right;
			float:bottom;
		}
	</style>
</head>

<body>
	<hr>
	<div class="container main">
		<div class="left-container">
			<c:set var="count" value="0" />
			<c:forEach items="${subject.questions }" var="question">
				<form action="exam.do" method="POST" class="questiono-form">
					<input type="hidden" name="question" value="${subject.questions[count].questionId }" />
					<input type="hidden" name="questionId" class="questionId" value="" />
					<input type="hidden" name="response" class="response" value="" />
					<input type="hidden" name="startTimeMin" class="startTimeMin" value=""/>
					<input type="hidden" name="startTimeSec" class="startTimeSec" value=""/>
					<input type="submit" value="${count+1 }" class="num" />
				</form>
				<c:set var="count" value="${count+1 }" />
			</c:forEach>
		</div>
		<div class="right-container">
		<div class="question-container">
			<div class="question-name">Question: ${question.question }</div>
			<input type="hidden" name="questionId" class="question" value="${question.questionId }" />
			<input type="radio" name="option" id="option1" value="${question.option1 }">${question.option1 }<br>
			<input type="radio" name="option" id="option2" value="${question.option2 }">${question.option2 }<br>
			<input type="radio" name="option" id="option3" value="${question.option3 }">${question.option3 }<br>
			<input type="radio" name="option" id="option4" value="${question.option4 }">${question.option4 }<br>
		</div>
			<div id="countdown">
				<span id="min"></span>:<span id="sec"></span>
			</div>
			
			<a href="finishexam.do" class="finish btn" style="position:absolute;bottom:20px">Finish Exam</a>
		</div>
	</div>

</body>

</html>