<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>마이페이지</title>
<link href="<c:url value='/css/jquery-accordion-menu.css'/>"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.color-red {
	color: red;
}

.box-default {
	font-size: 15px;
	color: #115bab;
	background-color: #D5D5D5;
	height: 70px;
	text-align: center;
	line-height: 70px;
	width: 80%;
}

.table-wrapper .table-default thead .write {
	text-align: left;
	color: #6e7179;
}

.table-wrapper .table-default tbody tr td :not (:first-child ){
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

table {
	border-top: 3px #D5D5D5 solid;
	border-bottom: 3px #D5D5D5 solid;
	width: 80%;
	margin: 10px;
	height: 220px;
}

.board-util-right {
	float: right;
	height: 50px
}

.board-util {
	height: 48px;
	top: 9px;
	width: 80%;
}

.board-util button {
	height: 48px;
	width: 100px
}

caption {
	font-size: 15px;
	font-weight: bold;
}

.input-inside-table {
	margin-bottom: 15px
}

#jquery-accordion-menu {
	top: 81px;
}

* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

body {
	background: #FFFFFF;
}

.content {
	width: 260px;
	margin: 100px auto;
}
</style>
</head>
<body>
	<div id="page-wrapper" class="container-fluid">
		<div class="row" style="padding-left: 370px">
			<div class="page-header"
				style="padding-top: 88px; padding-left: 20px">
				<h2 style="color: blue">병원 정보 수정</h2>
			</div>
			<p class="lead" style="padding-left: 20px">병원 정보 수정</p>
			<section class="memberchange">
				<div class="box-default" style="padding-left: 80px">
					<span class="board-util-text color-blue">※ 고객님께서 입력해주신 정보를
						통하여 추후 고객 맞춤 정보 등 유익한 서비스가 제공되오니, 정확한 입력 부탁 드립니다. </span>
				</div>
				<div class="board-util board-util-top02">
					<div class="board-util-right">
						<span class="board-util-text color-red">모든 정보를 기재 해 주셔야 합니다!</span>
					</div>
				</div>

				<div class="table-wrapper" role="form">
					<table class="table-default board-form table-member-modify">
						<caption>병원정보 수정</caption>
						<colgroup>
							<col style="width: 140px;" />
							<col />
							<col style="width: 140px;" />
							<col />
						</colgroup>
						<form action='<c:url value="/Hospage/Update.hst"/>' method="post" >
						<tbody>
							<tr>
								<th scope="row">병원명</th>
								<td style="padding-top: 10px; width: 30%">
									<div class="input-inside-table">
										<input type="text"  class="input-text" name="hosp_name"
											value="${list[0].hosp_name }" role="textbox" />
									</div>
								</td>
								<th scope="row" style="width: 15%; padding-left: 80px">평일
									영업 시간</th>
								<td>
									<div class="input-inside-table" style="padding-top: 15px">
										<input type="text"  class="input-text" name="weekday_open"
											value="${list[0].weekday_open }" role="textbox" tabindex="1"/>
											~
										<input type="text"  class="input-text" name="weekday_close"
											value="${list[0].weekday_close }" role="textbox" tabindex="2"/>
								
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">과 종류</th>
								<td>
								<div>	
									
											<label class=""><input type="checkbox" name="d1" value="내과" <c:if test="${not empty d1}"> checked="checked" </c:if>/>내과</label>
											<label class=""><input type="checkbox" name="d2" value="비뇨기과" <c:if test="${not empty d2 }"> checked="checked" </c:if>/>비뇨기과</label>
											<label class=""><input type="checkbox" name="d3" value="산부인과" <c:if test="${not empty d3 }"> checked="checked" </c:if>/>산부인과</label>
											<label class=""><input type="checkbox" name="d4" value="성형외과" <c:if test="${not empty d4}"> checked="checked" </c:if>/>성형외과</label>
											<label class=""><input type="checkbox" name="d5" value="소아청소년과" <c:if test="${not empty d5 }"> checked="checked" </c:if>/>소아청소년과</label>
											<label class=""><input type="checkbox" name="d6" value="신경과" <c:if test="${not empty d6 }"> checked="checked" </c:if>/>신경과</label>
											<label class=""><input type="checkbox" name="d7" value="안과" <c:if test="${not empty d7}"> checked="checked" </c:if>/>안과</label>
											<label class=""><input type="checkbox" name="d8" value="이비인후과" <c:if test="${not empty d8 }"> checked="checked" </c:if>/>이비인후과</label>
											<label class=""><input type="checkbox" name="d9" value="일반외과" <c:if test="${not empty d9}"> checked="checked" </c:if>/>일반외과</label>
											<label class=""><input type="checkbox" name="d10" value="정신건강의학과" <c:if test="${not empty d10}"> checked="checked" </c:if>/>정신건강의학과</label>
											<label class=""><input type="checkbox" name="d11" value="정형외과" <c:if test="${not empty d11}"> checked="checked" </c:if>/>정형외과</label>
											<label class=""><input type="checkbox" name="d12" value="치과" <c:if test="${not empty d12}"> checked="checked" </c:if>/>치과</label>
											<label class=""><input type="checkbox" name="d13" value="피부과" <c:if test="${not empty d13}"> checked="checked" </c:if>/>피부과</label>
											<label class=""><input type="checkbox" name="d14" value="한방과" <c:if test="${not empty d14}"> checked="checked" </c:if>/>한방과</label>
											<label class=""><input type="checkbox" name="d15" value="기타" <c:if test="${not empty d15}"> checked="checked" </c:if>/>기타</label>
										
									
									</div>
								</td>
								<th scope="row" style="padding-left: 80px">휴일 영업 시간</th>
								<td>
									<div class="input-inside-table" style="padding-top: 15px">
										<input type="text"  class="input-text" name="weekend_open"
											value="${list[0].weekend_open }" role="textbox" tabindex="3"/>
										~
										<input type="text"  class="input-text" name="weekend_close"
											value="${list[0].weekend_close }" role="textbox" tabindex="4"/>
											
									</div>
								</td>
							</tr>
							<tr>

								<th scope="row" style="width: 15%; margin-top: 6px">주소</th>
								<td>
									<div class="input-inside-table">
										<input type="text"  class="input-text" name="address"
											value="${list[0].address }" role="textbox" />
									</div>
								</td>
								<th scope="row" style="padding-left: 80px">점심시간</th>
								<td>
									<div class="input-inside-table" style="padding-top: 15px">
										<input type="text"  class="input-text" name="lunchtime"
											value="${list[0].lunchtime }" role="textbox" />
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">이메일(아이디)</th>
								<td colspan="3">
									<div class="input-inside-table" style="padding-top: 5px">
										<input type="text"  class="input-text" name="email" value="${list[0].mem_email }" role="textbox" />
									</div>
								</td>
								
							</tr>
						</tbody>
					</table>
				</div>
				<div class="input-inside-table" style="padding-left:20px">
					<input type="password" name="hospwd" id="pass2" class="input-text" title="비밀번호 확인" placeholder="현재 비밀번호" role="textbox" maxlength="20" onkeyup="dupCheckUserPw(this.value);" /> 
					<span id="hospwd" class="input-description">비밀번호 확인을 위해 입력해 주세요</span>
				</div>
				<div class="board-util">
					<span class="board-util-text color-blue">※ 정보를 수정하신 후 확인 버튼을 클릭하셔야 정보 수정이 완료됩니다.</span>
					<div class="board-util-right">
						<button type="submit" class="btn btn-primary" role="button"
							value="수정" onclick="passerror()">
						수정
						</button>
						</form>
					</div>
				</div>
				<div class="board-util board-util02">
					<div class="board-util-left"></div>
				</div>
			</section>
		</div>
	</div>
