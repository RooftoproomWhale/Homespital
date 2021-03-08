<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#Health_Title{
animation-name: fadein;
animation-duration: 2s;
}

#Main{
animation-name: fadein;
animation-duration: 2s;
/* animation-delay:2s; */
animation-fill-mode: forwards;
 
}
@keyframes fadein {
    from {
        opacity:0;
    }
    
    to {
        opacity:1;
    
    }   
}


 #rightBar {
 font-size: 18px;
 animation: slide 2s;
 }
 @keyframes slidein {
  from {
    padding-left: 100%;
  }

  to {
    padding-left: 0%;
  }
}
.rightChild{
margin: 5px;
}

h3{
color: #66cfff;
}

</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		  $(".rightChild").hover(
		           function() { $(this).addClass("Hover"); },
		           function() { $(this).removeClass("Hover"); }
		       );
		
	});
</script>
<div class="container" id="Health_Detail">
<div class="col-md-6 col-md-offset-2" style="padding-top: 250px; border-right: 1px solid gray;"id="mainbar">
<h1 style="text-align: center;font-size: 70px;color:#bc7ad6" id="Health_Title">대장<small>intestine</small></h1>

<div class="row" style="padding-top: 100px;" id="Main">
  <div class="col-md-12 small"><h3>관련 질병</h3></div>
			<div class="col-md-12" style="padding-bottom: 50px;">대장암, 대장용종,
				과민성장증후군, 궤양성대장염 및 크론병, 결핵성장염, 감염성 설사 및 대장염, 혈관성장질환, 대장게실증, 장폐쇄</div>


			<div class="col-md-12"><h3>관련 검사</h3></div>
			<div class="col-md-12">단순복부촬영, 대장바륨조영술, 대장내시경검사, 대장통과시간검사,
				직장항문내압검사, 풍선배출검사, 배변조영술</div>
			<div class="col-md-12"><h3>소제목</h3></div>
  <div class="col-md-12">내용...</div>
  <div class="col-md-12"><h3>소제목</h3></div>
  <div class="col-md-12">내용...</div>

</div>
</div>

<div class="col-md-3 " style="padding-top: 250px; border-bottom: 1px solid gray;">
	<div id="rightBar" class="row" >
 <div class="col-md-12 rightChild">대장 질환</div>
 <div class="col-md-12 rightChild">간 질환</div>
 <div class="col-md-12 rightChild">비만</div>
 <div class="col-md-12 rightChild">피부</div>
	
	
	</div>
</div>
</div>