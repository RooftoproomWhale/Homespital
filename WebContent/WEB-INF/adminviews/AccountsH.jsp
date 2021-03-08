<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<style>
.modal-notify .modal-header {
    border-radius: 3px 3px 0 0;
}
.modal-notify .modal-content {
    border-radius: 3px;
}

input[type=text] { border: none;}
</style>

<script>
$(function() {
	
// 	필터
	$("#filter").change(function(){
		var state = jQuery('#filter option:selected').val();
		if ( state == 'all' ) 
		{
			console.log(state);
			$.ajax({ 
				url: "<c:url value='/Admin/Accounts.hst'/>",
				data: {
						}, //넘길 파라미터 
				dataType: 'html',
				async: true, // true:비동기, false:동기 
				success: function(data){ 
					console.log('성공');
					window.location.href = "<c:url value='/Admin/Accounts.hst'/>";
				},
				error:function(request,status,error){
					console.log('실패');
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				} 
			});
		} 
		else if ( state == 'user' )
		{
			console.log(state);
			$.ajax({ 
				url: "<c:url value='/Admin/AccountsUser.hst'/>",
				data: {
						}, //넘길 파라미터 
				dataType: 'html',
				async: true, // true:비동기, false:동기 
				success: function(data){ 
					console.log('성공');
					window.location.href = "<c:url value='/Admin/AccountsUser.hst'/>";
					
				},
				error:function(request,status,error){
					console.log('실패');
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				} 
			});
		}
		else
		{
			console.log(state);
			$.ajax({ 
				url: "<c:url value='/Admin/AccountsHosp.hst'/>",
				data: {
						}, //넘길 파라미터 
				dataType: 'html',
				async: true, // true:비동기, false:동기 
				success: function(data){ 
					console.log('성공');
					window.location.href = "<c:url value='/Admin/AccountsHosp.hst'/>";
				},
				error:function(request,status,error){
					console.log('실패');
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				} 
			});
		}
		
	});
	
	$(".table-data-feature .item:first-child").on('click', function(){
			
			btnId = $(this).attr("id");
			var email = document.getElementById("idEmail"+btnId).innerHTML.trim();
			console.log("수정 모달 클릭", email);
			var request = 
				$.ajax({ 
					url: "<c:url value='/Admin/UserUpdateForm.hst'/>",
					type: "post", //get, post 방식 
					dataType: 'json', //or xml or script or html or json or text
					data: {
							"userEmail" : email
							}, //넘길 파라미터 
					async: true, // true:비동기, false:동기 
					success: function(data){ 
						console.log('성공', data[0]);
						document.getElementById("upName").value = data[0].mem_name;
						document.getElementById("upEmail").value = data[0].mem_email;
						document.getElementById("upPwd").value = data[0].mem_pwd;
						document.getElementById("upTel").value = data[0].tel;
						document.getElementById("userEmail").value = email;
					},
					error:function(request,status,error){
						console.log('실패');
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					} 
				});
		});
	
	$("#updateBtn").on('click', function(){
		
		var userEmail = "";
		var upName = $("#upName").val();
		var upEmail = $("#upEmail").val();
		var upPwd = $("#upPwd").val();
		var upTel = $("#upTel").val();
		
		console.log(userEmail, upName, upEmail, upPwd, upTel);
// 		var param = $("#frm").serialize();
// 		alert(param);
		var request = 
			$.ajax({ 
				url: "<c:url value='/Admin/UserUpdate.hst'/>",
				type: "post", //get, post 방식 
				dataType: 'html', //or xml or script or html 
				data: {
						"userEmail" : userEmail,
						"upName" : upName,
						"upEmail" : upEmail,
						"upPwd" : upPwd,
						"upTel" : upTel
						}, //넘길 파라미터 
				async: true, // true:비동기, false:동기 
				success: function(data){ 
					console.log('성공');
				},
				error:function(request,status,error){
					console.log('실패');
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				} 
			});
	});
	
$(".table-data-feature .item:last-child").on('click', function(){
		
		var tr = $(this).parent().parent().parent();
		var td = tr.children();
		var userEmail = td.eq(1).children().eq(1).text().trim();
		var sendJson={"userEmail" : userEmail}
		console.log(userEmail);
		$.ajax({ 
			url: "<c:url value='/Admin/UserDelete.hst'/>",
			type: "get", //get, post 방식 
			dataType: 'json', //or xml or script or html 
			data: sendJson, //넘길 파라미터 
			async: true, // true:비동기, false:동기 
			success: function(data){ 
				console.log(data);
				if(data.del == '1')
				{
					console.log('성공');
					window.location.href = "<c:url value='/Admin/Accounts.hst'/>";
				}
				else
				{
					console.log('실패ddwa');
				}
			},
			error:function(request,status,error){
				console.log("실패");
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			} 
		});
			
	});
});
</script>

