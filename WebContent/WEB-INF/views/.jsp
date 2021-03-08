<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<style>
.row-padding {
	margin-top: 25px;
	margin-bottom: 25px;
}
/* 사이드바 래퍼 스타일 */
#page-wrapper {
	padding-left: 250px;
}

  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 82%;
    margin-left: -250px;
    background: #fff;
    overflow-x: hidden;
    overflow-y: auto;
     border: 1px #DAD9FF solid;
    margin-top: 79px;

  
  }

#page-content-wrapper {
	width: 100%;
	padding: 20px;
	padding-top: 150px;
	margin-left: 130px;
}
/* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
    background:#808080;
  }
  .sidebar-nav li:first-child{ background:#4d4d4d}
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
    color:#fff
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #fff;
  }
  /*현재페이지*/
/*   .sidebar-nav :nth-child(2) a{ color: #fff;background: #B2EBF4; } */
  
  
  .sidebar-nav li:not(.sidebar-brand):hover {
    color: #fff;
    background: #B2EBF4;
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
	.sidebar-brand{
	background-color: #C2E2E8;
	font-weight: bold;
	margin-top:0px;
	margin-bottom: 0px;
	}

.info {
	font-size: 1.3em;
	line-height: 3em;
}

.color-red {
	color: red;
}

.table-wrapper .line {
	border-left: 1px solid #dadada;
}

.box-default {
	font-size: 15px;
	color: #115bab;
	background-color: #D5D5D5;
	height: 70px;
	text-align: center;
	line-height: 70px;
	width: 100%
}

.table-wrapper .table-default thead .write {
	text-align: left;
	color: #6e7179;
}

.table-wrapper .table-default tbody tr td {
	position: relative;
	padding-right: 0;
	padding-left: 0;
}

.table-wrapper .table-default tbody tr td .input-conut-limit {
	position: absolute;
	bottom: 9px;
	right: 22px;
}

.table-default tr th, .table-default tr td {
	font-size: 13px
}

.default-info-heading {
	margin-bottom: 20px;
}

.button-blue {
	background: #57a5df;
}

table {
	border-top: 3px #D5D5D5 solid;
	border-bottom: 3px #D5D5D5 solid;
	width: 100%;
	margin: 10px;
	height: 220px
}

.board-util-right {
	float: right;
	height: 50px
}

.board-util {
	height: 48px;
	top: 9px;
}

.board-util button {
	height: 48px;
	width: 100px
}

#regForm {
	width: 1200px
}

#contents {
	margin-top: 140px;
	padding-left: 200px;
	margin-bottom: 167px
}

caption {
	font-size: 15px;
	font-weight: bold;
}

@media all and (min-width:500px) and (max-width:1024px) {
	#sidebar-wrapper {
		left: -250px;
	}
	.main {
		left: -150px;
	}
	#page-wrapper {
		left: -150px;
		padding-left: 0px;
		margin-left: 0px
	}
	#app {
		display: none
	}
	#appdown {
		width: 90%;
		float: inherit;
		margin-left: 76px;
		margin-top: 0px
	}
	#contents {
		padding-left: 20px;
		margin-left: 20px
	}
	.board-util-right {
		float: left;
	}
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="page-wrapper" class="container-fluid">
		<div  id="sidebar-wrapper">

	  <h3 class="sidebar-brand" style="height: 90px;text-align: center;line-height: 90px;height: 120px">
    	<img style="width: 100%;height: 100%" src="<c:url value='/img/mypages.PNG'/>">
       </h3>
	<ul class="sidebar-nav">
	<li><span class="glyphicon glyphicon-leaf" style="left: -20px"><strong>김길동</strong>님</span></li>
      <li><a href="<c:url value='/mypage/mypage.hst'/>">개인정보</a></li>
      <li><a href="<c:url value='/mypage/Yun.hst'/>">복약 관리</a></li>
      <li><a href="<c:url value='/mypage/ReservationList.hst'/>">진료 예약 현황</a></li>
      <li><a href="#">내 질병 관리</a></li>
      <li><a href="<c:url value='/mypage/unmember.hst'/>">회원탈퇴</a></li>
    </ul>
  </div>
	</div>
	<div class="container">
		<div class="row" style="padding-top: 100px">
			<div class="col-lg-12">
				<div class="page-header">
					<h1>복약관리</h1>
				</div>
				<p>3세 이하 유아는 사용이 권장되지 않으며 임부는 반드시 의사와 사전에 상의하고 사용하도록 합니다</p>
			</div>
		</div>
	</div>
	<div class="demo">
		<div class="row text-center">
			<h1 class="heading-title">복약 GUIDE</h1>
		</div>
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a class="" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne"> Section 1
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">Lorem ipsum dolor sit amet</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo"> Section
									2 </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">Lorem ipsum dolor sit amet</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									Section 3 </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">Lorem ipsum dolor sit amet</div>
						</div>
					</div>
							<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									Section 4 </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">Lorem ipsum dolor sit amet</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>