</body>
<script src="<c:url value='/js/jquery-accordion-menu.js'/>"
	type="text/javascript"></script>
<script type="text/javascript">
	(function($) {
		$.expr[":"].Contains = function(a, i, m) {
			return (a.textContent || a.innerText || "").toUpperCase().indexOf(
					m[3].toUpperCase()) >= 0;
		};
		function filterList(header, list) {

			var form = $("<form>").attr({
				"class" : "filterform",
				action : "#"
			}), input = $("<input>").attr({
				"class" : "filterinput",
				type : "text"
			});
			$(form).append(input).appendTo(header);
			$(input).change(
					function() {
						var filter = $(this).val();
						if (filter) {
							$matches = $(list).find(
									"a:Contains(" + filter + ")").parent();
							$("li", list).not($matches).slideUp();
							$matches.slideDown();
						} else {
							$(list).find("li").slideDown();
						}
						return false;
					}).keyup(function() {
				$(this).change();
			});
		}
		$(function() {
			filterList($("#form"), $("#demo-list"));
		});
	})(jQuery);
</script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

	});

	$(function() {

		$("#demo-list li").click(function() {
			$("#demo-list li.active").removeClass("active")
			$(this).addClass("active");
		})
	})

	function back() {
		close = confirm("취소하시겠습니까?")
		if (close) {
			$(location).attr('href', '<c:url value='/mypage/mypage.hst'/>');
		}

	}

	

		/* 	var userPasswd = $('#userPasswd');
			if ($.trim(userPasswd.val()).length < 1
					|| $.trim(userPasswd.val()) == '') {
				alert('현재 비밀번호를 입력해 주세요.');
				userPasswd.focus();
				return;
			}
			var newuserPasswd = $('#newuserPasswd');
			if ($.trim(newuserPasswd.val()).length < 1
					|| $.trim(newuserPasswd.val()) == '') {
				alert('새 비밀번호를 입력해 주세요.');
				newuserPasswd.focus();
				return;
			}
			var userPasswdOK = $('#userPasswdOK');
			if ($.trim(userPasswdOK.val()).length < 1
					|| $.trim(userPasswdOK.val()) == '') {
				alert('새 비밀번호 확인을 입력해 주세요.');
				userPasswdOK.focus();
				return;
			}
			if ($.trim(newuserPasswd.val()) != $.trim(userPasswdOK.val())) {
				alert('새비밀번호가 일치하지 않습니다');
				userPasswdOK.focus();
				return;
			}
		 */
		function passerror() {
			
		
		 var passok = $('#pass2');
		if ($.trim(passok.val()).length < 1 || $.trim(passok.val()) == '') {
			alert('비밀번호를 입력해주세요');
			history.back();
			passok.focus();
			
			
		}
		else{
			alert('수정 성공');
			
		}
		 }
	
</script>
</html>
