<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- Main CSS-->
<link href="<c:url value='/css/theme.css'/>" rel="stylesheet" media="all">
<script>
$(function() {
	
//메시지 수신 받는 eventListener 등록
window.addEventListener( 'message', receiveMsgFromChild );
var child = document.getElementById('iframe');
console.log('---------------')
console.log(child)
console.log('---------------')
// 자식으로부터 메시지 수신
function receiveMsgFromChild( e ) {
    console.log( '자식으로부터 받은 메시지 ', e.data );
    var dname=e.data
    console.log(dname)
    $.ajax({		
        type: "post",
        dataType:"json",
        url: "/proj/Calendar/Management.hst",/*"/proj/calendar/data.json",*/
        data: {'dname':dname},
        success: function (response) {
        	
        	console.log(response);
        	sendMsgToChild(response);
      
      }
        ,error:function(request,error){
  			console.log('상태코드:',request.status);
  			console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
  			console.log('에러:',error);
  		
  		}
      })
      function sendMsgToChild( msg ) {
    child.contentWindow.postMessage( msg, '*' );
}
    
    
}
})
</script>
<style>

.sticky-btn {

   position: fixed;

   bottom: 19px;

   right: 10px;

   z-index: 1231234;

   color: #ff0000

   

}

#fa1:hover {
   color: #ffffff
}

#fa2:hover {
   color: #ff9900
}

</style>
<body>
   <div class="sticky-btn">
      <span class="fa-stack fa-3x" data-toggle="modal"
         data-target="#chat-modal"> <%--          <i class="fa fa-circle fa-stack-2x" style=" color: #ff9900; cursor:pointer" onclick="location.href='<c:url value="/Home/ToHomePage.hst"/>'"></i>  --%>
         <%--         <i class="fa fa-user-md fa-stack-1x fa-inverse" style=" color: #ffffff; cursor:pointer" onclick="location.href='<c:url value="/Home/ToHomePage.hst"/>'"></i>  --%>
         <i id="fa1" class="fa fa-circle fa-stack-2x" style="color: #ff9900;"></i>
         <i id="fa2" class="fa fa-user-md fa-stack-1x fa-inverse"
         style="color: #ffffff;"></i>
      </span>
   </div>
   <div class="modal fade" id="chat-modal">
      <div class="modal-dialog">
         <div class="col-lg-12">
            <div class="au-card au-card--no-shadow au-card--no-pad m-b-40 au-card--border">
               <div class="au-card-title"
                  style="background-image: url('images/bg-title-02.jpg');">
                  <div class="bg-overlay bg-overlay--blue"></div>
                  <h3>
                     <i class="zmdi zmdi-comment-text"></i>Chat
                  </h3>
                  <button class="au-btn-plus">
                     <i class="zmdi zmdi-plus"></i>
                  </button>
               </div>
               <div class="au-inbox-wrap">
                  <div class="au-chat au-chat--border">
                     <div class="au-chat__title">
                        <div class="au-chat-info">
                           <div class="avatar-wrap online">
                              <div class="avatar avatar--small">
                                 <img src="<c:url value='/images/botIcon.png'/>">
                              </div>
                           </div>
                           <span class="nick"> <a href="#">홈스피탈</a>
                           </span>
                        </div>
                        </div>
                        <sec:authorize access="hasRole('ROLE_MEM')">
                        <sec:authentication var="principal" property="principal" /><iframe id="iframe"
	                        style="min-height: 60vh;"
	                        width="100%"
	                        height="90%"
	                        src="https://homespital.chat.ngrok.io/?mem_email=${principal.username}"
	                        allowfullscreen>

	                     </iframe>
	                     
	                 </sec:authorize>
	                 <sec:authorize access="isAnonymous()">
	                 	<div class="au-chat__content au-chat__content2 js-scrollbar5">
							<div class="recei-mess-wrap">
								<div class="recei-mess__inner">
									<div class="avatar avatar--tiny">
										<img src="<c:url value='/images/botIcon.png'/>">
									</div>
									<div class="recei-mess-list">
										<div class="recei-mess">안녕하세요 홈스피탈 입니다.</div>
										<div class="recei-mess">챗봇 서비스는 로그인 후에 이용 가능합니다 로그인해주세요!</div>
									</div>
								</div>
							</div>
						</div>
						<div class="au-chat-textfield">
							<form class="au-form-icon">
								<input class="au-input au-input--full au-input--h65"
									type="text" disabled>
								<button class="au-input-icon">
									<i class="far fa-paper-plane"></i>
								</button>
							</form>
						</div>
	                 </sec:authorize>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>
