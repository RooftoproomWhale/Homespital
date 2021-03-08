<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#Health_Title {
	animation-name: fadein;
	animation-duration: 2s;
}

#Main {
	animation-name: fadein;
	animation-duration: 2s;
	/* animation-delay:2s; */
	animation-fill-mode: forwards;
}

@
keyframes fadein {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
#rightBar {
	font-size: 18px;
	animation: slide 2s;
}

@
keyframes slidein {from { padding-left:100%;
	
}

to {
	padding-left: 0%;
}

}
.rightChild {
	margin: 5px;
}

h3 {
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
		$(".rightChild").hover(function() {
			$(this).addClass("Hover");
		}, function() {
			$(this).removeClass("Hover");
		});

	});
</script>
<div class="container" id="Health_Detail">
	<div class="col-md-6 col-md-offset-2"
		style="padding-top: 250px; border-right: 1px solid gray;" id="mainbar">
		<h1 style="text-align: center; font-size: 70px; color: #bc7ad6"
			id="Health_Title">
			신장<small>kidney</small>
		</h1>

		<div class="row" style="padding-top: 100px;" id="Main">
			<div class="col-md-12 small">
				<h3>관련 질병</h3>
			</div>
			<div class="col-md-12" style="padding-bottom: 50px;">급성 콩팥
				손상(급성 신부전), 만성 콩팥병(만성 신부전), 말기 만성 신부전, 만성 사구체신염, 급속 진행성 사구체신염, 급성
				사구체신염, 급성 신장염, 급성 간질성 신염, 만성 간질성 신염, 혈뇨, 단백뇨, 무증상성 요이상, 신증후군, 급성
				신우신염, 요세관 결손, 유전성 신질환, 신장 결석, 수신증, 신성 요붕증, 신세포암, 이행상피세포암, 혈관근지방종,
				상염색체우성 다낭신종, 단순 낭종, 신장 결핵 등</div>


			<div class="col-md-12">
				<h3>관련 검사</h3>
			</div>
			<div class="col-md-12">요검사, 생화학 검사, 단순촬영, 배설성 요로조영술, 역행성 신우조영술,
				선행성 신우조영술, 신장 초음파검사, 컴퓨터 단층촬영(CT), 핵의학적 검사, 콩팥 조직검사 등</div>
<!-- 			<div class="col-md-12"> -->
<!-- 				<h3>소제목</h3> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-12">내용...</div> -->
<!-- 			<div class="col-md-12"> -->
<!-- 				<h3>소제목</h3> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-12">내용...</div> -->

		</div>
	</div>

	<div class="col-md-3 "
		style="padding-top: 250px; border-bottom: 1px solid gray;">
		<div id="rightBar" class="row">
			<div class="col-md-12 rightChild">대장 질환</div>
			<div class="col-md-12 rightChild">간 질환</div>
			<div class="col-md-12 rightChild">비만</div>
			<div class="col-md-12 rightChild">피부</div>


		</div>
	</div>
</div>