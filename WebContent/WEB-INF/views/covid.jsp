<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>



<style>

 .col-md-5{
  margin: 10px;
  border: 1px solid #57b6ff;
 }
#banner{

padding-top:100px;
width: auto;
height: auto;
position: absolute;
left: 30px;

}
</style>
<script>
$(function() {
   
   function getFormatDate(date){
       var year = date.getFullYear();              //yyyy
       var month = (1 + date.getMonth());          //M
       month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
       var day = date.getDate();                   //d
       day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
       return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
   }
   
   var date = new Date();
   todayStr = getFormatDate(date);
   var today = parseInt(todayStr);
   console.log(today);
   
   $.ajax({
      url:"<c:url value='/Covid/Daily.hst'/>",
      type:'get',
      datatype:'json',
      data:{"today": today},
      beforeSend: function () {
         console.log("beforeSend");
//          FunLoadingBarStart();
      },
      complete: function () {
         console.log("complete");
//          FunLoadingBarEnd();
      },
      success:function(data){
         console.log(data);
         var jsonData = JSON.parse(data);
         console.log("연결성공", jsonData, typeof(jsonData));
         var decideArr = new Array(); //확진자 저장 배열
         var dailyPatient = new Array();
         $.each(jsonData.response.body.items.item, function(i, item) {
        	 console.log(item);
            console.log("확진 카운트: ", item.decideCnt);
            decideArr[i] = item.decideCnt;
         })
         for(var i=0; i<decideArr.length; i++) {
//              console.log(decideArr[i]);
             dailyPatient[i] = decideArr[i] - decideArr[i+1]
         }
         for(var i=0; i<dailyPatient.length; i++) {
//             console.log("일일확진자: ", dailyPatient[i])
         }
         
         function toogleDataSeries(e){
             if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                e.dataSeries.visible = false;
             } else{
                e.dataSeries.visible = true;
             }
             e.chart.render();
          }

         var options = {
               animationEnabled: true,
               theme: "light2",
               backgroundColor: "#fff",
               title:{
                  text: "일별 확진자 추이"
               },
               axisX:{
                  valueFormatString: "MM월 DD일"
               },
               axisY: {
                  title: "일일 확진자 수",
                  suffix: "명",
                  minimum:0
               },
               toolTip:{
                  shared:true
               },  
               legend:{
                  cursor:"pointer",
                  verticalAlign: "bottom",
                  horizontalAlign: "left",
                  dockInsidePlotArea: true,
                  itemclick: toogleDataSeries
               },
               data: [{
                  type: "line",
                  showInLegend: true,
                  name: "확진자 수",
                  markerType: "square",
                  xValueFormatString: "YYYY년 MM월 DD일",
                  color: "#F08080",
                  culture: "ko",
                  yValueFormatString: "#,##0명",
                  dataPoints: [
                     { x: new Date(date.getFullYear(), date.getMonth(), date.getDate()), y: dailyPatient[0] },
                     { x: new Date(date.getFullYear(), date.getMonth(), date.getDate()-1), y: dailyPatient[1] },
                     { x: new Date(date.getFullYear(), date.getMonth(), date.getDate()-2), y: dailyPatient[2] },
                     { x: new Date(date.getFullYear(), date.getMonth(), date.getDate()-3), y: dailyPatient[3] },
                     { x: new Date(date.getFullYear(), date.getMonth(), date.getDate()-4), y: dailyPatient[4] },
                     { x: new Date(date.getFullYear(), date.getMonth(), date.getDate()-5), y: dailyPatient[5] },
                     { x: new Date(date.getFullYear(), date.getMonth(), date.getDate()-6), y: dailyPatient[6] }
                  ]
               }]
            };
         console.log(options);
         $("#chartContainer3").CanvasJSChart(options);
      },
      error:function(e){
         console.log("연결 실패")
      }
      
   });
   
   //검사
   $.ajax({
      url:"<c:url value='/Covid/Exam.hst'/>",
      type:'get',
      datatype:'json',
      data:{"today": today},
      beforeSend: function () {
         console.log("beforeSend");
//          FunLoadingBarStart();
      },
      complete: function () {
         console.log("complete");
//          FunLoadingBarEnd();
      },
      success:function(data){
//          console.log(data);
         var jsonData = JSON.parse(data);
         console.log("연결성공", jsonData, typeof(jsonData));
         var clearCnt, deathCnt, careCnt, decideCnt;
         var clearPer;
         var deathPer;
         var carePer;
         var decidePer;
         $.each(jsonData.response.body.items, function(i, item) {
            clearCnt = item.clearCnt;//격리해제수
            deathCnt = item.deathCnt;//사망자수
            careCnt = item.careCnt;//격리중 수
            decideCnt = item.decideCnt;//확진환자수
            var totalCnt = clearCnt + deathCnt + careCnt + decideCnt;
//             console.log("total: ", totalCnt);
            
            clearPer = clearCnt / totalCnt * 100;
            deathPer = deathCnt / totalCnt * 100;
            carePer = careCnt / totalCnt * 100;
            decidePer = decideCnt / totalCnt * 100;
//             console.log(clearPer);
         })
         
      var chart = new CanvasJS.Chart("chartContainer1", {
      theme: "light2", // "light1", "light2", "dark1", "dark2"
      exportEnabled: false,
      animationEnabled: true,
      backgroundColor: "#fff",
      title: {
         text: "검사 현황"
      },
      data: [{
         type: "pie",
         startAngle: 25,
         toolTipContent: "<b>{label}</b>: {y}%",
         showInLegend: "true",
         
         legendText: "{label}",
         indexLabelFontSize: 16,
         indexLabel: "{label} - {y}% -{t}",
         dataPoints: [
            { y: decidePer.toFixed(2), label: "확진자 수", t: decideCnt+"명"},
            { y: deathPer.toFixed(2), label: "사망자 수", t: deathCnt+"명"},
            { y: carePer.toFixed(2), label: "격리 중 수", t: careCnt+"명"},
            { y: clearPer.toFixed(2), label: "격리해제 수", t: clearCnt+"명"},
         ]
      }]
   });
   chart.render();//핏자
         
      },
      error:function(e){
         console.log("연결 실패")
      }
      
   });
   
   //시/도별 현황
   $.ajax({
      url:"<c:url value='/Covid/Location.hst'/>",
      type:'get',
      datatype:'json',
      data:{"today": today},
      beforeSend: function () {
         console.log("beforeSend");
//          FunLoadingBarStart();
      },
      complete: function () {
         console.log("complete");
//          FunLoadingBarEnd();
      },
      success:function(data){
//          console.log(data);
         var jsonData = JSON.parse(data);
//          console.log("연결성공", jsonData, typeof(jsonData));
         var locArr = new Array();
         $.each(jsonData.response.body.items.item, function(i, item) {
//             console.log(item.gubun +":"+item.defCnt);
            locArr[i] = item.defCnt;
         })
//          for(var i=0; i<locArr.length; i++) {
//              console.log(locArr[i]);
//          }
         
      var chart = new CanvasJS.Chart("chartContainer2", {
      animationEnabled: true,
      backgroundColor: "#fff",
      title:{
         text: "시/도 별 현황",
         horizontalAlign: "center"
      },
      data: [{
         type: "doughnut",
         startAngle: 120,
         //innerRadius: 60,
         indexLabelFontSize: 17,
         indexLabel: "{label} - #percent%",
         toolTipContent: "<b>{label}:</b> {y} (#percent%)",
         dataPoints: [
            { y: locArr[0], label: "검역" },
            { y: locArr[1], label: "제주" },
            { y: locArr[2], label: "경남" },
            { y: locArr[3], label: "경북" },
            { y: locArr[4], label: "전남" },
            { y: locArr[5], label: "전북" },
            { y: locArr[6], label: "충남" },
            { y: locArr[7], label: "충북" },
            { y: locArr[8], label: "강원" },
            { y: locArr[9], label: "경기" },
            { y: locArr[10], label: "세종" },
            { y: locArr[11], label: "울산" },
            { y: locArr[12], label: "대전" },
            { y: locArr[13], label: "광주" },
            { y: locArr[14], label: "인천" },
            { y: locArr[15], label: "대구" },
            { y: locArr[16], label: "부산" },
            { y: locArr[17], label: "서울" },
         ]
      }]
   });
   chart.render();   //도넛
         
      },
      error:function(e){
         console.log("연결 실패")
      }
      
   });
   
   //국가별 현황
   $.ajax({
      url:"<c:url value='/Covid/Nation.hst'/>",
      type:'get',
      datatype:'json',
      data:{"today": today},
      beforeSend: function () {
         console.log("beforeSend");
//          FunLoadingBarStart();
      },
      complete: function () {
         console.log("complete");
//          FunLoadingBarEnd();
      },
      success:function(data){
//           console.log(data);
         var jsonData = JSON.parse(data);
//          console.log("연결성공", jsonData, typeof(jsonData));
         var nationArr = new Array();
         var nationCnt;
         $.each(jsonData.response.body.items.item, function(i, item) {
//             console.log(item.nationNm, " : ", item.natDefCnt, "index: " ,i);
            nationArr[i] = {"nationNm" : item.nationNm, "nationDefCnt" : item.natDefCnt};
         })
         nationArr.sort(customSort);
         
         for(var i=0; i<nationArr.length; i++) {
//              console.log(nationArr[i]);
//              console.log(nationArr[i].nationNm);
         }
         
         var chart = new CanvasJS.Chart("chartContainer4", {
            animationEnabled: true,
            backgroundColor: "#fff",
            title: {
               text: "국가별 현황"
            },
            axisX: {
               interval: 1
            },
            axisY: {
               title: "확진자 수",
               scaleBreaks: {
                  type: "wavy",
                  customBreaks: [{
                     startValue: 1000000,
                     endValue: 2000000
                     },
                     {
                        startValue: 10000,
                        endValue: 2000000
                     }
               ]}
            },
            data: [{
               type: "bar",
//                toolTipContent: "<img src=\"https://canvasjs.com/wp-content/uploads/images/gallery/javascript-column-bar-charts/\"{url}\"\" style=\"width:40px; height:20px;\"> <b>{label}</b><br>Budget: ${y}bn<br>{gdp}% of GDP",
               dataPoints: [
                  { label: nationArr[9].nationNm, y: nationArr[9].nationDefCnt},
                  { label: nationArr[8].nationNm, y: nationArr[8].nationDefCnt},
                  { label: nationArr[7].nationNm, y: nationArr[7].nationDefCnt},
                  { label: nationArr[6].nationNm, y: nationArr[6].nationDefCnt},
                  { label: nationArr[5].nationNm, y: nationArr[5].nationDefCnt},
                  { label: nationArr[4].nationNm, y: nationArr[4].nationDefCnt},
                  { label: nationArr[3].nationNm, y: nationArr[3].nationDefCnt},
                  { label: nationArr[2].nationNm, y: nationArr[2].nationDefCnt},
                  { label: nationArr[1].nationNm, y: nationArr[1].nationDefCnt},
                  { label: nationArr[0].nationNm, y: nationArr[0].nationDefCnt}
               ]
            }]
         });
         chart.render();
         
      },
      error:function(e){
         console.log("연결 실패")
      }
      
   });
   
   function customSort(a, b) { if(a.nationDefCnt == b.nationDefCnt){ return 0} return a.nationDefCnt < b.nationDefCnt ? 1 : -1; }

   function toogleDataSeries(e){
      if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
         e.dataSeries.visible = false;
      } else{
         e.dataSeries.visible = true;
      }
      e.chart.render();
   }
   
});
   
      
</script>
   <!-- 가로배치용 -->
<div class="container" style="">

<a href="<c:url value="http://ncov.mohw.go.kr/guidelineList.do?brdId=6&brdGubun=61"/>">
   <img id="banner" src="<c:url value="/images/healthimg/사회적 거리두기.png"/>" style="position: relative;">
   </a>

   <div class="row" style="margin-top: 40px;margin-left:50px; ">
      <div class="col-md-12">
         <div class="col-md-5" id="chartContainer3"
            style="height: 300px; width: 500px;"></div>
         <div class="col-md-5" id="chartContainer2"
            style="height: 300px; width: 500px;"></div>
         <div class="col-md-5" id="chartContainer1"
            style="height: 300px; width: 500px;"></div>
         <div class="col-md-5" id="chartContainer4"
            style="height: 300px; width: 500px;"></div>
      </div>
   </div>
</div>