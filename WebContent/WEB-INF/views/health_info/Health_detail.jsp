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

#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	margin-top: 1000px;
	background-color: #474747;
	height: 150px
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
		<h1 style="text-align: center; font-size: 70px; color: #bc7ad6" id="Health_Title">
			감기<small>Flu</small>
		</h1>

		<div class="row" style="padding-top: 100px;" id="Main">
			<div class="col-md-12 small">
				<h3>증상</h3>
			</div>
			<div class="col-md-12" style="padding-bottom: 50px;">감기는 바이러스에
				의해 코와 목 부분을 포함한 상부 호흡기계의 감염 증상으로, 사람에게 나타나는 가장 흔한 급성 질환 중 하나이다. 재채기,
				코막힘, 콧물, 인후통, 기침, 미열, 두통 및 근육통과 같은 증상이 나타나지만 대개는 특별한 치료 없이도 저절로
				치유된다.
			</div>
			<div class="col-md-12">
				<h3>원인</h3>
			</div>
			<div class="col-md-12">200여개 이상의 서로 다른 종류의 바이러스가 감기를 일으킨다. 그 중
				30~50%가 리노바이러스(Rhinovirus)이고 10~15%가 코로나바이러스(Coronavirus)이다. 성인은 일
				년에 2~4회, 소아는 6~10회 정도 감기에 걸린다. 감기 바이러스는 사람의 코나 목을 통해 들어와 감염을 일으킨다.
				감기 바이러스를 가지고 있는 환자의 코와 입에서 나오는 분비물이 재채기나 기침을 통해 외부로 나오게 되면 그 속에 있는
				감기 바이러스가 공기 중에 존재하다가 건강한 사람의 입이나 코에 닿아 전파된다.
			</div>
			<div class="col-md-12">
				<h3>예방</h3>
			</div>
			<div class="col-md-12">200여개 이상의 서로 다른 종류의 바이러스가 감기를 일으킨다. 그 중
				30~50%가 리노바이러스(Rhinovirus)이고 10~15%가 코로나바이러스(Coronavirus)이다. 성인은 일
				년에 2~4회, 소아는 6~10회 정도 감기에 걸린다. 감기 바이러스는 사람의 코나 목을 통해 들어와 감염을 일으킨다.
				감기 바이러스를 가지고 있는 환자의 코와 입에서 나오는 분비물이 재채기나 기침을 통해 외부로 나오게 되면 그 속에 있는
				감기 바이러스가 공기 중에 존재하다가 건강한 사람의 입이나 코에 닿아 전파된다.
			</div>
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