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
<h1 style="text-align: center;font-size: 70px;color:#bc7ad6" id="Health_Title">피부 관리<small>Skin care</small></h1>

<div class="row" style="padding-top: 100px;" id="Main">
  <div class="col-md-12 small"><h3>관련 질병</h3></div>
			<div class="col-md-12" style="padding-bottom: 50px;">습진성 피부질환,
				홍반, 두드러기, 약발진, 구진인설질환, 곤충 및 기생충 매개 질환, 표재성 피부 진균증, 세균 감염 질환, 바이러스
				질환, 성인성 질환, 자가면역 수포성 질환, 결체조직 질환, 색소이상증, 여드름, 주사, 피부 종양 등</div>


			<div class="col-md-12"><h3>관련 검사</h3></div>
			<div class="col-md-12">확대경 검사, 우드등 검사, 압시경검사, KOH 도말 검사, 그램
				염색법, 챙크 검사, 옴 소파 검사, 암시야 검사, 배양검사, 피부 생검, 면역 형광 검사, 전자 현미경 검사, 피부 반응
				검사 등</div>
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