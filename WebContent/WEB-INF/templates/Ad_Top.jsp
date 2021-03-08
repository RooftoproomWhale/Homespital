<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<title>Interact_Admin</title>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">



<!--     Fontfaces CSS -->
    <link href="<c:url value='/css/font-face.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/vendor/font-awesome-4.7/css/font-awesome.min.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/vendor/font-awesome-5/css/fontawesome-all.min.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/vendor/mdi-font/css/material-design-iconic-font.min.css'/>" rel="stylesheet" media="all">

<!--     Bootstrap CSS -->
    <link href="<c:url value='/vendor/bootstrap-4.1/bootstrap.min.css'/>" rel="stylesheet" media="all">

<!--     Vendor CSS -->
<%--     <link href="<c:url value='/vendor/animsition/animsition.min.css'/>" rel="stylesheet" media="all"> --%>
    <link href="<c:url value='/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/vendor/wow/animate.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/vendor/css-hamburgers/hamburgers.min.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/vendor/slick/slick.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/vendor/select2/select2.min.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/vendor/perfect-scrollbar/perfect-scrollbar.css'/>" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="<c:url value='/css/theme.css'/>" rel="stylesheet" media="all">
    
    <!-- Jquery JS-->
    <script src="<c:url value='/vendor/jquery-3.2.1.min.js'/>"></script>
    <script>
    var icon = '../img/logo.png';
    
//     $.ajax({
// 		url:'<c:url value="/Noti/authCount.hst"/>',
// 		dataType:'html',
// 		success:function(data){
// 				console.log("관리자 성공");
// 				console.log("제휴 승인 대기 수: " + data);
// 				admNotiTotal(data);
// 				},
// 		error:function(request,error){
// 			console.log('에러:',error);
// 		}
// 	});
	
	$.ajax({
		url:'<c:url value="/Noti/preAuthCount.hst"/>',
		dataType:'html',
		success:function(data){
				console.log("성공");
				console.log("로드 제휴 승인 대기 수: " + data);
				preAuthCount = data;
			},
		error:function(request,error){
			console.log('에러:',error);
		}
	});
	
	window.setInterval(function(){
		
		$.ajax({
			url:'<c:url value="/Noti/currAuthCount.hst"/>',
			dataType:'html',
			success:function(data){
					console.log("병원 성공");
					console.log("현재 제휴 승인 대기 수: " + data);
					if(data - preAuthCount > 0 )
					{
						console.log(data - preAuthCount);
						gapCount = data - preAuthCount;
						admNotiUpdate(gapCount);
						preAuthCount = data;
					}
				},
			error:function(request,error){
				console.log('에러:',error);
			}
		});
	}, 3000);
	
	function admNotiUpdate(count) {
		text = count + '개의 새로운 제휴 신청이 있습니다';
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
	
// 	function admNotiTotal(count) {
// 		text = count + '개의 제휴 신청이 대기중입니다';
// 		console.log(text);
// 		var options = 
// 			{
// 			      body: text,
// 			      icon: icon
// 		  	}
// 			var noti = new Notification('예약 알림이 있습니다', options)
			
// 			noti.onclick = function(event) {
// 				console.log('noti click');
// 				window.location.href = "<c:url value='/Hospage/Appointment.hst'/>";
// 			};
// 		}
    </script>
    

