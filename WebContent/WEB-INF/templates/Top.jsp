<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Interact</title>
<meta name="description" content="">
<meta name="author" content="">
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">
	
<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/nivo-lightbox/nivo-lightbox.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/nivo-lightbox/default.css'/>">
<link href="<c:url value='/vendor/font-awesome-4.7/css/font-awesome.min.css'/>" rel="stylesheet" media="all">
<link href="<c:url value='/vendor/font-awesome-5/css/fontawesome-all.min.css'/>" rel="stylesheet" media="all">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.24/themes/base/jquery-ui.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) 및 js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  
<%-- <script type="text/javascript" src="<c:url value='/js/jquery.1.11.1.js'/>"></script> --%>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>


<script type="text/javascript" src="<c:url value='/js/bootstrap.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value="/js/bootstrap.min.js"/>"></script> --%>
<script type="text/javascript" src="<c:url value='/js/SmoothScroll.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/nivo-lightbox.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jqBootstrapValidation.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/contact_me.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value='/js/main.js'/>"></script> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<%--<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>--%>


<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.css'/>">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" /> -->
<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/fonts/font-awesome/css/font-awesome.css'/>"> --%>

<style>
.dropdown:hover .dropdown-menu {display: block;}
.dropdown-menu:hover .dropdown-toggle {background-color: #3e8e41;}
</style>
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>

<script>
window.onload = function(){
	Notification.requestPermission().then(function(result) {
		  console.log(result);
		});
	
	Notification.requestPermission();
	
	function askNotificationPermission() {
		  // 권한을 실제로 요구하는 함수
		  function handlePermission(permission) {
		    // 사용자의 응답에 관계 없이 크롬이 정보를 저장할 수 있도록 함
		    if(!('permission' in Notification)) {
		      Notification.permission = permission;
		    }

		    // 사용자 응답에 따라 단추를 보이거나 숨기도록 설정
		    if(Notification.permission === 'denied' || Notification.permission === 'default') {
		      notificationBtn.style.display = 'block';
		    } else {
		      notificationBtn.style.display = 'none';
		    }
		  }

		  // 브라우저가 알림을 지원하는지 확인
		  if (!('Notification' in window)) {
		    console.log("이 브라우저는 알림을 지원하지 않습니다.");
		  } else {
		    if(checkNotificationPromise()) {
		      Notification.requestPermission()
		      .then((permission) => {
		        handlePermission(permission);
		      })
		    } else {
		      Notification.requestPermission(function(permission) {
		        handlePermission(permission);
		      });
		    }
		  }
		}
	
	function checkNotificationPromise() {
	    try {
	      Notification.requestPermission().then();
	    } catch(e) {
	      return false;
	    }

	    return true;
	  }
	
	//web notification 설정
	var icon = '../img/logo.png';
	var userRole = $('#userRole').val();
	var userId = $('#userId').val();
	var preAptCount = 0;
	
	console.log("id: " + userId +"type:"+ typeof(userId));
	console.log("role: " + userRole +"type:"+ typeof(userRole));
	
	if(userRole == "MEM")
	{
		var date = new Date();
		var currHour = date.getHours().toString();
		var currMin = (date.getMinutes()<10?'0':'') + date.getMinutes();
		var currTime = parseInt(currHour) * 60 + parseInt(currMin);
		
// 		$.ajax({
// 			url:'<c:url value="/Noti/getMediTime.hst"/>',
// 			dataType:'json',
// 			success:function(data){
// 				console.log("멤버 성공")
// 				console.log(data);
// 				console.log("현재시간: " + currTime);
// 				$.each(data, function(i, item) {
// 		             console.log(item.alarm);
// 		             var takeTime = item.alarm;
// 		             console.log("takeTime: " + takeTime);
// 		             var hour = takeTime.substring(0, 2);
// 		             var min = takeTime.substring(2, 4);
// 		             var time = parseInt(hour) * 60 + parseInt(min);
// 		             console.log("time: " + time);
// 		             timeGap = time - currTime;
// 		             console.log("gap: " + timeGap);
// 		             if(timeGap > 0 && timeGap <= 30)
// 		             {
// 		            	 console.log("30 사이 인");
// 		            	 memNoti30();
// // 		            	 androidMemFCM();
// 							return false;
// 		             }
// 		         })
// 				},
// 			error:function(request,error){
// 				console.log('에러:',error);
// 			}
// 		});
		
		takeTimeInt = setInterval(function() {
			date = new Date();
			currHour = date.getHours().toString();
			currMin = (date.getMinutes()<10?'0':'') + date.getMinutes();
			currTime = parseInt(currHour) * 60 + parseInt(currMin);
			
			$.ajax({
				url:'<c:url value="/Noti/getMediTime.hst"/>',
				dataType:'json',
				success:function(data){
					console.log("멤버 성공")
					console.log(data);
					console.log("현재시간: " + currTime);
					$.each(data, function(i, item) {
			             console.log(item.alarm);
			             var takeTime = item.alarm;
			             console.log("takeTime: " + takeTime);
			             var hour = takeTime.substring(0, 2);
			             var min = takeTime.substring(2, 4);
			             var time = parseInt(hour) * 60 + parseInt(min);
			             console.log("time: " + time);
			             timeGap = time - currTime;
			             console.log("gap: " + timeGap);
			             if(timeGap == 0)
			             {
			            	 memNoti0();
			            	 androidMemFCM();
			            	 clearInterval(takeTimeInt);
								return false;
			             }
			         })
					},
				error:function(request,error){
					console.log('에러:',error);
				}
			});
		}, 4000);
		
		//예약 승인
		var preAptCountUser = 0;
		$.ajax({
			url:'<c:url value="/Noti/preAptCountUser.hst"/>',
			dataType:'html',
			success:function(data){
					console.log("성공");
 					console.log("user 로드 예약 수: " + data);
 					preAptCountUser = data;
				},
			error:function(request,error){
				console.log('에러:',error);
			}
		});
		
		window.setInterval(function(){
			
			$.ajax({
				url:'<c:url value="/Noti/currAptCountUser.hst"/>',
				dataType:'json',
				success:function(data){
					console.log("user 예약 성공");
					console.log("user 현재 예약 수: " + data);
					if(data - preAptCountUser > 0 )
					{
						console.log(data - preAptCountUser);
						gapCount = data - preAptCountUser;
						userAptNoti(gapCount);
						preAptCountUser = data;
					}
					},
				error:function(request,error){
					console.log('에러:',error);
				}
			});
		}, 3000);
	}
	else if(userRole == "HOS")
	{
// 		$.ajax({
// 			url:'<c:url value="/Noti/dayAptCount.hst"/>',
// 			dataType:'html',
// 			success:function(data){
// 					console.log("병원 성공");
// 					console.log("오늘 예약 수: " + data);
// 						hosNotiDay(data);
// 					},
// 			error:function(request,error){
// 				console.log('에러:',error);
// 			}
// 		});
		
		$.ajax({
			url:'<c:url value="/Noti/preAptCount.hst"/>',
			dataType:'html',
			success:function(data){
					console.log("성공");
// 					console.log("로드 예약 수: " + data);
					preAptCount = data;
				},
			error:function(request,error){
				console.log('에러:',error);
			}
		});
		
		window.setInterval(function(){
			
			$.ajax({
				url:'<c:url value="/Noti/currAptCount.hst"/>',
				dataType:'html',
				success:function(data){
						console.log("병원 성공");
						console.log("현재 예약 수: " + data);
						if(data - preAptCount != 0 )
						{
							console.log(data - preAptCount);
							gapCount = data - preAptCount;
							hosNoti(gapCount);
							preAptCount = data;
						}
					},
				error:function(request,error){
					console.log('에러:',error);
				}
			});
		}, 3000);
	}
	else
	{
		
	}

	var text;
	function memNoti30() {
		text = '30분 안에 복용 해야할 약이 있습니다';
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('복약 알림이 있습니다', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/mypage/administration.hst'/>";
			};
		}
	
	function memNoti0() {
		text = '약 복용 시간입니다';
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('복약 알림이 있습니다', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/mypage/administration.hst'/>";
			};
		}
	
	function hosNoti(count) {
		text = count + '개의 새로운 예약이 있습니다';
		console.log(text);
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('예약 알림이 있습니다', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/Hospage/Appointment.hst'/>";
			};
		}
	
	function hosNotiDay(count) {
		text = '오늘 ' + count + '개의 예약이 있습니다';
		console.log(text);
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('예약 알림이 있습니다', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/Hospage/Appointment.hst'/>";
			};
		}
	
	function userAptNoti() {
		text = '승인 대기중이던 예약이 승인되었습니다';
		console.log(text);
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('예약이 승인되었습니다', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/mypage/ReservationList.hst'/>";
			};
		}
	
	function androidMemFCM() {
		
		$.ajax({
			url:'<c:url value="/Noti/androidFCM.hst"/>',
			dataType:'text',
			success:function(data){
					console.log("androidFCM 요청 성공");
				},
			error:function(request,error){
				console.log('에러:',error);
			}
		});
		
		}
	
}
</script>	
<nav id="menu" class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<input type="hidden" id="userId" value="${user }"/>
		<input type="hidden" id="userRole" value="${role }"/>
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll"
				href='<c:url value="/Home/ToHomePage.hst"/>'>홈스피탈</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href='<c:url value="/Admin/Notice.hst"/>'>Notice</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false"> Services <span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/Homespital/Map.hst'/>">병원/약국
								찾기</a></li>
						<li class="divider"></li>
						<!--  
						<li><a href='<c:url value="/Homespital/MedicineForm.hst"/>'>안전상비의약품</a></li>
						<li class="divider"></li>
						-->
						<li><a href="<c:url value='/Calendar/calendar.hst'/>">일정 관리</a></li>
						<li class="divider"></li>
						<!--  
						<li><a href="<c:url value='/Homespital/Health_info.hst'/>">예방 정보</a></li>
						-->
						<li><a href="<c:url value='/Covid/View.hst'/>">코로나 현황</a></li>
					</ul></li>

				<sec:authorize access="isAnonymous()">
					<li><a href="<c:url value='/User/Login.hst'/>"
						class="page-scroll">Login</a></li>
					<li><a href="<c:url value='/Account/SignForm.hst'/>">SignUp</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a id="logout" href="<c:url value='/User/Logout.hst'/>">Logout</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_MEM')">
					<li><a href="<c:url value='/mypage/mypage.hst'/>">MyPage</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADM')">
					<li><a href="<c:url value='/Admin/Index.hst'/>">Admin</a></li>
				</sec:authorize>
					<li><a href="<c:url value='/QnA/QnA.hst'/>">Q&A</a></li>
				<sec:authorize access="hasRole('ROLE_HOS')">
					<li><a href="<c:url value='/Hospage/main.hst'/>">MyHospital</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>
</html>