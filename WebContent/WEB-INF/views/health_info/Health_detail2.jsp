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
<h1 style="text-align: center;font-size: 70px;color:#bc7ad6" id="Health_Title">간<small>liver</small></h1>

<div class="row" style="padding-top: 100px;" id="Main">
  <div class="col-md-12 small"><h3>질병</h3></div>
			<div class="col-md-12" style="padding-bottom: 50px;">간염, 유육종증,
				지방간, 알코올성 간 질환, 간암, 간경변증, 임신 중독증, 비호지킨 림프종, 윌슨병, 라이 증후군, 기타 신생아 황달,
				간흡충증, 간농양, 간혈관종 등</div>


			<div class="col-md-12"><h3>관련 검사</h3></div>
			<div class="col-md-12">간질환의 유무는 병력, 문진, 시진, 청진, 촉진, 타진 등의 진찰
				소견의 종합, 혈액검사, 간초음파나 컴퓨터 단층촬영(CT) 검사 등의 영상학적 검사 등 여러 가지를 종합하여 이루어진다.

				혈액검사로는 간기능검사와 간염바이러스에 대한 혈청학적 표지자(標識子) 검사가 중요하다. 간기능검사 중 AST,
				ALT(종래의 GOT, GPT)는 간염이 있을 때 손상된 간세포에서 유출되는 효소로서 간염의 정도를 대략 짐작하게 해주나
				간염의 정도를 정확히 반영하는 검사는 아니며 전반적인 추세를 보는 것이 중요하다. 알부민이나 빌리루빈은 간의 합성 기능을
				주로 반영하는 지표이며, 또한 간세포에서는 혈액응고인자들을 만드는 기능을 평가하는 프로트롬빈 시간(prothrombin
				time 또는 PT)은 혈액응고 시간을 직접 측정하는 검사이며, 잔여 간기능을 평가하는 지표 중의 하나이다.</div>
			<div class="col-md-12"><h3>소제목</h3></div>
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