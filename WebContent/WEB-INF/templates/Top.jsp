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

    
    <!-- jQuery (?????????????????? ?????????????????? ??????????????? ?????? ???????????????) ??? js -->
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
		  // ????????? ????????? ???????????? ??????
		  function handlePermission(permission) {
		    // ???????????? ????????? ?????? ?????? ????????? ????????? ????????? ??? ????????? ???
		    if(!('permission' in Notification)) {
		      Notification.permission = permission;
		    }

		    // ????????? ????????? ?????? ????????? ???????????? ???????????? ??????
		    if(Notification.permission === 'denied' || Notification.permission === 'default') {
		      notificationBtn.style.display = 'block';
		    } else {
		      notificationBtn.style.display = 'none';
		    }
		  }

		  // ??????????????? ????????? ??????????????? ??????
		  if (!('Notification' in window)) {
		    console.log("??? ??????????????? ????????? ???????????? ????????????.");
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
	
	//web notification ??????
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
// 				console.log("?????? ??????")
// 				console.log(data);
// 				console.log("????????????: " + currTime);
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
// 		            	 console.log("30 ?????? ???");
// 		            	 memNoti30();
// // 		            	 androidMemFCM();
// 							return false;
// 		             }
// 		         })
// 				},
// 			error:function(request,error){
// 				console.log('??????:',error);
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
					console.log("?????? ??????")
					console.log(data);
					console.log("????????????: " + currTime);
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
					console.log('??????:',error);
				}
			});
		}, 4000);
		
		//?????? ??????
		var preAptCountUser = 0;
		$.ajax({
			url:'<c:url value="/Noti/preAptCountUser.hst"/>',
			dataType:'html',
			success:function(data){
					console.log("??????");
 					console.log("user ?????? ?????? ???: " + data);
 					preAptCountUser = data;
				},
			error:function(request,error){
				console.log('??????:',error);
			}
		});
		
		window.setInterval(function(){
			
			$.ajax({
				url:'<c:url value="/Noti/currAptCountUser.hst"/>',
				dataType:'json',
				success:function(data){
					console.log("user ?????? ??????");
					console.log("user ?????? ?????? ???: " + data);
					if(data - preAptCountUser > 0 )
					{
						console.log(data - preAptCountUser);
						gapCount = data - preAptCountUser;
						userAptNoti(gapCount);
						preAptCountUser = data;
					}
					},
				error:function(request,error){
					console.log('??????:',error);
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
// 					console.log("?????? ??????");
// 					console.log("?????? ?????? ???: " + data);
// 						hosNotiDay(data);
// 					},
// 			error:function(request,error){
// 				console.log('??????:',error);
// 			}
// 		});
		
		$.ajax({
			url:'<c:url value="/Noti/preAptCount.hst"/>',
			dataType:'html',
			success:function(data){
					console.log("??????");
// 					console.log("?????? ?????? ???: " + data);
					preAptCount = data;
				},
			error:function(request,error){
				console.log('??????:',error);
			}
		});
		
		window.setInterval(function(){
			
			$.ajax({
				url:'<c:url value="/Noti/currAptCount.hst"/>',
				dataType:'html',
				success:function(data){
						console.log("?????? ??????");
						console.log("?????? ?????? ???: " + data);
						if(data - preAptCount != 0 )
						{
							console.log(data - preAptCount);
							gapCount = data - preAptCount;
							hosNoti(gapCount);
							preAptCount = data;
						}
					},
				error:function(request,error){
					console.log('??????:',error);
				}
			});
		}, 3000);
	}
	else
	{
		
	}

	var text;
	function memNoti30() {
		text = '30??? ?????? ?????? ????????? ?????? ????????????';
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('?????? ????????? ????????????', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/mypage/administration.hst'/>";
			};
		}
	
	function memNoti0() {
		text = '??? ?????? ???????????????';
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('?????? ????????? ????????????', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/mypage/administration.hst'/>";
			};
		}
	
	function hosNoti(count) {
		text = count + '?????? ????????? ????????? ????????????';
		console.log(text);
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('?????? ????????? ????????????', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/Hospage/Appointment.hst'/>";
			};
		}
	
	function hosNotiDay(count) {
		text = '?????? ' + count + '?????? ????????? ????????????';
		console.log(text);
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('?????? ????????? ????????????', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/Hospage/Appointment.hst'/>";
			};
		}
	
	function userAptNoti() {
		text = '?????? ??????????????? ????????? ?????????????????????';
		console.log(text);
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('????????? ?????????????????????', options)
			
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
					console.log("androidFCM ?????? ??????");
				},
			error:function(request,error){
				console.log('??????:',error);
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
				href='<c:url value="/Home/ToHomePage.hst"/>'>????????????</a>
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
						<li><a href="<c:url value='/Homespital/Map.hst'/>">??????/??????
								??????</a></li>
						<li class="divider"></li>
						<!--  
						<li><a href='<c:url value="/Homespital/MedicineForm.hst"/>'>?????????????????????</a></li>
						<li class="divider"></li>
						-->
						<li><a href="<c:url value='/Calendar/calendar.hst'/>">?????? ??????</a></li>
						<li class="divider"></li>
						<!--  
						<li><a href="<c:url value='/Homespital/Health_info.hst'/>">?????? ??????</a></li>
						-->
						<li><a href="<c:url value='/Covid/View.hst'/>">????????? ??????</a></li>
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