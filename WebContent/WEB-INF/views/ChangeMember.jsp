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
	margin-left: 80px;
}

.table-wrapper .table-default thead .write {
	text-align: left;
	color: #6e7179;
}

.table-wrapper
 
.table-default
 
tbody
 
tr
 
td
 
:not
 
(
:first-child
 
){
position
:
 
relative
;

	
padding-right
:
 
0;
padding-left
:
 
0;
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
	height: 50px;
	left: -80px
}

.board-util {
	height: 48px;
	top: 9px;
	width: 85%;
}

.board-util button {
	height: 48px;
	width: 100px;
}

.board-util-text {
	margin-left: 80px
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
	background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003234675773)
		68%, rgba(255, 206, 196, 0.5) 163%),
		linear-gradient(163deg, rgba(49, 146, 170, 0.07944489965716128) 86%,
		rgba(239, 112, 138, 0.5) 40%),
		linear-gradient(30deg, rgba(76, 79, 173, 0.6173675716587805) 22%,
		rgba(237, 106, 134, 0.5) 169%),
		linear-gradient(48deg, rgba(31, 85, 147, 0.7323890641868473) 64%,
		rgba(247, 126, 132, 0.5) 43%);
	background-blend-mode: overlay, multiply, color, normal;
}

.memberchange {
	background: white;
	border-radius: 4px;
	margin-bottom: 40px;
	padding-left: 20px;
	padding-top: 30px;
	width: 89%
}

.page-header {
	width: 89%;
	top: 5px;
	background: white;
	margin-bottom: 0px;
	padding-bottom: 40px;
	border-radius: 4px;
	padding-top: 50px;
	margin-right: 80px;
	margin-top: 60px;
}

