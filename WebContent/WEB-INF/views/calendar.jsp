<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

#footer{
position:absolute;
top: 1000px;
width: 100%;
}
</style>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel="shortcut icon" href="<c:url value='/calendar/image/favicon.ico'/>">

    <link rel="stylesheet" href="<c:url value='/calendar/vendor/css/fullcalendar.min.css'/>" />

    <link rel="stylesheet" href="<c:url value='/calendar/vendor/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/calendar/vendor/css/select2.min.css' />"/>
    <link rel="stylesheet" href="<c:url value='/calendar/vendor/css/bootstrap-datetimepicker.min.css'/>"/>

    <link rel="stylesheet" href="<c:url value='https://fonts.googleapis.com/css?family=Open+Sans:400,500,600'/>"/>
    <link rel="stylesheet" href="<c:url value='https://fonts.googleapis.com/icon?family=Material+Icons'/>"/>
<link rel="stylesheet" href="<c:url value='/calendar/css/main.css'/>"/>
   <script>

	  
   
   	$(function() {
   	   $('#loading').hide();  
		$('#item-1').on("click",function(){
			$('#items-1').css("display","");
			$('#items-2').css("display","none ")
			$('#items-3').css("display","none ")
		})
		$('#item-2').on("click",function(){
			$('#items-2').css("display","");
			$('#items-1').css("display","none")
			$('#items-3').css("display","none")
		})
			$('#item-3').on("click",function(){
			$('#items-3').css("display","");
			$('#items-1').css("display","none")
			$('#items-2').css("display","none")
		})
   		
	})



   </script>
<style>  
#calendar {
  padding-top: 95px;
    max-width: 900px;
    margin: 0 auto;
  }
  .Viewsds{
  top:100px
  ;left:115px;
  }
  .Views{
  width:60%
  }
  .View{
  width: 135%
  }
  .Viewdialog{
  top:150px;
  left:20px;
  }
  Viewdialogs{
  left:-50px;
  }
  .items{
  margin-bottom: 0px;
  }
.click{
border: 2px solid black ;
}
#loading {
 width: 100%;   
 height: 100%;   
 top: 0px;
 left: 0px;
 position: fixed;   
 display: block;   
 opacity: 0.7;   
 background-color: #fff;   
 z-index: 9999;   
 text-align: center; }  
  
#loading-image {   
 position: absolute;   
 top: 50%;   
 left: 50%;  
 z-index: 100; } 
  </style>
</head>


    <div class="container">

   

        <div id="wrapper">
            <div id="calendar"></div>
        </div>
        <!--병원예약정보-->
      
        <div class="modal fade" tabindex="-1" role="dialog" id="eventhosModal">
            <div class="modal-dialog Viewdialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
         <table class="table table-bordered" style="text-align: center;">
  <thead>
    <tr>
      <td scope="col">병원명</td>
      <td scope="col" id='titlecall'></td>
    </tr>
  </thead>
  <tbody>
  <tr>
  <td scope="row">환자<br/></td>
      <td id='namecall'></td>
  </tr>
    <tr>
      <td scope="row">예약일시</td>
      <td id='timecall'></td>
      <td id='timecall2' style='display: none;padding: 0px'><input class="inputModal" type="text" name="update-start" id="edit-start"  style="margin: 0px;margin-top: 6px;width: 162px;"/></td>
    </tr>
    <tr >
      <td scope="row">예약신청일<br/></td>
      <td id="apply_time"></td>
    </tr>
   
 <tr><td>예약상태</td> <td id='approved'></td></tr>
 <tr><td>진료과</td><td id='dept_NAME'></td></tr>
 <tr><td>증상</td><td id='sel_SYMP'></td></tr>
  </tbody>
