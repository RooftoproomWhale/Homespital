<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script>
$(function() {
	var icon = '../img/logo.png';
// 	var userRole = $('#userRole').val();
// 	var userId = $('#userId').val();
	
// 	console.log("id: " + userId +"type:"+ typeof(userId));
// 	console.log("role: " + userRole +"type:"+ typeof(userRole));
	
	$.ajax({
		url:'<c:url value="/Noti/authCount.hst"/>',
		dataType:'html',
		success:function(data){
				console.log("관리자 성공");
				console.log("제휴 승인 대기 수: " + data);
				admNotiTotal(data);
				},
		error:function(request,error){
			console.log('에러:',error);
		}
	});
	
// 	$.ajax({
// 		url:'<c:url value="/Noti/preAuthCount.hst"/>',
// 		dataType:'html',
// 		success:function(data){
// 				console.log("성공");
// 				console.log("로드 제휴 승인 대기 수: " + data);
// 				preAuthCount = data;
// 			},
// 		error:function(request,error){
// 			console.log('에러:',error);
// 		}
// 	});
	
// 	window.setInterval(function(){
		
// 		$.ajax({
// 			url:'<c:url value="/Noti/currAuthCount.hst"/>',
// 			dataType:'html',
// 			success:function(data){
// 					console.log("병원 성공");
// 					console.log("현재 제휴 승인 대기 수: " + data);
// 					if(data - preAuthCount != 0 )
// 					{
// 						console.log(data - preAuthCount);
// 						gapCount = data - preAuthCount;
// 						admNotiUpdate(gapCount);
// 						preAuthCount = data;
// 					}
// 				},
// 			error:function(request,error){
// 				console.log('에러:',error);
// 			}
// 		});
// 	}, 3000);
	
// 	function admNotiUpdate(count) {
// 		text = count + '개의 새로운 제휴 신청이 있습니다';
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
	
	function admNotiTotal(count) {
		text = count + '개의 제휴 신청이 대기중입니다';
		console.log(text);
		var options = 
			{
			      body: text,
			      icon: icon
		  	}
			var noti = new Notification('새로운 제휴 신청이 있습니다', options)
			
			noti.onclick = function(event) {
				console.log('noti click');
				window.location.href = "<c:url value='/Admin/HosAuth.hst'/>";
			};
		}
	
	$.ajax({
	      url:"<c:url value='/Admin/Counts.hst'/>",
	      type:'get',
	      datatype:'json',
	      data:{},
	      beforeSend: function () {
	         console.log("beforeSend");
	      },
	      complete: function () {
	         console.log("complete");
	      },
	      success:function(data){
	    	  console.log("성공", data);
	    	  
	      },
	      error:function(request,status,error){
				console.log("연결 실패");
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			} 
	       
	    });
	
	$.ajax({
	    url:"<c:url value='/Admin/RecentChart.hst'/>",
	    type:'get',
	    datatype:'html',
	    data:{},
	    beforeSend: function () {
	       console.log("beforeSend");
	    },
	    complete: function () {
	       console.log("complete");
	    },
	    success:function(data){
	       console.log("연결성공", typeof(data));
	       try {

//             var janMemCount = $('#janMemCount').val();
//             var febMemCount = $('#febMemCount').val();
//             var marMemCount = $('#marMemCount').val();
//             var aprMemCount = $('#aprMemCount').val();
//             var mayMemCount = $('#mayMemCount').val();
//             var junMemCount = $('#junMemCount').val();
            var janMemCount = 12;
            var febMemCount = 17;
            var marMemCount = 25;
            var aprMemCount = 40;
            var mayMemCount = 33;
            var junMemCount = 38;
            var julMemCount = $('#julMemCount').val();
            
//             var janAptCount = $('#janAptCount').val();
//             var febAptCount = $('#febAptCount').val();
//             var marAptCount = $('#marAptCount').val();
//             var aprAptCount = $('#aprAptCount').val();
//             var mayAptCount = $('#mayAptCount').val();
//             var junAptCount = $('#junAptCount').val();
            var janAptCount = 8;
            var febAptCount = 16;
            var marAptCount = 28;
            var aprAptCount = 44;
            var mayAptCount = 52;
            var junAptCount = 36;
            var julAptCount = $('#julAptCount').val();
            
	    	    // Recent Report 2
	    	    const bd_brandProduct2 = 'rgba(0,181,233,0.9)'
	    	    const bd_brandService2 = 'rgba(0,173,95,0.9)'
	    	    const brandProduct2 = 'rgba(0,181,233,0.2)'
	    	    const brandService2 = 'rgba(0,173,95,0.2)'

	    	    var data3 = [janMemCount, febMemCount, marMemCount, aprMemCount, mayMemCount, junMemCount, julMemCount, ""]
	    	    var data4 = [janAptCount, febAptCount, marAptCount, aprAptCount, mayAptCount, junAptCount, julAptCount, ""]

	    	    var ctx = document.getElementById("recentChart");
	    	    if (ctx) {
	    	      ctx.height = 230;
	    	      var myChart = new Chart(ctx, {
	    	        type: 'line',
	    	        data: {
	    	          labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', ''],
	    	          datasets: [
	    	            {
	    	              label: '회원 증가 수',
	    	              backgroundColor: brandService2,
	    	              borderColor: bd_brandService2,
	    	              pointHoverBackgroundColor: '#fff',
	    	              borderWidth: 0,
	    	              data: data3
	    	            },
	    	            {
	    	              label: '예약 수',
	    	              backgroundColor: brandProduct2,
	    	              borderColor: bd_brandProduct2,
	    	              pointHoverBackgroundColor: '#fff',
	    	              borderWidth: 0,
	    	              data: data4
	    	            }
	    	          ]
	    	        },
	    	        options: {
	    	          maintainAspectRatio: true,
	    	          legend: {
	    	            display: false
	    	          },
	    	          responsive: true,
	    	          scales: {
	    	            xAxes: [{
	    	              gridLines: {
	    	                drawOnChartArea: true,
	    	                color: '#f2f2f2'
	    	              },
	    	              ticks: {
	    	                fontFamily: "Poppins",
	    	                fontSize: 12
	    	              }
	    	            }],
	    	            yAxes: [{
	    	              ticks: {
	    	                beginAtZero: true,
	    	                maxTicksLimit: 1,
	    	                stepSize: 10,
	    	                max: 60,
	    	                fontFamily: "Poppins",
	    	                fontSize: 12
	    	              },
	    	              gridLines: {
	    	                display: true,
	    	                color: '#f2f2f2'
	    	              }
	    	            }]
	    	          },
	    	          elements: {
	    	            point: {
	    	              radius: 0,
	    	              hitRadius: 10,
	    	              hoverRadius: 4,
	    	              hoverBorderWidth: 3
	    	            },
	    	            line: {
	    	              tension: 0
	    	            }
	    	          }
	    	        }
	    	      });
	    	    }
	    	  } catch (error) {
	    	    console.log(error);
	    	  }
	    }
	});
	
	//Age Chart
	$.ajax({
	    url:"<c:url value='/Admin/AgeChart.hst'/>",
	    type:'get',
	    datatype:'html',
	    data:{},
	    beforeSend: function () {
	       console.log("beforeSend");
	    },
	    complete: function () {
	       console.log("complete");
	    },
	    success:function(data){
	       console.log("연결성공", typeof(data));
	       try {
	    	    //pie chart
	    	    var ctx = document.getElementById("ageChart");
	    	    var under10 = $('#under10').val();
	    	    var over10under20 = $('#over10under20').val();
	    	    var over20under30 = $('#over20under30').val();
	    	    var over30under40 = $('#over30under40').val();
	    	    var over40under50 = $('#over40under50').val();
	    	    var over50under60 = $('#over50under60').val();
	    	    var over60 = $('#over60').val();
	    	    if (ctx) {
	    	      ctx.height = 200;
	    	      var myChart = new Chart(ctx, {
	    	        type: 'pie',
	    	        data: {
	    	          datasets: [{
	    	            data: [under10, over10under20, over20under30, over30under40, over40under50, over50under60, over60],
	    	            backgroundColor: [
	    	              "rgba(0, 123, 255,0.9)",
	    	              "rgba(0, 123, 255,0.8)",
	    	              "rgba(0, 123, 255,0.7)",
	    	              "rgba(0, 123, 255,0.6)",
	    	              "rgba(0, 123, 255,0.5)",
	    	              "rgba(0, 123, 255,0.4)",
	    	              "rgba(0, 123, 255,0.3)",
	    	              "rgba(0,0,0,0.07)"
	    	            ],
	    	            hoverBackgroundColor: [
	    	              "rgba(0, 123, 255,0.9)",
	    	              "rgba(0, 123, 255,0.7)",
	    	              "rgba(0, 123, 255,0.5)",
	    	              "rgba(0,0,0,0.07)"
	    	            ]
	    	          }],
	    	          labels: [
	    	            "10세 이하",
	    	            "10대",
	    	            "20대",
	    	            "30대",
	    	            "40대",
	    	            "50대",
	    	            "60세 이상"
	    	          ]
	    	        },
	    	        options: {
	    	          legend: {
	    	            position: 'top',
	    	            labels: {
	    	              fontFamily: 'Poppins'
	    	            }
	    	          },
	    	          responsive: true
	    	        }
	    	      });
	    	    }
	    	  } catch (error) {
	    	    console.log(error);
	    	  }
	    }
	});
	
	//USING TIME
	$.ajax({
	    url:"<c:url value='/Admin/UsingTime.hst'/>",
	    type:'get',
	    datatype:'html',
	    data:{},
	    beforeSend: function () {
	       console.log("beforeSend");
	    },
	    complete: function () {
	       console.log("complete");
	    },
	    success:function(data){
	       console.log("연결성공", typeof(data));
				try {
				    //line chart
				    var t0_2 = $('#t0_2').val();
				    var t2_4 = $('#t2_4').val();
				    var t4_6 = $('#t4_6').val();
				    var t6_8 = $('#t6_8').val();
				    var t8_10 = $('#t8_10').val();
				    var t10_12 = $('#t10_12').val();
				    var t12_14 = $('#t12_14').val();
				    var t14_16 = $('#t14_16').val();
				    var t16_18 = $('#t16_18').val();
				    var t18_20 = $('#t18_20').val();
				    var t20_22 = $('#t20_22').val();
				    var t22_24 = $('#t22_24').val();
				    
				    var ctx = document.getElementById("usingTimeChart");
				    if (ctx) {
				      ctx.height = 150;
				      var myChart = new Chart(ctx, {
				        type: 'line',
				        data: {
				          labels: ["0~2", "2~4", "4~6", "6~8", "8~10", "10~12", "12~14", "14~16", "16~18", "18~20", "20~22", "22~24"],
				          defaultFontFamily: "Poppins",
				          datasets: [
				        	  {
					              label: "유저 수",
					              borderColor: "rgba(0, 123, 255, 0.9)",
					              borderWidth: "1",
					              backgroundColor: "rgba(0, 123, 255, 0.5)",
					              pointHighlightStroke: "rgba(26,179,148,1)",
					              data: [t0_2, t2_4, t4_6, t6_8, t8_10, t10_12, t12_14, t14_16, t16_18, t18_20, t20_22, t22_24]
					            },
// 				        	  {
// 					              label: "This Month",
// 					              borderColor: "rgba(0,0,0,.09)",
// 					              borderWidth: "1",
// 					              backgroundColor: "rgba(0,0,0,.07)",
// 					              data: [7, 5, 4, 12, 15, 20, 22, 30, 25, 35, 40, 23]
// 					            },
				          ]
				        },
				        options: {
				          legend: {
				            position: 'top',
				            labels: {
				              fontFamily: 'Poppins'
				            }
			
				          },
				          responsive: true,
				          tooltips: {
				            mode: 'index',
				            intersect: false
				          },
				          hover: {
				            mode: 'nearest',
				            intersect: true
				          },
				          scales: {
				            xAxes: [{
				              ticks: {
				                fontFamily: "Poppins"
			
				              }
				            }],
				            yAxes: [{
				              ticks: {
				                beginAtZero: true,
				                fontFamily: "Poppins"
				              }
				            }]
				          }
			
				        }
				      });
				    }
			
			
				  } catch (error) {
				    console.log(error);
				  }
	    }
	});
});
</script>
<style>
@font-face {
	font-family: 'NEXON Lv2 Gothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>
<body class="animsition">
	<div class="page-wrapper">
		<!-- PAGE CONTAINER-->
		<div class="page-container2">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop2">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap2">
							<div class="header-button2">
								<div class="header-button-item has-noti js-item-menu">
									<div class="notifi-dropdown js-dropdown">
										<div class="notifi__title">
											<p>You have 3 Notifications</p>
										</div>
										<div class="notifi__item">
											<div class="bg-c1 img-cir img-40">
												<i class="zmdi zmdi-email-open"></i>
											</div>
											<div class="content">
												<p>You got a email notification</p>
												<span class="date">April 12, 2018 06:50</span>
											</div>
										</div>
										<div class="notifi__item">
											<div class="bg-c2 img-cir img-40">
												<i class="zmdi zmdi-account-box"></i>
											</div>
											<div class="content">
												<p>Your account has been blocked</p>
												<span class="date">April 12, 2018 06:50</span>
											</div>
										</div>
										<div class="notifi__item">
											<div class="bg-c3 img-cir img-40">
												<i class="zmdi zmdi-file-text"></i>
											</div>
											<div class="content">
												<p>You got a new file</p>
												<span class="date">April 12, 2018 06:50</span>
											</div>
										</div>
										<div class="notifi__footer">
											<a href="#">All notifications</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
			<!-- END HEADER DESKTOP-->

			<!-- BREADCRUMB-->
			<section class="au-breadcrumb m-t-75">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="overview-wrap">
									<h2 class="title-1">개요</h2>
									<button class="au-btn au-btn-icon au-btn--blue"
										onClick="location.href='<c:url value='/Admin/NoticeWrite.hst'/>'">
										<i class="zmdi zmdi-plus"></i>공지작성
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- END BREADCRUMB-->

			<!-- STATISTIC-->
			<section class="statistic">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6 col-lg-3">
								<div class="statistic__item">
									<h2 class="number" style="font-size: 30pt">${memberCount }</h2>
									<span class="desc"
										style="font-weight: bold; color: #858585; font-size: 20pt">회원
										수</span>
									<div class="icon">
										<i class="zmdi zmdi-account-o"></i>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="statistic__item">
									<h2 class="number" style="font-size: 30pt">${hospCount }</h2>
									<span class="desc"
										style="font-weight: bold; color: #858585; font-size: 20pt">제휴된
										병원 수</span>
									<div class="icon">
										<i class="zmdi zmdi-shopping-cart"></i>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="statistic__item">
									<h2 class="number" style="font-size: 30pt">${presCount }</h2>
									<span class="desc"
										style="font-weight: bold; color: #858585; font-size: 20pt">등록된
										처방 수</span>
									<div class="icon">
										<i class="zmdi zmdi-calendar-note"></i>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="statistic__item">
									<h2 class="number" style="font-size: 30pt">${aptCount }</h2>
									<span class="desc"
										style="font-weight: bold; color: #858585; font-size: 20pt">예약
										수</span>
									<div class="icon">
										<i class="zmdi zmdi-money"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- END STATISTIC-->

			<section>
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xl-12">
								<!-- RECENT REPORT 2-->
								<div class="recent-report2">
									<h3 class="title-3">Recent Increases</h3>
									<div class="chart-info">
										<div class="chart-info__left">
											<div class="chart-note">
												<span class="dot dot--blue"></span> <span
													style="font-size: 14pt">예약 수</span>
											</div>
											<div class="chart-note">
												<span class="dot dot--green"></span> <span
													style="font-size: 14pt">회원 증가 수</span>
											</div>
										</div>
									</div>
									<div class="recent-report__chart">
										<input type="hidden" value="${janMemCount }" id="janMemCount" />
										<input type="hidden" value="${febMemCount }" id="febMemCount" />
										<input type="hidden" value="${marMemCount }" id="marMemCount" />
										<input type="hidden" value="${aprMemCount }" id="aprMemCount" />
										<input type="hidden" value="${mayMemCount }" id="mayMemCount" />
										<input type="hidden" value="${junMemCount }" id="junMemCount" />
										<input type="hidden" value="${julMemCount }" id="julMemCount" />

										<input type="hidden" value="${janAptCount }" id="janAptCount" />
										<input type="hidden" value="${febAptCount }" id="febAptCount" />
										<input type="hidden" value="${marAptCount }" id="marAptCount" />
										<input type="hidden" value="${aprAptCount }" id="aprAptCount" />
										<input type="hidden" value="${mayAptCount }" id="mayAptCount" />
										<input type="hidden" value="${junAptCount }" id="junAptCount" />
										<input type="hidden" value="${julAptCount }" id="julAptCount" />
										<canvas id="recentChart"></canvas>
									</div>
								</div>
								<!-- END RECENT REPORT 2             -->
							</div>

						</div>
					</div>
				</div>
			</section>

			<section>
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xl-6">
								<div class="au-card m-b-30">
									<div class="au-card-inner">
										<h3 class="title-2 m-b-40">Using Times</h3>
										<input type="hidden" value="${t0_2}" id="t0_2" /> <input
											type="hidden" value="${t2_4}" id="t2_4" /> <input
											type="hidden" value="${t4_6}" id="t4_6" /> <input
											type="hidden" value="${t6_8}" id="t6_8" /> <input
											type="hidden" value="${t8_10}" id="t8_10" /> <input
											type="hidden" value="${t10_12}" id="t10_12" /> <input
											type="hidden" value="${t12_14}" id="t12_14" /> <input
											type="hidden" value="${t14_16}" id="t14_16" /> <input
											type="hidden" value="${t16_18}" id="t16_18" /> <input
											type="hidden" value="${t18_20}" id="t18_20" /> <input
											type="hidden" value="${t20_22}" id="t20_22" /> <input
											type="hidden" value="${t22_24}" id="t22_24" />
										<canvas id="usingTimeChart"></canvas>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="au-card m-b-30">
									<div class="au-card-inner">
										<h3 class="title-2 m-b-40">User Groups</h3>
										<input type="hidden" value="${under10 }" id="under10" /> <input
											type="hidden" value="${over10under20 }" id="over10under20" />
										<input type="hidden" value="${over20under30 }"
											id="over20under30" /> <input type="hidden"
											value="${over30under40 }" id="over30under40" /> <input
											type="hidden" value="${over40under50 }" id="over40under50" />
										<input type="hidden" value="${over50under60 }"
											id="over50under60" /> <input type="hidden"
											value="${over60 }" id="over60" />
										<canvas id="ageChart"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- END PAGE CONTAINER-->
		</div>

	</div>
</body>

</html>
<!-- end document-->