.page-header h2 {
	padding-left: 20px
}
</style>
</head>
<body>
	<div id="page-wrapper" class="container-fluid">
		<div class="row" style="padding-left:370px;">
			<div class="page-header">
				<h2 style="color: blue">회원 정보 수정</h2>
			</div>
			<form class="memberchange" method="post" action="<c:url value='/mypage/ChangeMember.hst'/>">
				<div class="box-default">
					<span> ※ 고객님께서 입력해주신 정보를
						통하여 추후 고객 맞춤 정보 등 유익한 서비스가 제공되오니, 정확한 입력 부탁 드립니다. </span>
				</div>
				<div class="board-util board-util-top02">
					<div class="board-util-right">
						<span class="board-util-text color-red">* 필수 입력 항목</span>
					</div>
				</div></br></br>

				<div class="table-wrapper" role="form">
					<table class="table-default board-form table-member-modify"
						style="margin-left: 100px">
						<caption>개인정보 수정</caption>
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td style="padding-top: 10px; width: 30%">
									<div class="input-inside-table">
										<input type="text" id="name" name="name" class="input-text"
											title="이름" value="${list[0]['mem_name']}" role="textbox" />
									</div>
								</td>
								<th scope="row" style="width: 15%; padding-left: 80px">키</th>
								<td>
									<div class="input-inside-table">
										<input type="text" id="height" name="height"
											class="input-text" title="키" value="${list[0]['height']}"
											role="textbox" />
									</div>
								</td>
							</tr>

							<tr>
								<th scope="row">나이</th>
								<td>
									<div class="input-inside-table">
										<select style="width: 176px; height: 24px;" title="나이"
											id="age" name="age" value="${list[0]['age']}"
											class="input-width-small07">
											<option>나이</option>
											<option value="10">10세 이하</option>
											<option value="10">10대</option>
											<option value="20">20대</option>
											<option value="30">30대</option>
											<option value="40">40대</option>
											<option value="50">50대</option>
											<option value="60">60대</option>
											<option value="70">70대</option>
											<option value="80">80대</option>
											<option value="90">90대</option>
										</select>

									</div>
								</td>
								<th scope="row" style="padding-left: 80px">몸무게</th>
								<td>
									<div class="input-inside-table">
										<input type="text" id="weight" name="weight"
											class="input-text" title="몸무게" value="${list[0]['weight']}"
											role="textbox" />
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" style="width: 15%; margin-top: 6px">성별</th>
								<td>
									<div class="input-inside-table">
										<select id="gender" name="gender" value="${list[0]['gender']}"
											style="width: 176px; height: 24px;" title="성별"
											class="input-width-small07">
											<option>성별</option>
											<option value="남자">남자</option>
											<option value="여자">여자</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호 <span class="color-red">*</span></th>
								<td colspan="3" class="phone">
									<div class="input-inside-table" style="padding-top: 10px;">
										<select name="hand_no1" id="hand_no1" title="휴대폰번호 앞자리"
											class="input-width-small" required="required">
											<option value="">선택</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="019">019</option>
										</select> <span class="input-sign">-</span> <input type="text"
											name="hand_no2" id="hand_no2"
											class="input-text input-width-small" title="휴대폰번호 중간자리"
											role="textbox" required="required" onkeyup="number(this);"
											maxlength="4" value="" /> <span class="input-sign">-</span>

										<input type="text" name="hand_no3" id="hand_no3"
											class="input-text input-width-small" title="휴대폰번호 끝자리"
											role="textbox" required="required" onkeyup="number(this);"
											maxlength="4" value="" /> <input type="hidden" id="tel"
											name='tel' value="${list[0]['tel']}" />


										<div class="option-check">
											<div class="input-checkbox-group ml0 is-tool-tip">
												<label class="input-checkbox input-checkbox-type02">
													<input type="checkbox" name="sms_rec_yn" id="sms_rec_yn"
													role="checkbox" onclick="" value="Y" /> <i
													aria-hidden="true"></i><span class="label-text">문자(SMS)
														수신동의</span>
												</label> <br />
											</div>
										</div>



									</div>

								</td>

							</tr>


							<tr>
								<th scope="row">비밀번호 확인 <span class="required">*</span></th>
								<td colspan="3">

									<div class="input-inside-table">
										<input type="password" name="pass" id="pass2"
											class="input-text" title="비밀번호 확인" role="textbox"
											maxlength="20" /> <span id="messagePw"
											class="input-description">비밀번호 확인을 위해 입력해 주세요</span>
									</div>

								</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="board-util" style="width: 88%">
					<span class="board-util-text color-blue">※ 정보를 수정하신 후 확인 버튼을
						클릭하셔야 정보 수정이 완료됩니다.</span>
					<div class="board-util-right">
						<button type="button" class="btn btn-primary" role="button"
							onclick="Form();">
							<span class="button-text">확인</span>
						</button>
						<button type="button" class="btn" role="button" onclick="back();">
							<span class="button-text">취소</span>
						</button>
					</div>
				</div>
				<div class="board-util board-util02">
					<div class="board-util-left"></div>
				</div>
			</form>
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
		var strarry = $('#tel').val().split('-');

		$("#hand_no1").val(strarry[0]);
		$("#hand_no2").val(strarry[1]);
		$("#hand_no3").val(strarry[2]);

	});

	function back() {
		close = confirm("취소하시겠습니까?")
		if (close) {
			$(location).attr('href', '<c:url value='/mypage/mypage.hst'/>');
		}

	}

	function Form() {
		var passok = $('#pass2');
		if ($.trim(passok.val()).length < 1 || $.trim(passok.val()) == '') {
			alert('비밀번호를 입력해주세요');
			passok.focus();
			return;
		}
		if ($('#name').val() == "") {
			alert('이름을 입력해주세요');
			$('#name').focus();
			return;
		}
		if ($('#gender').val() == "성별") {
			alert('성별을 선택해주세요');
			return;
		}
		if ($('#age').val() == "나이") {
			alert('나이를 선택해주세요');
			return;
		}

		if (confirm('정말로 변경하시겠습니까?')) {

			$("#tel").val(
					$("#hand_no1").val() + "-" + $("#hand_no2").val() + "-"
							+ $("#hand_no3").val());
			$('.memberchange').submit();
		}

	}
</script>
</html>