</table>
                    </div>
                    
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                          <button type="button" class="btn btn-danger" id="deleteEvent_no1">예약취소</button>

						
					
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        
  <!-- 복용약 상세보기MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventdrugModal">
            <div class="modal-dialog Viewdialogs" role="document">
                <div class="modal-content View">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
         	<table class="table table-bordered" style="text-align: center;vertical-align: middle;">
  <thead>
    <tr>
      <th scope="col" style="text-align: center;">제품명</th>
      <td scope="col" colspan="5"  id="item_name" style="padding: 0px;margin-bottom: 0px;text-align: left;"></td>
    </tr>
  </thead>
  <tbody>
    <tr id="edit-update_01">
      <th scope="row" style="text-align: center;">복용기간</th>
      <td id="item-date"></td> 
       <th scope="row" style="text-align: center;">모양<br/></th>
      <td colspan="3" id="chart"></td>
    </tr>
    <!--  -->
    <tr >
        <th scope="row" style="line-height: 94px;text-align: center;">효능 · 효과</th>
      <td id="er" colspan="5" style="text-align: left;width: 600px" ></td>
    </tr>
    <tr>
      <th class="text-center" scope="row" colspan="5"><input type="button" class="btn" id="item-2" value="상세설명"/>
      <input type="button" class="btn" id="item-1" value="주의사항"/>
      <input type="button" class="btn" id="item-3" value="용법·용량"/></th>
    </tr>
     <tr>
      <td style="width: 255px"> <img id="imgs" style="width: 255px;height: 250px" src="https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/154609804554800013"></td>
      <td colspan="5" id="items-1" style="display: none; height: 320px"><div style="overflow: auto;height: 320px"><span id="nb_DOC"></span></div></td>
 <td id="items-2" colspan="5" style="text-align: left;padding: 20px;height: 320px;">
<span id="material_NAME"></span>
<br>보관방법: <span id="storage_METHOD"></span>
<br>유통기한: <span id="valid_TERM"></span>
<br>제조사:<span id="entp_NAME"></span></td>
 <td colspan="5" id="items-3" style="display: none; height: 320px;width: 522px"><span id="ud_DOC"></span></td>
 </tr>

  </tbody>	
</table>

                    </div>
                    
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent_no2">삭제</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- 복용약 추가 -->
	<!-- 
	<div class="modal fade" tabindex="-1" role="dialog" id="eventdrugModaladd">
            <div class="modal-dialog Viewsds" role="document">
                <div class="modal-content Views">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4>복용약 추가</h4>
                    </div>
                    <div class="modal-body">
 						<div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">약이름</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-one"
                                    required="required" />
                            </div>
                        </div>

                   <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
						 <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="복용약등록">복용약등록</option>
                                </select>
                            </div>
                        </div>
                
                <div class="form-group">
                    <textarea class="form-control" type="text" id="medicinecontent" placeholder="내용"></textarea>
                </div>
                             
        
            
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event1">등록</button>
                    </div>
                   
                      </div>
                </div>
            </div>
        </div>
        -->
        <!--복용약추가 끝 -->
        <!-- 일정 추가 MODAL -->
        <!-- 
                <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog Viewsds" role="document">
                <div class="modal-content Views">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">병원이름</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-to"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">예약날짜</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="병원예약">병원예약</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">진료과</label>
                                <input class="inputModal" type="text" name="" id=""
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">의사명</label>
                                <input class="inputModal" type="text" name="" id=""
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">환자명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-name"
                                    required="required" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event2">예약하기</button>
                    </div>
                    
                </div>
            </div>
 -->
        </div>
<div id="loading"><img id="loading-image" src="<c:url value='/img/ajax-loader.gif'/>" alt="Loading..."/></div>

<script src='<c:url value="/calendar/vendor/js/moment.min.js"/>'></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src='<c:url value="/calendar/vendor/js/fullcalendar.min.js"/>'></script>

<script src='<c:url value="/calendar/vendor/js/ko.js"/>'></script>
<script src='<c:url value="/calendar/vendor/js/select2.min.js"/>'></script>
<script src='<c:url value="/calendar/vendor/js/bootstrap-datetimepicker.min.js"/>'></script>
<script src='<c:url value="/calendar/js/main.js"/>'></script>
<script src='<c:url value="/calendar/js/addEvent.js"/>'></script>
<script src='<c:url value="/calendar/js/editEvent.js"/>'></script>
<script src='<c:url value="/calendar/js/etcSetting.js"/>'></script>





