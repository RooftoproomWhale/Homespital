<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
#sidebar-collapse{
	box-shadow: 0 20px 30px #333
}
</style>
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
		             if(timeGap > 0 && timeGap <= 30)
		             {
		            	 memNoti();
							return false;
		             }
		         })
				},
			error:function(request,error){
				console.log('에러:',error);
			}
		});
		
		window.setInterval(function(){
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
			             if(timeGap == 30)
			             {
			            	 memNoti();
								return false;
			             }
			         })
					},
				error:function(request,error){
					console.log('에러:',error);
				}
			});
		}, 60000);
		
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
		$.ajax({
			url:'<c:url value="/Noti/dayAptCount.hst"/>',
			dataType:'html',
			success:function(data){
						console.log("병원 성공");
						if(data > 0)
						{
							console.log("오늘 예약 수: " + data);
							hosNotiDay(data);
						}
						else
						{
							console.log("오늘 예약 수: " + data);
							hosNotiDayNo();
						}
						
					},
			error:function(request,error){
				console.log('에러:',error);
			}
		});
		
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
						if(data - preAptCount > 0 )
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
	function memNoti() {
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
	
	function hosNotiDayNo() {
		text = '오늘은 예약이 없습니다';
		console.log(text);
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('예약 알림', options)
			
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
	
}
</script>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
<input type="hidden" id="userId" value="${user }"/>
<input type="hidden" id="userRole" value="${role }"/>
		<div class="profile-sidebar">
			<div class="profile-userpic">
			  	<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">${list[0].hosp_name }</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<ul class="nav menu">
		<!--	<li class="active"><a href="<c:url value='/Home/ToHomePage.hst'/>"><em class="fa fa-home"></em> Homespital 홈으로 이동</a></li>
			  <li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> 병원 정보 관리 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="<c:url value='/Hospage/main.hst'/>">
						<span class="fa fa-arrow-right">&nbsp;</span> 병원 정보 보기
					</a></li>
					<li><a class="" href="<c:url value='/Hospage/Edit.hst'/>">
						<span class="fa fa-arrow-right">&nbsp;</span> 정보 수정
					</a></li>
					<li><a class="" href="<c:url value='/Hospage/Cancel.hst'/>">
						<span class="fa fa-arrow-right">&nbsp;</span> 제휴 취소
					</a></li>
				</ul>
			</li>-->
			<li><a href="<c:url value='/Hospage/main.hst'/>"> 병원 정보</a></li>
			<li><a href="<c:url value='/Hospage/Edit.hst'/>"> 정보 수정</a></li>
			<li><a href="<c:url value='/Hospage/Appointment.hst'/>"> 예약 관리</a></li>
			<li><a href="<c:url value='/Hospage/Cancel.hst'/>"> 제휴 관리</a></li>
			<li><a href="<c:url value='/User/Logout.hst'/>"> 로그아웃 </a></li>
<%-- 			<li><a href="<c:url value='/Hospage/Chart.hst'/>"><i class="fas fa-chart-bar"></i> 통계 </a></li> --%>
		<!--  	<li><a href="<c:url value='/User/Login.hst'/>"><em class="fa fa-power-off">&nbsp;</em> 로그아웃 </a></li>-->
		</ul>
	</div><!-- /.sidebar -->
