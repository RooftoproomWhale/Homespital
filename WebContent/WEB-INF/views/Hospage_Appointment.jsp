<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">

</script>
<head>
<style>
a:hover, a:focus {
	text-decoration: none;
	outline: none;
}

.demo {
	padding: 100px 0;
}

.heading-title {
	margin-bottom: 100px;
}

#accordion .panel {
	border: none;
	background: none;
	border-radius: 0;
	box-shadow: none;
}

#accordion .panel-heading {
	padding: 0;
}

#accordion .panel-title a {
	display: block;
	font-size: 16px;
	color: #9c88b9;
	padding: 17px 40px 17px 65px;
	background: #fff;
	border: 1px solid #f3f3f3;
	border-bottom: none;
	position: relative;
	transition: all 0.5s ease 0s;
}

#accordion .panel-title a.collapsed {
	background: #fafafa;
	color: #959595;
}

#accordion .panel-title a.collapsed:hover {
	color: #9c88b9;
}

#accordion .panel-title a:after, #accordion .panel-title a.collapsed:after
	{
	content: "\f068";
	font-family: FontAwesome;
	font-size: 15px;
	color: #fff;
	width: 45px;
	height: 100%;
	line-height: 54px;
	text-align: center;
	position: absolute;
	top: 0px;
	left: -1px;
	background: #9c88b9;
	transition: all .2s;
}

#accordion .panel-title a.collapsed:after {
	content: "\f067";
	color: #959595;
	background: #f4f4f4;
	transition: all 0.5s ease 0s;
}

#accordion .panel-title a.collapsed:hover:after {
	background: #9c88b9;
	color: #fff;
}

#accordion .panel-title a:before {
	content: "";
	position: absolute;
	bottom: -11px;
	left: -1px;
	border-bottom: 12px solid transparent;
	border-right: 12px solid #9c88b9;
}

#accordion .panel-title a.collapsed:before {
	display: none;
}

#accordion .panel-body {
	font-size: 14px;
	color: #b7b7b7;
	padding: 0 65px 15px;
	line-height: 20px;
	margin-left: 12px;
	background: #fff;
	border: 1px solid #f3f3f3;
	border-top: none;
}
</style>
<title>복약관리</title>
</head>
<body>
	<div class="container-fluid">
		<div class="col-md-2"></div>
		<div class="col-md-9">
			<div class="row" style="padding-top: 100px; padding-left: 70px;">
				<div class="page-header">
					<h2 style="color: #2671d4">예약 대기 현황</h2>
				</div>
				<p style="color: red;"></p>
			</div>
			<br />
			<div class=" col-sm-12" style="padding-left: 70px;">
				<!-- 					MAIN CONTENT -->
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<!-- DATA TABLE -->
							<div class="table-data__tool">
								<div class="table-data__tool-left">
									<div class="rs-select2--light rs-select2--sm">
										
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>
							<div class="table-responsive table-responsive-data2">
								<table class="table table-data2">
									
									<thead>
										<tr>
											<th>예약번호</th>
											<th>이름</th>
											<th>이메일</th>
											<th>전화번호</th>
											<th>신청한 시간</th>
											<th>승인 여부</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${mem }" varStatus="loop">
										<form method="post">
										<tr class="tr-shadow">
											<td>${res[loop.index].RESERV_NO }</td>
											<input type="hidden" name="res${loop.index }" value="${res[loop.index].RESERV_NO }"/>
											<td>${item.mem_name}</td>
											<td><span class="block-email" >${item.mem_email}</span></td>
											<td class="desc">${item.tel}</td>
											<td>${res[loop.index].RES_DATE} ${res[loop.index].RES_TIME}</td>
											<c:if test="${res[loop.index].APPROVED == '승인됨'}">  
											<td><span class="status--process">승인</span></td>
											</c:if>
											<c:if test="${res[loop.index].APPROVED == '승인대기중'}">  
											<td><span style="color: #ffaa21;" >대기중</span></td>
											</c:if>
											<c:if test="${res[loop.index].APPROVED == '거절됨'}">  
											<td><span class="status--denied">거절됨</span></td>
											</c:if>
											
											
											<td>
												<div class="table-data-feature">
													<c:if test="${res[loop.index].APPROVED == '승인대기중'}">  
													<button class="item" type="submit" data-toggle="tooltip" formaction="<c:url value="/Hospage/Approved.hst"/>"
														data-placement="top" title="승인">
														<i class="zmdi zmdi-mail-send"></i>
													</button>
													
													<button class="item" type="submit" data-toggle="tooltip" formaction="<c:url value="/Hospage/Denied.hst"/>"
														data-placement="top" title="거절">
														<i class="zmdi zmdi-delete"></i>
													</button>
													</c:if>
													<c:if test="${res[loop.index].APPROVED == '승인됨'}">  
													
													</c:if>
													<c:if test="${res[loop.index].APPROVED == '거절됨'}">  
													
													</c:if>
													
													<button class="item" data-toggle="modal"
													type="button"	data-placement="top" data-target="#AptModal${loop.index}" title="상세보기">
														<i class="zmdi zmdi-more"></i>
													</button>
												</div>
											</td>
										</tr>
										<tr class="spacer"></tr>
										</form>
										</c:forEach>
									
										
									</tbody>
								</table>
							</div>
							
							<!-- END DATA TABLE -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 상세 보기 모달 -->
<c:forEach var="item" items="${mem }" varStatus="loop">	
	<div class="modal fade" id="AptModal${loop.index}" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-notify modal-warning" role="document">
			<div class="col-lg-12 ">
				<div class="top-campaign">
					<h3 class="title-3">예약 정보</h3>
					<br/>
					<div class="table-responsive">
						<table class="table table-top-campaign">
							<tbody>
								<tr>
									<td>예약자 이름</td>
									<td>${item.mem_name }</td>
								</tr>
								<tr>
									<td>요청 과</td>
									<td>${list[loop.index].dept_name }</td>
								</tr>
								<tr>
									<td>증상</td>
									<td>${res[loop.index].SEL_SYMP}</td>
								</tr>
								
								<tr>
									<td>email</td>
									<td>${item.mem_email }</td>
								</tr>
								<tr>
									<td>핸드폰 번호</td>
									<td>${item.tel }</td>
								</tr>
								<tr>
									<td>성별</td>
									<td>${item.gender }</td>
								</tr>
								<tr>
									<td>나이</td>
									<td>${item.age }</td>
								</tr>
								<tr>
									<td>예약 시간</td>
									<td>${res[loop.index].RES_DATE} ${res[loop.index].RES_TIME}</td>
								</tr>
								<tr>
									<td>신청 시간</td>
									<td>${res[loop.index].APPLY_TIME}</td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</body>
</html>