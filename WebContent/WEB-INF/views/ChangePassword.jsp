<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.info{
		font-size: 1.3em;
		line-height: 3em;
		
	}
.color-red{color:red;}
.table-wrapper .line { border-left:1px solid #dadada;}
 .box-default { font-size:15px; color:#115bab;background-color: #D5D5D5;height: 70px;text-align: center;line-height: 70px;width: 100%}
.table-wrapper .table-default thead .write { text-align: left; color:#6e7179;}
 .table-wrapper .table-default tbody tr td { position:relative; padding-right:0; padding-left:0;}
 .table-wrapper .table-default tbody tr td .input-conut-limit { position:absolute; bottom:9px; right:22px; }
  .table-default tr th,.table-default tr td {font-size:13px}
  .default-info-heading { margin-bottom: 20px; }
  .button-blue{background:#57a5df;}
  table {border-top: 3px #D5D5D5 solid;border-bottom: 3px #D5D5D5 solid; width: 100%;margin: 10px;height: 220px}
.board-util-right{float: right;height: 50px}.board-util{height: 48px;top:9px;}.board-util button{height: 48px;width: 100px}
#passForm{width: 1200px}
#contents{margin-top:140px;padding-left: 200px;margin-bottom: 167px}
caption{font-size: 15px;font-weight: bold;}
@media all and (min-width:500px) and (max-width:1024px){
#sidebar-wrapper{    left:-250px;}
.main{left:-150px;}
#page-wrapper{left:-150px;padding-left: 0px;margin-left: 0px}
#app{display: none}
#appdown{width: 90%;float: inherit;margin-left: 76px;margin-top: 0px}
#contents{padding-left: 20px;margin-left: 20px}
.board-util-right{float: left;}
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
<script>

</script>
<div id="page-wrapper" class="container-fluid">
  <div class="main row" style="margin-top: 82px;padding-bottom:15px;">
  		<section id="contents"> <!-- /////////////////////////////////// Contents [S] -->
				<h2 class="hidden">비밀번호 변경</h2>
				<form id="passForm" name="passForm" method="post" action="">
				<input type="hidden" name="mode" value="delete"/>

					<div class="box-default">
						※ 정보를 수정하신 후 확인 버튼을 클릭하셔야 정보 수정이 완료됩니다.
					</div>

					<div class="board-util board-util-top">
						<div class="board-util-right">
							<span class="board-util-text color-red">* 필수 입력 항목</span>
						</div>
					</div>

					<div class="table-wrapper">
						<table class="table-default board-form">
							<caption>비밀번호 변경</caption>
							<colgroup>
								<col style="width: 140px" />
								<col />
							</colgroup>
							<tbody>
								<!--<tr>
									<th scope="row">아이디 <span class="required">*</span></th>
									<td>

										<div class="input-inside-table">
											<input type="text" name="userId" id="userId" class="input-text" title="아이디" role="textbox" />
										</div>

									</td>
								</tr>-->
								<tr>
									<th scope="row">현재 비밀번호<span class="color-red">*</span></th>
									<td>

										<div class="input-inside-table">
											<input type="password" name="userPasswd" id="userPasswd" class="input-text" title="현재 비밀번호" role="textbox" />
										</div>

									</td>
								</tr>
								<tr>
									<th scope="row">새 비밀번호 <span class="color-red">*</span></th>
									<td>

										<div class="input-inside-table">
											<input type="password" name="newuserPasswd" id="newuserPasswd" class="input-text" title="새 비밀번호" role="textbox" />
										</div>

									</td>
								</tr>
					<tr>
									<th scope="row">새 비밀번호 확인 <span class="color-red">*</span></th>
									<td>

										<div class="input-inside-table">
											<input type="password" name="userPasswdOK" id="userPasswdOK" class="input-text" title="새 비밀번호 확인" role="textbox" />
										</div>

									</td>
								</tr>
					
							</tbody>
						</table>
					</div>

					<div class="board-util">
						<div class="board-util-right">
							<button type="button" class="btn btn-primary" role="button" onclick="Form();"><span class="button-text">확인</span></button>
							<button type="button" class="btn" role="button" onclick="back();"><span class="button-text">취소</span></button>
						</div>
					</div>	

				</form>

			</section> 
</div>
</div>
  <script>


  	function back(){
  			close=confirm("취소하시겠습니까?")
		if(close){
  		$(location).attr('href', '<c:url value='/mypage/mypage.hst'/>');
  			}
  			
  	}

  	function Form() {
 
  		var userPasswd = $('#userPasswd');
  		if($.trim(userPasswd.val()).length < 1 || $.trim(userPasswd.val()) == '') {
  			alert('현재 비밀번호를 입력해 주세요.');
  			userPasswd.focus();
  			return;
  		}
  		var newuserPasswd = $('#newuserPasswd');
  		if($.trim(newuserPasswd.val()).length < 1 || $.trim(newuserPasswd.val()) == '') {
  			alert('새 비밀번호를 입력해 주세요.');
  			newuserPasswd.focus();
  			return;
  		}
  		var userPasswdOK = $('#userPasswdOK');
  		if($.trim(userPasswdOK.val()).length < 1 || $.trim(userPasswdOK.val()) == '') {
  			alert('새 비밀번호 확인을 입력해 주세요.');
  			userPasswdOK.focus();
  			return;
  		}
  		if($.trim(newuserPasswd.val())!= $.trim(userPasswdOK.val())) {
  			alert('새비밀번호가 일치하지 않습니다');
  			userPasswdOK.focus();
  			return;
  		}

  		if(confirm('정말로 변경하시겠습니까?')) {
  			$('form[name=passForm]').submit();
  		}
  	}

  
  </script>
  <script src="<c:url value='/js/jquery-accordion-menu.js'/>" type="text/javascript"></script>
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
