<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.jag-faq-theme6 .jag-faq-wrapper{
	box-shadow: none;
}
.jag-faq-theme6 .jag-faq-title{
	background: #ffffff;
	color: #000;
	padding: 20px;
	font-size: 15px;
	margin-top: 15px;
	cursor: pointer;
	position: relative;
	border-radius: 50px;
}
.jag-faq-theme6 .jag-faq-title i{
	margin-right: 5px;
	font-size: 15px;
	color: #000;
	line-height: 20px;
}
.jag-faq-theme6 .panel-body img,
.jag-faq-theme6 .panel-body iframe,
.jag-faq-theme6 .panel-body video{
	margin: 10px;
}
/*Random Theme color*/
.jag-faq-theme6.jag-faq-random-colors .jag-faq-wrapper:nth-child(3n+2) .jag-faq-title{
	border-color: #ea3566;
}
.jag-faq-theme6.jag-faq-random-colors .jag-faq-wrapper:nth-child(4n+3) .jag-faq-title{
	border-color: #ea4e00;
}
.jag-faq-theme6.jag-faq-random-colors .jag-faq-wrapper:nth-child(5n+4)  .jag-faq-title{
	border-color: #00aac4;
}
/*Default Theme color*/
.jag-faq-theme6 .jag-faq-title{
	border: 1px solid #ff0044;
}
/*Theme orange*/
.jag-faq-theme6.jag-faq-theme-orange .jag-faq-title{
	border-color: #ea4e00;
}
/*Theme dark red*/
.jag-faq-theme6.jag-faq-theme-darkred .jag-faq-title{
	border-color: #c40000;
}
/*Theme pink*/
.jag-faq-theme6.jag-faq-theme-pink .jag-faq-title{
	border-color: #f90f90;
}
/*Theme blue*/
.jag-faq-theme6.jag-faq-theme-blue .jag-faq-title{
	border-color: #00aac4;
}
#footer{ 
	position: absolute; 
	width:100%; 
	left:0px; 
	bottom:0px; 
	background-color:#474747;
	height: 150px
} 
</style>
<meta charset="UTF-8">
<title>FAQ</title>
</head>
<body>
	<div class="container" style="padding-top: 88px">
		<div class="row">
			<main id="main">
				<div class="page-header">
					<h2 style="color: blue">FAQ</h2>
				</div>
				<p class="lead">회원님의 궁금증을 풀어드립니다.</p>
				<div class="col-md-12">
					<div class="panel-group jag-faq-theme6 jag-faq-theme-blue" id="jag-theme-6">
						<div class="panel jag-faq-wrapper">
							<div class="jag-faq-title" data-toggle="collapse" data-parent="#jag-theme-6" href="#collapse6_1">
								<i class="jag-faq-icon-2 fa fa-plus pull-right"></i> 게시판은 누구나 이용할 수 있나요?
							</div>
							<div id="collapse6_1" class="panel-collapse collapse">
								<div class="panel-body">
									저희 웹 사이트의 게시판은 <strong>누구나</strong> 이용할 수 있습니다.
								</div>
							</div>
						</div>
						<div class="panel jag-faq-wrapper">
							<div class="jag-faq-title" data-toggle="collapse" data-parent="#jag-theme-6" href="#collapse6_2">
								<i class="jag-faq-icon-2 fa fa-plus pull-right"></i> 고객센터 전화번호가 궁금해요
							</div>
							<div id="collapse6_2" class="panel-collapse collapse">
								<div class="panel-body">
									고객센터의 전화번호는 <strong>02)000-0000</strong> 입니다
								</div>
							</div>
						</div>
						<div class="panel jag-faq-wrapper">
							<div class="jag-faq-title" data-toggle="collapse" data-parent="#jag-theme-6" href="#collapse6_3">
								<i class="jag-faq-icon-2 fa fa-plus pull-right"></i> 회원 정보 수정은 어디에서 할 수 있나요?
							</div>
							<div id="collapse6_3" class="panel-collapse collapse">
								<div class="panel-body">
									회원 정보는 회원정보수정 페이지에서 수정하실 수 있습니다.
								</div>
							</div> 
						</div>
						<div class="panel jag-faq-wrapper">
							<div class="jag-faq-title" data-toggle="collapse" data-parent="#jag-theme-6" href="#collapse6_4">
								<i class="jag-faq-icon-2 fa fa-plus pull-right"></i> 회원 정보 수정은 어디에서 할 수 있나요?
							</div>
							<div id="collapse6_4" class="panel-collapse collapse">
								<div class="panel-body">
									회원 정보는 회원정보수정 페이지에서 수정하실 수 있습니다.
								</div>
							</div>
						</div>
						<div class="panel jag-faq-wrapper">
							<div class="jag-faq-title" data-toggle="collapse" data-parent="#jag-theme-6" href="#collapse6_5">
								<i class="jag-faq-icon-2 fa fa-plus pull-right"></i> 고객센터의 영업시간은 언제인가요
							</div>
							<div id="collapse6_5" class="panel-collapse collapse">
								<div class="panel-body">
									고객센터의 영업시간은 <strong>09:00 ~ 18:00</strong> 입니다.
								</div>
							</div>
						</div><br/>
						<a href="<c:url value='/Notice/QnA.hst'/>" class="btn btn-primary float-right">QnA</a>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
</html>