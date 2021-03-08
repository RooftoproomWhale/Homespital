<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script>

$(function() {
	var rownum = $('#table tbody tr').length;
	console.log(rownum);
	
	$('.item').on('click', function(){
		console.log('상세 모달 클릭', $(this).attr("id"));
		var btnId = $(this).attr("id");
		var no = btnId.replace("idDelBtn", "");
		console.log(no);
		var email = document.getElementById("idEmail"+btnId).innerHTML;
		var hosName = document.getElementById("idHospName"+btnId).innerHTML;
		var date = document.getElementById("idResDate"+btnId).innerHTML;
		var time = document.getElementById("idResTime"+btnId).innerHTML;
		console.log("email: "+ email + " hosName: " + hosName + " date: " + date + " time: " + time + " status: " +status);
		
		var request = 
			$.ajax({ 
				url: "<c:url value='/Admin/AptViewForm.hst'/>",
				type: "post", //get, post 방식 
				dataType: 'json', //or xml or script or html or json or text
				data: {
						"userEmail" : email
						}, //넘길 파라미터 
				async: true, // true:비동기, false:동기 
				success: function(data){ 
					console.log('성공', data[0]);
					document.getElementById("mdUserName").innerHTML = data[0].mem_NAME;
					document.getElementById("mdHospName").innerHTML = hosName;
					document.getElementById("mdEmail").innerHTML = email;
					document.getElementById("mdUserTel").innerHTML = data[0].tel;
					document.getElementById("mdUserGender").innerHTML = data[0].gender;
					document.getElementById("mdUserAge").innerHTML = data[0].age;
					document.getElementById("mdResDate").innerHTML = date;
					document.getElementById("mdResTime").innerHTML = time;
// 					document.getElementById("mdApplyTime").innerHTML = data[0].apply_TIME;
				},
				error:function(request,status,error){
					console.log('실패');
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				} 
			});
		
		
	});
	
		$('.item2').on('click', function(){
			console.log('삭제 모달 클릭', $(this).attr("id"));
			btnId = $(this).attr("id");	
			var no = btnId.replace("idDelBtn", "");
			
			var userEmail = document.getElementById("idEmail"+no).innerHTML.trim();
			var hospCode = $('#hospCode').val();
			console.log(userEmail);
			console.log(hospCode);
			var sendJson=
							{
								"userEmail" : userEmail,
								"hospCode" : hospCode
							}
				$.ajax({ 
					url: "<c:url value='/Admin/AptDelete.hst'/>",
					type: "get", //get, post 방식 
					dataType: 'html', //or xml or script or html 
					data: sendJson, //넘길 파라미터 
					async: true, // true:비동기, false:동기 
					success: function(data){ 
// 						console.log(data);
							console.log('성공');
							window.location.href = "<c:url value='/Admin/Appointment.hst'/>";
					},
					error:function(request,status,error){
						console.log("실패");
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					} 
				});
			});
		
		$("#searchBtn").on("click", function(){
			var keyword = $("#search").val();
			console.log(keyword, "예약 검색");
			$.ajax({ 
				url: "<c:url value='/Admin/AppointmentSearch.hst'/>",
				type: "get", //get, post 방식 
				dataType: 'html', //or xml or script or html 
				data: {
					"search_keyword" : keyword
					}, //넘길 파라미터 
				async: true, // true:비동기, false:동기 
				success: function(data){ 
					console.log(data);
						console.log('성공');
						window.location.href = "<c:url value='/Admin/AppointmentSearch.hst?search_keyword="+keyword+"'/>";
				},
				error:function(request,status,error){
					console.log("에러");
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				} 
			});
		});
	
});
</script>

<body class="animsition">
	<div class="page-wrapper">
		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap">
							<form class="form-header" action="" method="">
								<input class="au-input au-input--xl" type="text" id="search" placeholder="병원명 검색" />
								<button class="au-btn--submit" type="button" id="searchBtn">
									<i class="zmdi zmdi-search"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</header>
			<!-- END HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<!-- DATA TABLE -->
								<h3 class="title-5 m-b-35">Appointment</h3>
								<div class="table-data__tool">
									<div class="table-data__tool-left">
<!-- 										<div class="rs-select2--light rs-select2--md"> -->
<!-- 											<select class="js-select2" name="property"> -->
<!-- 												<option selected="selected">All</option> -->
<!-- 												<option value="">This Week</option> -->
<!-- 												<option value="">This Month</option> -->
<!-- 											</select> -->
<!-- 											<div class="dropDownSelect2"></div> -->
<!-- 										</div> -->
									</div>
								</div>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2" id="table">
										<thead>
											<tr>
												<th><label class="au-checkbox"> <input
														type="checkbox"> <span class="au-checkmark"></span>
												</label></th>
												<th>user</th>
												<th>hospital</th>
												<th>date</th>
												<th>time</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty list}" var="isEmpty">
												<tr>
													<td colspan="4">예약이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${not isEmpty}">
												<c:forEach items="${list}" var="item" varStatus="loop">
													<tr class="tr-shadow">
														<td><label class="au-checkbox"> 
														<input type="checkbox"> <span class="au-checkmark"></span>
														<input type="hidden" id="hospCode" value="${item.HOSP_CODE }"/>
														</label></td>
														<td><span class="block-email" id="idEmail${loop.index }">${item.MEM_EMAIL }</span>
														</td>
														<td class="desc" id="idHospName${loop.index }">${item.HOSP_NAME }</td>
														<td id="idResDate${loop.index }">${item.RES_DATE }</td>
														<td id="idResTime${loop.index }">${item.RES_TIME }</td>
														<td>
															<div class="table-data-feature">
																<button class="item2" data-toggle="tooltip"
																	data-placement="top" name="delBtn" title="삭제" id="idDelBtn${loop.index }">
																	<i class="zmdi zmdi-delete"></i>
																</button>
																<button class="item" 
																	data-placement="top" name="viewBtn" data-toggle="modal" data-target="#AptModal"
																	title="상세보기" id="${loop.index }">
																	<i class="zmdi zmdi-more"></i>
																</button>
															</div>
														</td>
													</tr>
<!-- 													<tr class="spacer"> -->
<!-- 													</tr> -->
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
								<!-- END DATA TABLE -->
							</div>
						</div>
						<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a href="<c:url value='/Admin/Appointment.hst?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="<c:url value='/Admin/Appointment.hst?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="<c:url value='/Admin/Appointment.hst?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
						</c:if>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 상세 보기 모달 -->
	<div class="modal fade" id="AptModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-notify modal-warning" role="document">
			<div class="col-lg-12 ">
				<div class="top-campaign">
					<h3 class="title-3">예약 정보</h3>
					<br />
					<div class="table-responsive">
						<table class="table table-top-campaign">
							<tbody>
								<tr>
									<td>예약자 이름</td>
									<td id="mdUserName"></td>
								</tr>
								<tr>
									<td>병원명</td>
									<td id="mdHospName"></td>
								</tr>
								<tr>
									<td>email</td>
									<td id="mdEmail"></td>
								</tr>
								<tr>
									<td>핸드폰 번호</td>
									<td id="mdUserTel"></td>
								</tr>
								<tr>
									<td>성별</td>
									<td id="mdUserGender">남성</td>
								</tr>
								<tr>
									<td>나이</td>
									<td id="mdUserAge"></td>
								</tr>
								<tr>
									<td>예약 날짜</td>
									<td id="mdResDate"></td>
								</tr>
								<tr>
									<td>예약 시간</td>
									<td id="mdResTime"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<!-- end document-->
