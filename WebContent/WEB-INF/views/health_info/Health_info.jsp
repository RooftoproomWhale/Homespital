
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#Health_Info{
animation: fadein 1s;
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }   
}
.thumbnail{
width: 240px;
height: 260px;
margin: 2px;
}

#banner{

padding-top:100px;
width: auto;
height: auto;
position: absolute;


}
.Hover{
border: 1px solid #58a4f5; 

}

</style>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	//window.onload = function () {
		$(document).ready(function() {
		       $(".thumbnail").hover(
		           function() { $(this).addClass("Hover"); },
		           function() { $(this).removeClass("Hover"); }
		       );
		});
		
	//}
</script>
	

<div class="container" id="Health_Info">
	<a href="<c:url value="http://ncov.mohw.go.kr/guidelineList.do?brdId=6&brdGubun=61"/>">
	<img id="banner" src="<c:url value="/images/healthimg/사회적 거리두기.png"/>" style="position: relative;">
	</a>
	
	<div class="row" >
		<div class="col-md-8 col-md-offset-2" style="padding-top:50px;"id="basic1">
			<a href="<c:url value="/Homespital/Health_detail.hst"/>">
			<div class="thumbnail col-md-3">
				<img src="<c:url value="/images/healthimg/감기.jpg"/>" alt="..." style="width: auto; height: 180px;"/>
				<div class="caption">
					<h3>감기 관련</h3>
				</div>
			</div><!-- 썸네일 -->
			</a>
			<a href="<c:url value="/Homespital/Health_detail2.hst"/>">
			<div class="thumbnail col-md-3">
				<img src="<c:url value="/images/healthimg/간.jpg"/>" alt="..." style="width: auto; height: 180px;"/>
				<div class="caption">
					<h3>간 질환</h3>
				</div>
			</div>
			</a>
			<a href="<c:url value="/Homespital/Health_detail3.hst"/>">
			<div class="thumbnail col-md-3">
				<img src="<c:url value="/images/healthimg/신장.jpg"/>" alt="..." style="width: auto; height: 180px;"/>
				<div class="caption">
					<h3>신장 질환</h3>
				</div>
			</div>
		</a>
		
		</div>
		
		<div class="row" >
			<div class="col-md-8 col-md-offset-2"id="basic2" >
		<a href="<c:url value="/Homespital/Health_detail4.hst"/>">
		<div class="thumbnail col-md-3" style="position: relative;left: 10px;">
				<img src="<c:url value="/images/healthimg//대장.jpg"/>" alt="..." style="width: auto; height: 180px;"/>
				<div class="caption">
					<h3>대장 질환</h3>
				</div>	
			</div><!-- 썸네일 -->
			</a>
			<a href="<c:url value="/Homespital/Health_detail5.hst"/>">
			<div class="thumbnail col-md-3" style="position: relative;left: 10px;">
				<img src="<c:url value="/images/healthimg//비만.jpg"/>" alt="..." style="width: auto; height: 180px;"/>
				<div class="caption">
					<h3>비만/과체중</h3>
				</div>
			</div>
			</a>
			<a href="<c:url value="/Homespital/Health_detail6.hst"/>">
			<div class="thumbnail col-md-3" style="position: relative;left: 10px;">
				<img src="<c:url value="/images/healthimg//피부.jpg"/>" alt="..." style="width: auto; height: 180px;"/>
				<div class="caption">
					<h3>피부</h3>
				</div>
			</div>
			</a>
			</div>
		</div>
	</div>
</div>