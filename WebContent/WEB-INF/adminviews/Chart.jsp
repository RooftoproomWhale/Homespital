<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script>
$(function() {
//Recent Chart
$.ajax({
    url:"<c:url value='/Admin/RecentChart.hst'/>",
    type:'get',
    datatype:'html',
    data:{},
    beforeSend: function () {
       console.log("beforeSend");
//        FunLoadingBarStart();
    },
    complete: function () {
       console.log("complete");
//        FunLoadingBarEnd();
    },
    success:function(data){
//        console.log(data);
       console.log("연결성공", typeof(data));
       try {
//     	   	var janMemCount = $('#janMemCount').val();
//     	   	var febMemCount = $('#febMemCount').val();
//     	   	var marMemCount = $('#marMemCount').val();
//     	   	var aprMemCount = $('#aprMemCount').val();
//     	   	var mayMemCount = $('#mayMemCount').val();
//     	   	var junMemCount = $('#junMemCount').val();
    	   	var janMemCount = 12;
    	   	var febMemCount = 17;
    	   	var marMemCount = 25;
    	   	var aprMemCount = 40;
    	   	var mayMemCount = 33;
    	   	var junMemCount = 38;
    	   	var julMemCount = $('#julMemCount').val();
    	   	
//     	   	var janAptCount = $('#janAptCount').val();
//     	   	var febAptCount = $('#febAptCount').val();
//     	   	var marAptCount = $('#marAptCount').val();
//     	   	var aprAptCount = $('#aprAptCount').val();
//     	   	var mayAptCount = $('#mayAptCount').val();
//     	   	var junAptCount = $('#junAptCount').val();
    	   	var janAptCount = 8;
    	   	var febAptCount = 16;
    	   	var marAptCount = 28;
    	   	var aprAptCount = 44;
    	   	var mayAptCount = 40;
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
    	                max: 50,
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

//departmentApt chart
$.ajax({
    url:"<c:url value='/Admin/RecentChart.hst'/>",
    type:'get',
    datatype:'html',
    data:{},
    beforeSend: function () {
       console.log("beforeSend");
//        FunLoadingBarStart();
    },
    complete: function () {
       console.log("complete");
//        FunLoadingBarEnd();
    },
    success:function(data){
//        console.log(data);
		  try {     
		    var ctx = document.getElementById("deptAptChart");
		    if (ctx) {
		      ctx.height = 100;
// 		      var naeCount = $('#naeCount').val();
// 		      var biCount = $('#biCount').val();
// 		      var sanCount = $('#sanCount').val();
// 		      var seongCount = $('#seongCount').val();
// 		      var soCount = $('#soCount').val();
// 		      var sinCount = $('#sinCount').val();
// 		      var anCount = $('#anCount').val();
// 		      var leeCount = $('#leeCount').val();
// 		      var ilCount = $('#ilCount').val();
// 		      var jeongCount = $('#jeongCount').val();
// 		      var hyeongCount = $('#hyeongCount').val();
// 		      var chiCount = $('#chiCount').val();
// 		      var piCount = $('#piCount').val();
// 		      var hanCount = $('#hanCount').val();
// 		      var giCount = $('#giCount').val();
		      
		      var naeCount = $('#naeCount').val();
		      var biCount = 4;
		      var sanCount = 3;
		      var seongCount = 2;
		      var soCount = 6;
		      var sinCount = 8;
		      var anCount = 13;
		      var leeCount = 4;
		      var ilCount = 3;
		      var jeongCount = 7;
		      var hyeongCount = 18;
		      var chiCount = $('#chiCount').val();
		      var piCount = 6;
		      var hanCount = 5;
		      var giCount = 0;
		      
		      var myChart = new Chart(ctx, {
		        type: 'bar',
		        data: {
		          labels: ["내과", "비뇨기과", "산부인과", "성형외과", "소아청소년과", "신경과", "안과", "이비인후과", "일반외과", "정신건강의학과", "정형외과", "치과", "피부과", "한방과", "기타"],
		          datasets: [
		            {
		              label: "예약 수",
		              data: [naeCount, biCount, sanCount, seongCount, soCount, sinCount, anCount, leeCount, ilCount, jeongCount, hyeongCount, chiCount, piCount, hanCount, giCount],
		              borderColor: "rgba (0, 123, 255, 0.9)",
		              borderWidth: "0",
		              backgroundColor: "rgba(0, 123, 255, 0.5)"
		            }
		          ]
		        },
		        options: {
		          legend: {
		            position: 'top',
		            labels: {
		              fontFamily: 'Poppins'
		            }
		
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

//Gender Chart
$.ajax({
    url:"<c:url value='/Admin/GenderChart.hst'/>",
    type:'get',
    datatype:'html',
    data:{},
    beforeSend: function () {
       console.log("beforeSend");
//        FunLoadingBarStart();
    },
    complete: function () {
       console.log("complete");
//        FunLoadingBarEnd();
    },
    success:function(data){
//        console.log(data);
       console.log("연결성공", typeof(data));
       try {
   	    //pie chart
   	    var ctx = document.getElementById("genderChart");
//    	    var male = document.getElementById("maleCount").value;
//    	   	var female = document.getElementById("femaleCount").value;
		var male= $('#maleCount').val();
		var female= $('#femaleCount').val();
   	   	console.log(genderChart + male + female);
   	    if (ctx) {
   	      ctx.height = 200;
   	      var myChart = new Chart(ctx, {
   	        type: 'pie',
   	        data: {
   	          datasets: [{
   	            data: [male, female],
   	            backgroundColor: [
   	              "rgba(0, 123, 255,0.9)",
   	              "rgba(255, 82, 122,0.7)"
   	            ],
   	            hoverBackgroundColor: [
   	              "rgba(0, 123, 255,0.9)",
   	              "rgba(255, 82, 122,0.7)"
   	            ]
   	          }],
   	          labels: [
   	            "남",
   	            "녀"
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

//Age Chart
$.ajax({
    url:"<c:url value='/Admin/AgeChart.hst'/>",
    type:'get',
    datatype:'html',
    data:{},
    beforeSend: function () {
       console.log("beforeSend");
//        FunLoadingBarStart();
    },
    complete: function () {
       console.log("complete");
//        FunLoadingBarEnd();
    },
    success:function(data){
//        console.log(data);
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
});

</script>
<body class="animsition">
    <div class="page-wrapper">
        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- MAIN CONTENT-->
                <div class="section__content section__content--p30" style="padding-top: 50px">
                    <div class="container-fluid">
                    <div class="row">
                            <div class="col-xl-12">
                                <!-- RECENT REPORT 2-->
                                <div class="recent-report2">
                                    <h3 class="title-3">Recent Increase</h3>
                                    <div class="chart-info">
                                        <div class="chart-info__left">
                                            <div class="chart-note">
                                                <span class="dot dot--blue"></span>
                                                <span>예약 수</span>
                                            </div>
                                            <div class="chart-note">
                                                <span class="dot dot--green"></span>
                                                <span>회원 증가 수</span>
                                            </div>
                                        </div>
<!--                                         <div class="chart-info-right"> -->
<!--                                             <div class="rs-select2--dark rs-select2--md m-r-10"> -->
<!--                                                 <select class="js-select2" name="property"> -->
<!--                                                     <option selected="selected">All Properties</option> -->
<!--                                                     <option value="">Members</option> -->
<!--                                                     <option value="">Appointments</option> -->
<!--                                                 </select> -->
<!--                                                 <div class="dropDownSelect2"></div> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </div>
                                    <div class="recent-report__chart">
                                    <input type="hidden" value="${janMemCount }" id="janMemCount"/>
                                    <input type="hidden" value="${febMemCount }" id="febMemCount"/>
                                    <input type="hidden" value="${marMemCount }" id="marMemCount"/>
                                    <input type="hidden" value="${aprMemCount }" id="aprMemCount"/>
                                    <input type="hidden" value="${mayMemCount }" id="mayMemCount"/>
                                    <input type="hidden" value="${junMemCount }" id="junMemCount"/>
                                    <input type="hidden" value="${julMemCount }" id="julMemCount"/>
                                    
                                    <input type="hidden" value="${janAptCount }" id="janAptCount"/>
                                    <input type="hidden" value="${febAptCount }" id="febAptCount"/>
                                    <input type="hidden" value="${marAptCount }" id="marAptCount"/>
                                    <input type="hidden" value="${aprAptCount }" id="aprAptCount"/>
                                    <input type="hidden" value="${mayAptCount }" id="mayAptCount"/>
                                    <input type="hidden" value="${junAptCount }" id="junAptCount"/>
                                    <input type="hidden" value="${julAptCount }" id="julAptCount"/>
                                        <canvas id="recentChart"></canvas>
                                    </div>
                                </div>
                                <!-- END RECENT REPORT 2             -->
                            </div>
                            
                        </div>
                        <div class="row">
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Yearly Sales</h3> -->
<%--                                         <canvas id="sales-chart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Team Commits</h3> -->
<%--                                         <canvas id="team-chart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
							<div class="col-lg-12">
                                <div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Appointment Counts</h3>
                                        <input type="hidden" value="${naeCount }" id="naeCount"/>
                                        <input type="hidden" value="${biCount }" id="biCount"/>
                                        <input type="hidden" value="${sanCount }" id="sanCount"/>
                                        <input type="hidden" value="${seongCount }" id="seongCount"/>
                                        <input type="hidden" value="${soCount }" id="soCount"/>
                                        <input type="hidden" value="${sinCount }" id="sinCount"/>
                                        <input type="hidden" value="${anCount }" id="anCount"/>
                                        <input type="hidden" value="${leeCount }" id="leeCount"/>
                                        <input type="hidden" value="${ilCount }" id="ilCount"/>
                                        <input type="hidden" value="${jeongCount }" id="jeongCount"/>
                                        <input type="hidden" value="${hyeongCount }" id="hyeongCount"/>
                                        <input type="hidden" value="${chiCount }" id="chiCount"/>
                                        <input type="hidden" value="${piCount }" id="piCount"/>
                                        <input type="hidden" value="${hanCount }" id="hanCount"/>
                                        <input type="hidden" value="${giCount }" id="giCount"/>
                                        <canvas id="deptAptChart"></canvas>
                                    </div>
                                </div>
                            </div>
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Bar chart</h3> -->
<%--                                         <canvas id="barChart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Rader chart</h3> -->
<%--                                         <canvas id="radarChart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Using Times</h3> -->
<%--                                         <canvas id="lineChart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Doughut Chart</h3> -->
<%--                                         <canvas id="doughutChart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <div class="col-lg-6">
                                <div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">User Groups</h3>
                                        <input type="hidden" value="${under10 }" id="under10"/>
                                        <input type="hidden" value="${over10under20 }" id="over10under20"/>
                                        <input type="hidden" value="${over20under30 }" id="over20under30"/>
                                        <input type="hidden" value="${over30under40 }" id="over30under40"/>
                                        <input type="hidden" value="${over40under50 }" id="over40under50"/>
                                        <input type="hidden" value="${over50under60 }" id="over50under60"/>
                                        <input type="hidden" value="${over60 }" id="over60"/>
                                        <canvas id="ageChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Gender</h3>
                                        <input type="hidden" value="${male }" id="maleCount"/>
                                        <input type="hidden" value="${female }" id="femaleCount"/>
                                        <canvas id="genderChart"></canvas>
                                    </div>
                                </div>
                            </div>
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="au-card m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <h3 class="title-2 m-b-40">Polar Chart</h3> -->
<%--                                         <canvas id="polarChart"></canvas> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->
</body>

</html>
<!-- end document-->
