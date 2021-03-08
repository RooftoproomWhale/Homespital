<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<style>

		<!--캐러셀 css-->
        /*jssor slider bullet skin 057 css*/
        .jssorb057 .i {position:absolute;cursor:pointer;}
        .jssorb057 .i .b {fill:none;stroke:#fff;stroke-width:2200;stroke-miterlimit:10;stroke-opacity:0.4;}
        .jssorb057 .i:hover .b {stroke-opacity:.7;}
        .jssorb057 .iav .b {stroke-opacity: 1;}
        .jssorb057 .i.idn {opacity:.3;}

        /*jssor slider arrow skin 051 css*/
        .jssora051 {display:block;position:absolute;cursor:pointer;}
        .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
        .jssora051:hover {opacity:.8;}
        .jssora051.jssora051dn {opacity:.5;}
        .jssora051.jssora051ds {opacity:.3;pointer-events:none;}
       
        #news {
    animation: fadein 2s;
    -webkit-animation: fadein 2s; /* Safari and Chrome */
}
        #tit {
    animation: fadein 2s;
    -webkit-animation: fadein 2s; /* Safari and Chrome */
}

@-webkit-keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
#footer{
	top:2200px;
}
header .intro-text {
    padding-top: 287px;
}
.sectionOne
{
    opacity:0;
    margin-top:-100px;    
    max-width:100%;
}
.sectionTwo
{
    opacity:0;
    margin-top:300px;    
    max-width:100%;
}
</style>
<script>
window.onload = function(){

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
		            	 memNoti30();
// 		            	 androidMemFCM();
							return false;
		             }
		         })
				},
			error:function(request,error){
				console.log('에러:',error);
			}
		});
		
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
		}, 40000);
		
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
// 						console.log("병원 성공");
// 						if(data != 0)
// 						{
// 							console.log("오늘 예약 수: " + data);
// 							hosNotiDay(data);
// 						}
// 						else
// 						{
// 							console.log("오늘 예약 수: " + data);
// 							hosNotiDayNo();
// 						}
						
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
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Interact</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- 캐러셀에 필요 -->
<script type="text/javascript" src="<c:url value="/js/jssor.slider-28.0.0.min.js"/>" ></script>

</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	<!-- Header -->
	<header id="header">
		<div class="intro">
			<div class="overlay">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 intro-text" id="tit">
							<h1> We Are Home'spital ${currAptCount}</h1>
							<p style="font-weight: bold; color: gray;">컴퓨터와 스마트폰으로 병원 예약 및 복약 관리를 손쉽게 하세요!</p>
