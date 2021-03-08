<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>회원탈퇴</title>

<link href="<c:url value='/css/jquery-accordion-menu.css'/>"
	rel="stylesheet" type="text/css" />

<style>
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

.board-util {
	
}

.board-util-right {
	float: right;
	height: 50px;
}

.page-header {
	padding-top: 60px
}

#regForm {
	width: 1200px
}

#contents {
	margin-top: 70px;
	padding-left: 50px;
	margin-bottom: 190px;
	background: white;
	border-radius: 4px;
	width: 120%;
	height: 850px;
	bottom: 10px;
	left: 20px;
}

caption {
	font-size: 15px;
	font-weight: bold;
}
/*사이드바*/
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

#demo-list a {
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	white-space: nowrap;
	height: 60px;
	width: 100%;
	font-size: 14px
}

#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	bottom: 0px;
	background-color: #474747;
	height: 150px
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
</style>

</head>
<body>
	<div class="container-fluid">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<section id="contents">
				<div class="page-header">
					<h2 style="color: blue">회원 탈퇴</h2>
				</div>
				<p class="lead">홈스피탈 회원탈퇴</p>
				<form id="regForm" name="regForm" method="post"
					action="<c:url value='/mypage/unmember.hst'/>">
					<input type="hidden" name="mode" value="delete" />
					<div class="alert alert-warning alert-dismissible mt-3" role="alert">
						회원 탈퇴를 위하여 본인 여부를 확인하고 있습니다. 정확한 정보를 입력해 주세요.
					</div>
					<div class="board-util-right">
						<span class="board-util-text color-red">* 필수 입력 항목</span>
					</div>
					<div class="table-wrapper">
						<table class="table-default board-form">
							<caption style="height: 50px;">회원탈퇴</caption>
							<tbody >
								<tr>
									<th scope="row" style="font-size: 30px">아이디 <span class="color-red">*</span></th>
									<td>
										<div class="input-inside-table">
											<input style="height: 50px;" type="text" name="userid" id="userid" class="input-text" title="아이디" role="textbox" />
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" style="font-size: 30px">비밀번호 <span class="color-red">*</span></th>
									<td>
										<div class="input-inside-table">
											<input style="height: 50px;" type="password" name="userPasswd" id="userPasswd" class="input-text" title="비밀번호" role="textbox" />
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" style="font-size: 30px">탈퇴사유</th>
									<td>
										<div class="input-inside-table">
											<textarea style="height: 50px;" name="outReason" id="outReason" class="input-textarea" title="탈퇴사유" role="textbox" aria-multiline="true"></textarea>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="board-util">
						<div class="board-util-right">
							<button type="button" class="btn btn-primary" role="button"
								onclick="Form();">
								<span class="button-text">회원탈퇴</span>
							</button>
							<button type="button" class="btn" role="button" onclick="back();">
								<span class="button-text">취소</span>
							</button>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>
</body>
<script>
  	function back(){
  			close=confirm("취소하시겠습니까?")
		if(close){
  		$(location).attr('href', "<c:url value='/mypage/mypage.hst'/>");
  			}
  	}

  	function Form() {
  		var userid = $('#userid');
  		if($.trim(userid.val()).length < 1 || $.trim(userid.val()) == '') {
  			alert('아이디를 입력해 주세요.');
  			userid.focus();
  			return;
  		}
 
  		
  		var userPasswd = $('#userPasswd');
  		if($.trim(userPasswd.val()).length < 1 || $.trim(userPasswd.val()) == '') {
  			alert('비밀번호를 입력해 주세요.');
  			userPasswd.focus();
  			return;
  		}
 
  		var outReason = $('#outReason');
  		if($.trim(outReason.val()).length >= 100) {
  			alert('탈퇴사유는 100자 미만으로 입력해 주세요.');
  			outReason.focus();
  			return
  		}

  		if(confirm('정말로 탈퇴하시겠습니까?')) {
  			$('form[name=regForm]').submit();
  		}
  	}

</script>
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
</script>
</html>