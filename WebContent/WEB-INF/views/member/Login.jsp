<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.css" rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script async defer src="https://connect.facebook.net/en_US/sdk.js"></script>
<script src='<c:url value="/js/kakao.js"/>'></script>



<style>
body{
   padding-top: 70px;
}
.main-contents{
   width: 50%;
   border-radius: 20px;
   box-shadow: 0 5px 5px rgba(0,0,0,.4);
   margin: 5em auto;
   display: flex;
}
.company__info{
   background-color: #5ca9fb;
   border-top-left-radius: 20px;
   border-bottom-left-radius: 20px;
   display: flex;
   flex-direction: column;
   justify-content: center;
   color: #fff;
}
.fa-android{
   font-size:3em;
}
@media screen and (max-width: 640px) {
   .main-content{width: 90%;}
   .company__info{
      display: none;
   }
   .login_form{
      border-top-left-radius:20px;
      border-bottom-left-radius:20px;
   }
}
@media screen and (min-width: 642px) and (max-width:800px){
   .main-content{width: 70%;}
}
.row > h2{
   color:#5ca9fb;
   
}
.login_form{
   background-color: #fff;
   border-top-right-radius:20px;
   border-bottom-right-radius:20px;
   border-top:1px solid #ccc;
   border-right:1px solid #ccc;
}
form{
   padding: 0 2em;
}
.form__input{
   width: 100%;
   border:0px solid transparent;
   border-radius: 0;
   border-bottom: 1px solid #aaa;
   padding: 1em .5em .5em;
   padding-left: 2em;
   outline:none;
   margin:1em auto;
   transition: all .5s ease;
}
.form__input:focus{
   border-bottom-color: #5ca9fb;
   box-shadow: 0 0 5px rgba(0,80,80,.4); 
   border-radius: 4px;
}
.btn{
   transition: all .5s ease;
   width: 100%;
   border-radius: 30px;
   color:#5ca9fb;
   font-weight: 600;
   background-color: #fff;
   border: 1px solid #5ca9fb;
   margin-top: 1.5em;
   margin-bottom: 1em;
}
.btn:hover, .btn:focus{
   background-color: #5ca9fb;
   color:#fff;
}
.hr-sect {
   display: flex;
   flex-basis: 100%;
   align-items: center;
   color: rgba(0, 0, 0, 0.35);
   font-size: 20px;
   margin: 8px 0px;
}
.hr-sect::before,
.hr-sect::after {
   content: "";
   flex-grow: 1;
   background: rgba(0, 0, 0, 0.35);
   height: 1px;
   font-size: 0px;
   line-height: 0px;
   margin: 0px 16px;
}
#footer
{
	top:820px
}
</style>
<sec:authorize access="isAnonymous()">
   <c:if test="${not empty param.NotLogin}">
   <script>
      alert('존재하지 않는 아이디입니다');
   </script>
   </c:if>
</sec:authorize>
<div class="container-fluid">
		<div class="row main-contents bg-success text-center">
			<div class="col-md-4 text-center company__info">
				<span style="width: 150px;height: 150px;align-self: center;" class="company__logo"><img style="width: 100%; height: auto;" class="img-responsive" src='<c:url value="/images/logo_white.png"/>' alt="로고이미지"></span></h2></span>
				<h3 class="company_title" style="color: white;"><u>Home'spital</u></h3>
			</div>
			<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
				<div class="container-fluid">
					<div class="row">
						<h2 style="margin-bottom: 0;margin-top: 20px;">로그인</h2>
					</div>
					<div class="row">
						<form id="login" method="post" action="<c:url value='/User/LoginProcess.hst'/>" control="#" class="form-group">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="row">
								<input type="text" name="id" id="id" class="form__input" placeholder="아이디">
							</div>
							<div class="row">
								<!-- <span class="fa fa-lock"></span> -->
								<input type="password" name="pass" id="pass" class="form__input" placeholder="비밀번호">
							</div>
							<div class="checkbox">
								<label for="remember_me">
									<input type="checkbox" name="saveId" id="saveId">
									아이디 저장
								</label>
							</div>
							<div class="row">
								<button class="btn" onclick="login();">로그인</button>
							</div>
						</form>
						<div class="row">
						<p>계정이 없으신가요? <a href="<c:url value='/Account/SignForm.hst'/>">회원가입</a></p>
					</div>
					</div>
					<div class="hr-sect">or</div>
					<div class="row" style="padding-bottom: 15px;">
						<div class="col-md-offset-2 col-md-8">
							<div class="col-md-4 col-xs-6">
								<a id="naver" href="#"> <img width="60"
									src='<c:url value="/images/snslogo/naver.png"/>' alt="네이버 로그인">
								</a>
							</div>
							<div class="col-md-4 col-xs-6">
								<a id="kakao" href="javascript:loginWithKakao()"> <img width="60"
									src='<c:url value="/images/snslogo/kakao.png"/>' alt="카카오 로그인">
								</a>
							</div>
							<div class="col-md-4 col-xs-6">
								<a id="facebook" href="javascript:checkLoginState()"> <img width="60"
									src='<c:url value="/images/snslogo/facebook.png"/>' alt="페이스북 로그인">
								</a>
							</div>
			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
   function login() {
      var id = $('#id');
      var pass = $('#pass');
      if ($.trim(id.val()) == '') {
         alert('아이디를 입력해 주세요.');
         id.focus();
         return;
      }
      if ($.trim(pass.val()) == '') {
         alert('비밀번호를 입력해 주세요.');
         pass.focus();
         return;
      }

      $('#login').submit();
   }
</script>
<script type="text/javascript" src='<c:url value="/js/kakao_login2.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/naver_login.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/facebook_login.js"/>'></script>