<!-- 							<a id="" class="btn btn-custom btn-lg page-scroll"><span style="font-weight: bold; font-size: 16px;">이용하기</span></a> -->
<%-- 							<a href="<c:url value='/Android/WebTest.hst'/>" id="" class="btn btn-custom btn-lg page-scroll"><span style="font-weight: bold; font-size: 16px;">이용하기</span></a> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div class="container-fluid">
	<div class="sectionOne">
		<div class="row" style="padding-top: 50px">
			<div class="col-md-5 col-md-offset-1 col-sm-12">
				<div id="jssor_1"
					style="position: relative; margin-top: 10px; margin-bottom: 50px; top: 0px; left: 0px; width: 680px; height: 380px; overflow: hidden; visibility: hidden; "
					align="left">

					<!-- Loading Screen -->
					<div class="img-thumbnail" data-u="slides"
						style="cursor: default; position: relative; top: 0px; left: 0px; width: 680px; height: 380px; overflow: hidden;">
						<div data-p="680">
							<a id="noti1" href="<c:url value='/Admin/NoticeDetail.hst?no=${list[0].noti_no }'/>">
								<img id="img1" data-u="image" src='<c:url value="/images/no_noti.png"/>' />
							</a>
						</div>
						<div data-p="680">
							<a id="noti2" href="<c:url value='/Admin/NoticeDetail.hst?no=${list[1].noti_no }'/>">
								<img id="img2" data-u="image" src='<c:url value="/images/no_noti.png"/>' />
							</a>
						</div>
						<div data-p="680">
							<a id="noti3" href="<c:url value='/Admin/NoticeDetail.hst?no=${list[2].noti_no }'/>">
								<img id="img3" data-u="image" src='<c:url value="/images/no_noti.png"/>' />
							</a>
						</div>
						<div data-p="680">
							<a id="noti4" href="<c:url value='/Admin/NoticeDetail.hst?no=${list[3].noti_no }'/>">
								<img id="img4" data-u="image" src='<c:url value="/images/no_noti.png"/>' />
							</a>
						</div>
					</div>
					<!-- Bullet Navigator -->
					<div data-u="navigator" class="jssorb057"
						style="position: absolute; bottom: 16px; right: 16px;"
						data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
						<div data-u="prototype" class="i"
							style="width: 14px; height: 14px;">
							<svg viewbox="0 0 16000 16000"
								style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                    <circle class="b" cx="8000" cy="8000" r="5000"
									fill="red"></circle>
                </svg>
						</div>
					</div>
					<!-- Arrow Navigator -->
					<div data-u="arrowleft" class="jssora051"
						style="width: 65px; height: 65px; top: 0px; left: 25px;"
						data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
						<svg viewbox="0 0 16000 16000"
							style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                <polyline class="a"
								points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
					</div>
					<div data-u="arrowright" class="jssora051"
						style="width: 65px; height: 65px; top: 0px; right: 25px;"
						data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
						<svg viewbox="0 0 16000 16000"
							style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                <polyline class="a"
								points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
					</div>
				</div>
			</div>
			<!-- Issue Section -->
			<div class="col-md-5 col-md-offset-1 col-sm-12" style="">
				<div class="row" style="margin-bottom: 14px">
					<span style="color: #000000; font-size: 20pt; font-weight: bold;">코로나 속보<span id=date_co style="font-size:0.7em;color:#5D5D5D"></span></span>
				</div>
				<div class="row" id="news" style="font-size: 12pt; padding-bottom: 20px;"></div>
			</div>
		</div>
		</div>
	


	<!-- Services Section -->
	<div class="sectionTwo">
	<div id="services" class="text-center">
		<div class="container">
			<div class="section-title">
				<h2>Our Services</h2>
				<p>홈스피탈에서 제공 하는 서비스</p>
			</div>
			<div class="row">
				<div class="col-md-4" style="cursor: pointer"  
					onclick="location.href='<c:url value='/Homespital/Map.hst'/>'">
					<i class="fa fa-plus-square"></i>
					<div class="service-desc">
						<h3>약국 찾기</h3>
						<p>현 위치 중심으로 공적 마스크 및 약국 찾기 서비스</p>
					</div>
				</div>
				<div class="col-md-4" style="cursor: pointer"
					onclick="location.href='<c:url value='/Homespital/Map.hst'/>'">
					<i class="fa fa-hospital-o"></i>
					<div class="service-desc">
						<h3>병원 찾기</h3>
						<p>현 위치 중심으로  병원 위치 찾기 서비스 </p>
					</div>
				</div>
				<div class="col-md-4" style="cursor: pointer" onclick="location.href='<c:url value='/mypage/administration.hst'/>'">
					<i class="fa fa-medkit"></i>
					<div class="service-desc">
						<h3>복약 관리</h3>
						<p>현재 복용 중인 약에 관해 상세히 알아 볼 수 있는 서비스</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4" style="cursor: pointer"
					onclick="location.href='<c:url value='/mypage/Prevention.hst'/>'">
					<i class="fa fa-language"></i>
					<div class="service-desc">
						<h3>예방 정보</h3>
						<p>시즌별 주의 해야 할 예방 정보 서비스</p>
					</div>
				</div>
				<div class="col-md-4" style="cursor: pointer" onclick="location.href='<c:url value='/Calendar/calendar.hst'/>'">
					<i class="fa fa-calendar"></i>
					<div class="service-desc">
						<h3>일정 관리</h3>
						<p>복용 알림 서비스 및 해당 병원 예약 서비스</p>
					</div>
				</div>
				<div class="col-md-4" style="cursor: pointer" onclick="location.href='<c:url value='/Covid/View.hst'/>'">

					<i class="fa fa-pie-chart"></i>
					<div class="service-desc">
						<h3>코로나 현황</h3>
						<p>각 국가별 코로나 현황 및 국내 (시/도) 코로나 현황 서비스</p>
					</div>
					<table>
						<tr style="border: thin; border-color: aqua;">
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</body>
<script>
	$(function(){
		showNews();	
		showNotice();
		
		setInterval(() => {
			showNews();	
		}, 60000);
	
		function showNews(){
			
			$.ajax({
				/* url:"<c:url value='/News'/>",
				data:{"clientId":"GVe_m816Ap0X5nw8XFXQ","clientSecret":"6JAsTo47hF"},
				type:'get',
				dataType: "json",
				success:function(data){
					console.log(data);
					var news = "<table class='table' style='width:80%; border: 3px solid #0051ff'>";
					if(data.length==0){
						news+="<li>뉴스 데이터가 없습니다</li>";
					} 
					$.each(data.items, function(index, element) {
						console.log(element.title);
						news+="<tr><td><a href='"+element.originallink+"' target=_blank>"+element.title+"</a><td></tr>";
					});
					news+="</table>";
					
					$('#news').html(news);
				},
				error:function(e){console.log('에러:',e)} */
					url:"https://homespital.com.ngrok.io/covid/",
					type:'get',
					dataType:"json",
					success:function(data){
						var news = "<table class='table' id='news' style='width:80%;border: 2px solid rgba(0,0,0,.12);'>";
			if(data.length==0){
							news+="<li>뉴스 데이터가 없습니다</li>";
						} 
						$.each(data, function(index, element) {
							console.log(element)
							news+="<tr><td style='border-top:none;border-bottom:1px solid #ddd'><a href='"+element.href+"' target=_blank>"+element.title+"</a><td></tr>";
						});
						news+="</table>";
						$('#news').html(news);
					},
					error:function(e){console.log('에러:',e)} 
			});			
		}
		
		function showNotice(){
			
			$.ajax({
				url:"<c:url value='/Admin/NoticeImages.hst'/>",
				type:'post',
				success:function(data){
					console.log(data);
					var noti = JSON.parse(data);
					console.log(noti[0]);
					$('#img1').attr('src',noti[0].file_addr);
					console.log($('#img1').attr('src'));
					$('#img2').attr('src',noti[1].file_addr);
					$('#img3').attr('src',noti[2].file_addr);
					$('#img4').attr('src',noti[3].file_addr);
					//$('.img-thumbnail').html(comments);
					
					$('#noti1').attr('href', "<c:url value='/Admin/NoticeDetail.hst?no= " + noti[0].noti_no + " '/>");
					$('#noti2').attr('href', "<c:url value='/Admin/NoticeDetail.hst?no= " + noti[1].noti_no + " '/>");
					$('#noti3').attr('href', "<c:url value='/Admin/NoticeDetail.hst?no= " + noti[2].noti_no + " '/>");
					$('#noti4').attr('href', "<c:url value='/Admin/NoticeDetail.hst?no= " + noti[3].noti_no + " '/>");
				},
				error:function(e){console.log('에러:',e)}
			})
		}
		
		$(window).scroll( function(){
	        $('.sectionOne').each( function(i){
	            
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            
	            if( bottom_of_window > bottom_of_element - 100 ){
	                $(this).animate({'opacity':'1','margin-top':'0px'}, 1000);
	            }
	            
	        }); 
	        
			$('.sectionTwo').each( function(i){
	            
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            
	            if( bottom_of_window > bottom_of_element - 900 ){
	                $(this).animate({'opacity':'1','margin-top':'0px'}, 1000);
	            }
	            
	        }); 
	    });
		
	});
	
</script>
</html>