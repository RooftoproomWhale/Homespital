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
<h1 style="text-align: center;font-size: 70px;color:#bc7ad6" id="Health_Title">비만/과체중<small>obesity</small></h1>

<div class="row" style="padding-top: 100px;" id="Main">
  <div class="col-md-12 small"><h3>정의</h3></div>
  <div class="col-md-12" style="padding-bottom: 50px;">감기는 바이러스에 의해 코와 목
				부분을 포함한 상부 호흡기계의 감염 증상으로, 사람에게 나타나는 가장 흔한 급성 질환 중 하나이다. 재채기, 코막힘,
				콧물, 인후통, 기침, 미열, 두통 및 근육통과 같은 증상이 나타나지만 대개는 특별한 치료 없이도 저절로 치유된다.</div>
  
  
  <div class="col-md-12"><h3>원인</h3></div>
			<div class="col-md-12">오랜 기간에 걸쳐 에너지 소비량에 비해 영양소를 과다 섭취할 경우 에너지
				불균형에 의해 비만이 유발된다. 유전적으로 특정 유전자의 돌연변이에 의해 식욕 조절 중추 기능에 문제가 있거나,
				쿠싱증후군과 같은 내분비 질환, 식욕을 증가시키는 다양한 약제에 의해 발생하는 경우도 있으나, 일반적으로는 에너지 섭취량이
				에너지 소비량보다 커서 발생한다. 일반적인 비만의 경우 유전적 영향 및 환경적 영향이 복합적으로 작용하여 발생한다. 특히
				칼로리가 높은 식품이 풍부하고 신체 활동을 덜 해도 사는데 불편이 없는 현대의 생활환경이 비만의 폭발적 증가를 초래하고
				있다.</div>
<!-- 			<div class="col-md-12"><h3>소제목</h3></div> -->
<!--   <div class="col-md-12">내용...</div> -->
<!--   <div class="col-md-12"><h3>소제목</h3></div> -->
<!--   <div class="col-md-12">내용...</div> -->

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