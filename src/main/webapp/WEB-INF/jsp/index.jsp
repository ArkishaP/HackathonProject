<html>
<head>
<link rel="stylesheet" href="./resources/css/style.css">
<script type="text/javascript" src="./resources/js/jquery.min.js"></script>
<style>
body{
  font: 15px/1.5 Arial, Helvetica,sans-serif;
  padding:0;
  margin:0;
  background-color:#f4f4f4;
}
header{
  background:#35424a;
  color:#ffffff;
  padding-top:10px;
  min-height:70px;
  border-bottom:aliceblue 3px solid;
}
.upper{
  float:left;
  display:inline;
  padding: 0 20px 0 20px;
  color:#ffffff;
  
  text-transform: uppercase;
  font-size:14px;
  cursor: pointer;
}

header #branding{
  float:left;
}

header #branding h1{
  margin:0;
}
header .highlight {
  color:aliceblue;
  font-weight:bold;
}
  header #branding{
  float:left;
}

header #branding h1{
  margin:0;
}



header nav{
	float:right;
  margin-top:10px;
}


ul{
  margin:0;
  padding:0;
}
 

#showcase{
  min-height:490px;
  background:url('./resources/img/showcase.jpg') no-repeat 0 -400px;
  text-align:center;
  color:#ffffff;
}

#showcase h1{
  margin-top:105px;
  font-size:40px;
  margin-bottom:10px;
}

#showcase p{
  font-size:20px;
}

#showcase2{
  min-height:450px;
  
  text-align:left;
  
}

#showcase2 h2{
  margin-top:25px;
  font-size:30px;
  margin-bottom:10px;
}

#showcase2 p{
  font-size:20px;
}
.container {
    width:95%;
  margin:auto;
  overflow:hidden;
    
}

.imgcontainer {
    align: center;
	width: 20%;
	hieght:50%;
    margin: 24px 0 12px 0;
    position: right;
}


.container {
    padding: 16px;
}

footer{
  padding:1px;
  margin-top:1px;
  color:black;
  font-weight:bold;
  background-color:aliceblue;
  text-align: center;
}

</style>
<script>
	$(document).ready(function(){
		$(window).on("pageshow",function(){
			window.location="index.do";
		})
	})
</script>
</head>
<body>
 <header class="topnav">
      <div class="container">
        <div id="branding">
          <h1><span class="highlight">Hack</span>Athon</h1>
        </div>
        <nav>
 <a href="login.do" style="width:auto; font-weight:bold">Login</a>
			&nbsp;
	<a href= "register.do" style="width:auto; font-weight:bold">Sign Up</a>
        
        </nav>
      </div>
    </header>

<section id="showcase">
      <div class="container">
        <h1>Online Examination System</h1>
		
        <p>Giving exams is easy and its fully online based. </p>
        <a href="login.do" class="btn">Give Exam Now!!</a>
      </div>
    </section>
<!-- <section id="showcase2">
	<div class="container">
		<h2>Course Wise Exam <img src="./resources/img/exam.jpg" align="center" class="imgcontainer"></h2>
		<p>Exams will be on individual courses.</p>
	</div>
</section> -->

<footer>
      <p>Hackathon group</p>
</footer>
	
 
 </body>
</html>
