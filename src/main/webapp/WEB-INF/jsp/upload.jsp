<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding Question..</title>
<link rel="stylesheet" href="./resources/css/admin.css">
<script type="text/javascript" src="./resources/js/jquery.min.js"></script>
<style type="text/css">
 .btn{
            border: 0.5px solid rgb(121, 116, 116);
            border-radius: 20px;
            width: 80%;
            height: 30px;
            color:rgb(21, 80, 207);
            /* background-color: white; */
            
        }
         button:hover{
            background-color: #ddd;
            background-color: black;
            color:rgb(253, 253, 253);

        }
        .ucontainer {
            text-align: center;
            width: 30%;
            padding: 30px;
            background-color: rgba(255, 255, 255,0.1);
            margin: auto;
            margin-top: 8%; 
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

.error{
    color: crimson;
}
.form-element input, select {
            display: block;
            width: 80%;
            height: 30px;
            margin: auto;
            background-color: rgb(235, 232, 232);
            border-radius: 20px;
        }
</style>
<script>

function valid(event){
		event.preventDefault();
		var flag=true;
		var subid=document.getElementById('subid').value;
	    var subname=document.getElementById('subname').value;
	    var level=document.getElementById('level').value;
	    var time=document.getElementById('time').value;
	    var file=document.getElementById('file').value;
		var id1=document.getElementById('id1');
	    var id2=document.getElementById('id2');
	    var id3=document.getElementById('id3');
	    var id4=document.getElementById('id4');
	    var id5=document.getElementById('id5');
	    
	    subidregex=/^[A-Z]{3}[1-3]{1}$/
	    
	    if(subid=='')
	    {
	       id1.innerHTML='plz fill Subject Id';
	       flag=false;

	    }
	    if(subname=='')
	    {
	       id2.innerHTML='plz fill subject name';
	       flag=false;

	    }
	       if(time=='')
	    {
	       id3.innerHTML='plz fill level';
	       flag=false;

	    }
	    if(file=='')
	    {
	       id4.innerHTML='plz fill time';
	       flag=false;

	    }
	    if(file=='')
	    {
	       id5.innerHTML='plz fill file ';
	       flag=false;

	    }
	    this.submit();
	    return flag;
}	

</script>
</head>
<body>
<div class="topnav">
   <%@include file="adminmenu.html" %>
</div>
<div class="ucontainer">
	<h1>Upload Question Paper</h1>

	<form class="upload-form" method="POST" action="${pageContext.request.contextPath}/upload.do" enctype="multipart/form-data">
	
	<div class="form-element">
	Set Subject Id:
	<input type="text" name="subid" id="subid" placeholder="Subject Id">
	<div id='id1' class="error"></div>
	</div>
	<br>
	<div class="form-element">
	Give Subject Name:
	<input type="text" name="subname" id="subname" placeholder="Subject name">
	<div id='id2' class="error"></div>
	</div>
	<br>
	<div class="form-element">
	Set Difficulty:
	<select name="level">
		<option value="Level 1">Level 1</option>
		<option value="Level 2">Level 2</option>
		<option value="Level 3">Level 3</option>
	</select>
	<div id='id3' class="error"></div>
	</div>
	<br>
	<div class="form-element">
	Set Duration:
	<input type="text" name="time" id="time" placeholder="Total minutes">
	<div id='id4' class="error"></div>
	<br>
	</div>
	
	<p Style="text-align: inherit;">Upload Question file:</p>	
	
	<input type="file" name="file" class="btn" id="file">
	<div id='id5' class="error"></div>
	<br>
	 <button type="submit" class="btn">Submit</button>
</form>
	
	<div style="font-style: italic; color: red;">${message}</div>	
	
</div>
</body>
</html>