<body>
	<div class="page-wrapper">
		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap">
							<form class="form-header" action="" method="POST">
								<input class="au-input au-input--xl" type="email" name="search"
									placeholder="회원명 검색" />
								<button class="au-btn--submit" type="submit">
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
							<div class="col-lg-10">
								<!-- USER DATA-->
								<div class="user-data m-b-45">
									<h3 class="title-3 m-b-30">
										<i class="zmdi zmdi-account-calendar"></i>user data
									</h3>
									<div class="filters m-b-45">
										<div
											class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
											<select class="js-select2" name="filter" id="filter">
												<option value="all">All Users</option>
												<option value="user">User</option>
												<option value="hospital" selected="selected">Hospital</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
									<div class="table-responsive table-data">
										<table class="table">
											<thead>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>name</td>
													<td>role</td>
													<td>password</td>
													<td>tel</td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty list}" var="isEmpty">
													<tr>
														<td colspan="4">등록된 회원이 없습니다.</td>
													</tr>
												</c:if>
												<c:if test="${not isEmpty}">
													<c:forEach items="${list}" var="item" varStatus="loop">
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox"> <span class="au-checkmark"></span>
													</label></td>
													<td>
																<div class="table-data__info">
																	<h6 id="idName${loop.index }">${item.mem_name }</h6>
																</div>
																<div>
																	<a href="#"><span class="userEmail"
																		id="idEmail${loop.index }"> ${item.mem_email }</span></a>
																</div>
															</td>
															<c:if test="${item.role == 'ROLE_ADM' }">
																<td><span class="role admin">${item.role }</span></td>
															</c:if>
															<c:if test="${item.role == 'ROLE_MEM' }">
																<td><span class="role user">${item.role }</span></td>
															</c:if>
															<c:if test="${item.role == 'ROLE_HOS' }">
																<td><span class="role member">${item.role }</span></td>
															</c:if>

															<td>
																<div class="rs-select2--trans rs-select2--sm">
																	<input type="text" placeholder="${item.mem_pwd }"
																		disabled="disabled" id="idPwd${loop.index }">
																</div>
															</td>
															<td>
																<div class="rs-select2--trans rs-select2--sm">
																	<input type="text" placeholder="${item.tel }"
																		disabled="disabled" id="idTel${loop.index }">
																</div>
															</td>
															<td>
																<div class="table-data-feature">
																	<button class="item update" data-toggle="modal"
																		<%-- onclick="location.href='<c:url value = "/Admin/UserUpdateForm.hst"/>'" --%>
																data-placement="top"
																		data-target="#UserModal" title="수정"
																		id="${loop.index }">
																		<i class="zmdi zmdi-edit"></i>
																	</button>
																	<button class="item" data-toggle="tooltip"
																		id="deleteBtn" data-placement="top" title="삭제">
																		<i class="zmdi zmdi-delete"></i>
																	</button>
																</div>
															</td>
												</tr>
												<tr>
												</c:forEach>
											</c:if>
											</tbody>
										</table>
									</div>
								</div>
								<!-- END USER DATA-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정 모달 -->
	<div class="modal fade" id="UserModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-notify modal-warning" role="document">
			<!--Content-->
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header text-center">
					<h4 class="modal-title white-text w-100 font-weight-bold py-2">Update User</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span class="white-text">&times;</span>
					</button>
				</div>

				<!--Body-->
				<div class="modal-body">
				<form id="frm">
						<div class="md-form mb-5">
							<i class="fas fa-user prefix grey-text"></i> <input type="email"
								id="upName" class="form-control validate" value="${record.mem_name }"> <label
								data-error="wrong" data-success="right" for="form3" >NAME</label>
						</div>
	
						<div class="md-form mb-5">
							<input type="email" id="upEmail" class="form-control validate" value="${record.mem_email }"> <label
								data-error="wrong" data-success="right" for="form2">EMAIL</label>
						</div>
						
						<div class="md-form mb-5">
							<input type="email" id="upPwd" class="form-control validate" value="${record.mem_pwd }"> <label
								data-error="wrong" data-success="right" for="form2">PASSWORD</label>
						</div>
						
						<div class="md-form">
							<input type="email" id="upTel" class="form-control validate" value="${record.tel }"> <label
								data-error="wrong" data-success="right" for="form2" >TEL</label>
						</div>
					</form>
				</div>

				<!--Footer-->
				<div class="modal-footer justify-content-center">
					<a type="button" id="updateBtn" <%-- onclick="location.href='<c:url value = "/Admin/UserUpdate.hst"/>'" --%> class="btn btn-outline-warning waves-effect">Update</a>
				</div>
			</div>
			<!--/.Content-->
		</div>
	</div>
</body>

</html>
<!-- end document-->
