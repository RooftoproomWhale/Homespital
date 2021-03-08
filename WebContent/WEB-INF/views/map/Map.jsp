<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>

   .map_wrap {position: relative;height: 100%;}

    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}

    .wrap * {padding: 0;margin: 0;}

    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}

    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}

    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}

    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}

    .info .close:hover {cursor: pointer;}

    .info .body {position: relative;overflow: hidden;}

    .info .desc {position: relative;margin: 13px;height: 75px;}

    .desc .addr {overflow: hidden;text-overflow: addr;white-space: normal;}

    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

    .info .link {color: #5085BB;}

    .modal { position: absolute; top: 20%;}

   .body_title {font-size: 24px;font-weight: bold;}

   .load_wrap {

      position: absolute; 

      width: 100%;

       height: 100%;

       line-height: 30;

       text-align: center;

       background-color: rgba( 255, 255, 255, 0.5 );

      z-index: 1231234;

   }

   .map_top

   {

   		position: absolute;

   		top: 100px;

        left: 16px;

        display: flex;

        justify-content: space-between;

        align-items: center;

        z-index: 2;

   }

   .search 

   {

       border-radius: 24px;

       background: white;

       padding: 3px 24px 13px 24px;

       width: 343px;

       right: 16px;

       height: 46px;

       box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.16);

       background-color: #ffffff;

   }

   .searchInput

   {

	   width: 80%;

       border: 0 !important;

       background: white;

       font-size: small;

   }

   .map_select{

   		

   }

   #select_department

   {

   	   margin-left: 10px;

       padding: 6px;

       color: #333333;

       font-weight: 700;

       display: none;

   }

   .map_button{position: absolute;bottom: 110px;right: 8px;z-index: 2;flex-direction: column;}

   .current_refresh

   {

      width: 54px;

      height: 54px;

      margin-top: 8px;

      box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 3px 0px;

      background-color: white;

      border-radius: 32px;

      border-width: initial;

      border-style: none;

      border-color: initial;

      border-image: initial;

      outline: 0;

   }

   .menu_wrap{left: 13px;bottom: 19px;text-align: center;position: absolute;z-index: 2;}

   .close_wrap{

	    position: absolute;

	    top: 30%;

	    left: 40%;

	    width: 390px;

	    z-index: 200;

	    text-align: center;

	    background-color: #d1ecf1;

	    border-color: #bee5eb;

	    border-radius: .5rem;

	    padding: .75rem 1.25rem;

	    display: none;

   }

   .info_wrap{position: absolute;top: 80px;left: 0;bottom: 0;width: 390px;z-index: 200;background: #fff;flex-direction: column;}

   .info-toggle{position: absolute;top: 50%;left: 0;left: 390px;z-index: 20;}

   .info_btn_toggle{

      position: absolute;

      top: 0;

      left: 0;

      margin: auto;

      width: 22px;

      height: 54px;

      background: url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/shadow/img_navi.png) no-repeat 0 0;

      cursor: pointer;

   }

   .infoWindowDiv{

   	  display:inline-block;

   	  padding:5px;

   	  white-space: nowrap;

   }

   .top_area{

      position: relative;

       

       padding: 20px 20px 10px;

       

   }

   .top_search_area{

      

       top: 0;

       left: 0;

       right: 0;

       width: 350px;

       height: 46px;

       border-radius: 3px;

      background-color: #f2f2f2;

   }

   .top_absfilter_area{

      text-align: center;

      padding: 0 0 20px 0;

   }

   .top_filter_area{

      padding: 14px 0 9px;

      margin: 0 20px;

      display: none;

   }

   .filter_li{

   		display: inline-block;

    margin: 0 5px 5px 0;

    font-size: 12px;

    line-height: 24px;

    color: #333;

    vertical-align: top;

   }

   .filter_btn_active{

   	background-color: #0475f4;

    border-color: transparent;

    color: #fff;

   }

   .filter_button{

      width: 44px;

      height: 44px;

      box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 3px 0px;

      background-color: white;

      border-radius: 22px;

      border-width: initial;

      border-style: none;

       border-color: initial;

       border-image: initial;

       margin: 0 10px;

       outline: 0;

   }

   .filter_btn{

   		display: inline-block;

    border: 1px solid rgba(0,0,0,.1);

    border-radius: 15px;

    padding: 0 12px;

   }

   .selected_filter{

      box-shadow: rgba(0, 255, 0, 1) 0px 3px 3px 0px;

   }

   .search_keyword_input{

      float: left;

       width: 300px;

       padding: 12px 16px 15px;

       border: 0 none;

       font-weight: bold;

       font-size: 16px;

       line-height: 19px;

       background-color: transparent;

       outline: 0;

   }

   .search_keyword_submit{

      float: left;

      width: 36px;

      height: 36px;

       margin: 5px 0;

       border: 0 none;  

       line-height: 0;

       cursor: pointer;

       background: url("<c:url value='/images/map/search.png'/>");

       background-size: cover;

   }

   .warp_invisible{transform:translateX(-391px);}

   .left_toggle{left:0; }

 

   

   .scroll_area{overflow:auto;height: 100%;flex-direction: column;background: #fff;}

   .search_item{border-top:1px solid #e5e5e5;margin: 0 20px;padding: 19px 20px 18px;;display: block;cursor: pointer;}

 

   

   .content_title{

      display: inline-block;

       font-size: 17px;

   }

   .content_body{

      margin-top: 3px;

      margin-bottom: 3px;

   }

 

   

   .inner_title_area{

      padding-left: 20px;

   }

   .inner_title{

      font-weight: 700;

      font-size: 22px;

   }

   .inner_summary_info{

      margin-top: 2px;

      font-size: 13px;

   }

   .inner_btn_area{

      padding: 17px 20px 12px;

      border-bottom:1px solid #e5e5e5;

      margin-left: 20px;

      margin-right: 20px;

   }

   .btn_direction{

      text-align: right;

   }

   .find_way_btn{

   	  margin-right: 10px;

   }

   .inner_final_area{

      padding-top: 20px;

      padding-bottom: 20px;

      border-bottom: 1px solid #e5e5e5;

      margin-left: 20px;

      margin-right: 20px;

   }

   .inner_final_icon{

       overflow: hidden;

       display: inline-block;

       width: 30px;

       height: 30px;

       font-size: 0;

       color: transparent;

       vertical-align: top;

       float: left;

       margin-right: 15px;

   }

   .inner_detail_tel{

      margin-top: 16px;

   }

   .inner_detail_time{

      margin-top: 16px;

   }

   .inner_detail_time2{

      margin-top: 16px;

   }

   .inner_end_box{

      padding-top: 2px;

       line-height: 18px;

       overflow: hidden;

       position: relative;

       font-size: 14px;

       line-height: 21px;

   }

   .tableInfoInner{

	    width: 30px;

	    height: 30px;

	    background-color: #D6D6D6;

	    display: inline-block;

	    border: 1px solide gray;

	    border-radius: 3px;

	    margin: 3px;

	 }

	.g{

	    background-color: #7A7A7A;

	  }

	.b{

	 

	    background-color: #03A9F4;

	 }

    .ui-autocomplete {

       position: absolute;

       max-height: 200px;

        overflow-y: auto;

        /* prevent horizontal scrollbar */

        overflow-x: hidden;

        /* add padding to account for vertical scrollbar */

        padding-right: 20px;

        width: 350px; !important;

    }

</style>

<div class="map_wrap">

   <div id="search_wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px;position:absolute;z-index: 3">

      <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">

   </div>

   <div class="load_wrap">

      <img class="load_img" style="vertical-align: bottom;" src="<c:url value='/images/map/mask_loader.gif'/>">

   </div>

   <div class="close_wrap">

      <div class="mask_close">

      	마스크 공급이 안정화되어 7월 12일부터 공적 마스크 공급을 중단합니다. 

      	12일부터 약국, 마트, 편의점, 온라인에서 제한 없이 구매가 가능합니다. 

      	이에 따라 마스크 맵 서비스도 운영을 중단합니다. 이용해 주셔서 감사합니다.

      </div>

   </div>

   <div class="map_top">

   	  <div class="search">

      	<input class="searchInput" id="searchAddress" placeholder="지도상 현재 위치의 주소가 표시됩니다" disabled>

      	<img style="width: 43px;cursor: pointer;"src="<c:url value='/images/map/search.png'/>" onclick="addressSearch()" ></img>

   	  </div>

	  <div class="map_select">

	   	 <select name="select_department" id="select_department">

		    <option>전체</option>

		    <option>내과</option>

		    <option>비뇨기과</option>

		    <option>산부인과</option>

		    <option>성형외과</option>

		    <option>소아청소년과</option>

		    <option>신경과</option>

		    <option>안과</option>

		    <option>이비인후과</option>

		    <option>일반외과</option>

		    <option>정신건강의학과</option>

		    <option>정형외과</option>

		    <option>치과</option>

		    <option>피부과</option>

		    <option>한방과</option>

	     </select>

	  </div>

   </div>

   

   <div class="map_button">

      <button class="current_refresh" type="button" onclick="currentPosition()">

         <img src="<c:url value='/images/map/current_position.png'/>" style="width: 34px;height: 34px;">

      </button>

      <button class="current_refresh" type="button" onclick="refreshMap()">

         <img src="<c:url value='/images/map/refresh.png'/>" style="width: 34px;height: 34px;">

      </button>

   </div>

   

   <!-- 

   <div class="current">

      <button type="button" onclick="currentPosition()">현재위치</button>

   </div>

   <div class="refresh_map">

      <button type="button" onclick="refreshMap()">갱신</button>

   </div>

    -->

   <div class="info_wrap warp_invisible">

      <div class="top_area">

         <div class="top_absfilter_area">

            <button class="filter_button" id="filter_hospital" type="button">

               <img src="<c:url value='/images/map/hospital_image/hospital.png'/>" style="width: 34px;height: 34px;">

            </button>

            <button class="filter_button" id="filter_pharmacy" type="button">

               <img src="<c:url value='/images/map/pharmacy_image/pharmacy_button.png'/>" style="width: 34px;height: 34px;">

            </button>

         </div>

         <div class='top_search_area'>

            <input class="search_keyword_input" maxlength="100" autocomplete="off" placeholder="검색어를 입력하세요">

 

            <button type="button" class="search_keyword_submit"></button>

         </div>

         <div class="top_filter_area">

         <!-- 

		   	전체

			내과

			비뇨기과

			산부인과

			성형외과

			소아청소년과

			신경과

			안과

			이비인후과

			일반외과

			정신건강의학과

			정형외과

			치과

			피부과

			한방과

	      -->	

         	<ul>

         		<li class="filter_li"><button class="filter_btn filter_btn_active">전체</button></li>

         		<li class="filter_li"><button class="filter_btn">내과</button></li>

         		<li class="filter_li"><button class="filter_btn">비뇨기과</button></li>

         		<li class="filter_li"><button class="filter_btn">산부인과</button></li>

         		<li class="filter_li"><button class="filter_btn">성형외과</button></li>

         		<li class="filter_li"><button class="filter_btn">소아청소년과</button></li>

         		<li class="filter_li"><button class="filter_btn">신경과</button></li>

         		<li class="filter_li"><button class="filter_btn">안과</button></li>

         		<li class="filter_li"><button class="filter_btn">이비인후과</button></li>

         		<li class="filter_li"><button class="filter_btn">일반외과</button></li>

         		<li class="filter_li"><button class="filter_btn">정신건강의학과</button></li>

         		<li class="filter_li"><button class="filter_btn">정형외과</button></li>

         		<li class="filter_li"><button class="filter_btn">치과</button></li>

         		<li class="filter_li"><button class="filter_btn">피부과</button></li>

         		<li class="filter_li"><button class="filter_btn">한방과</button></li>

         	</ul>

         </div>

      </div>

      <div class="scroll_area">

         <div class="search_list">

         

            <!-- <div class="search_item" onclick="searchItemClick('서울 금천구 가산디지털1로 186 제이플라츠 2층 애슐리');">

               <div class="search_item_detail">

                  <div class="detail_content">

                     <div class="content_title">

                        <strong>병원</strong>

                     </div>

 

                     <div class="content_body">

                        내과

                        010-1234-5678

                     </div>

                     <div class="content_body">

                        서울 금천구 가산디지털1로 186 제이플라츠 2층 애슐리

 

                     </div>

                     

                  </div>

               </div>

            </div> 

            <div class="inner_top">

               <div class="inner_title_area">

                  <div class="inner_title">

                     <strong>고래병원</strong>

                  </div>

                  <div class="inner_summary_info">

                     <span>병원</span>

                     <span>내과</span>

                  </div>

               </div>

               <div class="inner_btn_area">

                  <div class="btn_direction">

                     <button class="find_way_btn">길찾기</button>

                     <button class="reservation_btn" onclick="reservation_show();">예약</button>

                  </div>

               </div>

               <div class="inner_final_area">

                  <div class="inner_detail_address">

                     <img class="inner_final_icon" src="<c:url value='/images/map/detail_view/address.png'/>">

                     <div class="inner_end_box">서울 동작구 만양로14다길 3</div>

                  </div>

                  <div class="inner_detail_tel">

                     <img class="inner_final_icon" src="<c:url value='/images/map/detail_view/tel.png'/>">

                     <div class="inner_end_box">010-1234-5678</div>

                  </div>

                  <div class="inner_detail_time">

                     <img class="inner_final_icon" src="<c:url value='/images/map/detail_view/time.png'/>">

                     <div class="inner_end_box">11:00~16:00</div>

                  </div>

                  <div class="inner_detail_time2">

                     <img class="inner_final_icon" src="<c:url value='/images/map/detail_view/detail_info.png'/>">

                     <div class="inner_end_box">

                        영업시간 11:00~ 14:40 16:00~ 20:30<br/>

                        휴무: 매주 월요일

                     </div>

                  </div>

               </div>

            </div>-->

         </div>

         <div style='text-align: center;'>

	         <div  style="display: inline-block; padding: 30px; ">

	         	<div  class="reservation_info">

	         	</div>

	         	<div class="currentResByAddr">

	         		

	         	</div>

	         </div>

	         	

         </div>

         

         <script>

         	/* var count=6;

            var emptyDiv = '<div class="tableInfoInner g" ><div>';

         	var reservationDiv = '<div class="tableInfoInner b"><div>';

         	$(".reservation_info").append('<h3>현재 예약인원은 '+count+'명 입니다</h3>');

         	for(var i=1;i<=25;i++){

         		if(i<=count)

         		{

         			$(".reservation_info").append(reservationDiv);

         		}else{

         			$(".reservation_info").append(emptyDiv);

         		}

         		if(i%5==0){

         			$(".reservation_info").append("<div></div>");

         		}

         	} */

         	function createReservationTable(count){

         		$(".reservation_info").empty();

         		var emptyDiv = '<div class="tableInfoInner g" ><div>';

             	var reservationDiv = '<div class="tableInfoInner b"><div>';

             	$(".reservation_info").append('<h3>현재 예약인원은 '+count+'명 입니다</h3>');

             	for(var i=1;i<=	15;i++){

             		if(i<=count)

             		{

             			$(".reservation_info").append(reservationDiv);

             		}else{

             			$(".reservation_info").append(emptyDiv);

             		}

             		if(i%5==0){

             			$(".reservation_info").append("<div></div>");

             		}

             	}

         	};

         </script>

      </div>

   </div>

   <div class="info-toggle left_toggle">

      <span class="info_btn_toggle"></span>

   </div>

   <div class="menu_wrap">

      <button class="current_refresh"  type="button" onclick="changeApi(0)">

         <img src="<c:url value='/images/map/hospital_image/hospital.png'/>" style="width: 44px;height: 44px;">

      </button>

      <button class="current_refresh"  type="button" onclick="changeApi(1)">

         <img src="<c:url value='/images/map/pharmacy_image/pharmacy_button.png'/>" style="width: 44px;height: 44px;">

      </button>

      <button class="current_refresh"  type="button" onclick="changeApi(2)">

         <img src="<c:url value='/images/map/maskmap_image/mask_button.png'/>" style="width: 44px;height: 44px;">

      </button>

      <button class="current_refresh"  type="button" onclick="changeApi(3)">

         <img src="<c:url value='/images/map/corona_image/corona_button.png'/>" style="width: 44px;height: 44px;">

      </button>

   </div>

   <div id="map" style="width: 100%; height: 100%;position: relative;overflow: hidden;"></div>

</div>

<div class="modal fade" id="reservation-modal">

   <div class="modal-dialog">

      <div class="modal-content">

         <form id="reservation_form" method="post">

         	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>

         	<input type="hidden" id="address" name="address" value=""/>

         	<input type="hidden" id="department" name="department" value=""/>

            <div class="modal-header">

               <button class="close" data-dismiss="modal">

                  <span>&times;</span>

               </button>

               <h4 class="modal-title">병원 예약</h4>

            </div>

            <div class="modal-body">

               <div class="row">

                  <div class="col-sm-6">

                     <div class="form-group">

                        <span class="form-label">이름</span>

                        <input class="form-control" type="text" id="name" name="name" value="${MemberDTO.mem_name}" disabled>

                     </div>

                  </div>

                  <div class="col-sm-6">

                     <div class="form-group">

                        <span class="form-label">이메일</span>

                        <input class="form-control" type="email" id="email" name="email" value="${MemberDTO.mem_email}" disabled>

                     </div>

                  </div>

               </div>

               <div class="row">

                  <div class="col-sm-6">

                     <div class="form-group">

	                   <span class="form-label">전화번호</span>

	                   <input class="form-control" type="tel" id="tel" name="tel" value="${MemberDTO.tel}" disabled>

	                 </div>

                  </div>

                  <div class="col-sm-6">

                     <div class="form-group">

	                   <span class="form-label">병원 이름</span>

	                   <input class="form-control" id="modal_hosp_name" name="hosp_name" type="text" disabled>

	                 </div>

                  </div>

               </div>

               <div class="row">

                  <div class="col-sm-6">

                     <div class="form-group">

		                  <span class="form-label">진료실</span>

		                  <div class="btn-group" id="dept_radio" style="display: flex;">

		                     <label class="keyboard disable radio-inline form-label"><input type="radio" name="optradio" checked>내과</label>

		                     <label class="keyboard disable radio-inline form-label"><input type="radio" name="optradio">정형외과</label>

		                     <label class="keyboard disable radio-inline form-label"><input type="radio" name="optradio">산부인과</label>

		                  </div>

		               </div>

                  </div>

                  <div class="col-sm-6">

                     <div class="form-group">

	                   <span class="form-label">진료 증상</span>

	                   <select id="symptom" name="symptom" class="form-control" data-validation-required-message="증상을 선택해주세요" required>

	                   		

	                   </select>

                       <span class="select-arrow"></span>

	                 </div>

                  </div>

               </div>

               

              

               <div class="row">

                  <div class="col-sm-5">

                     <div class="form-group">

                        <span class="form-label">예약 날짜</span>

                        <input class="form-control" id="reservation_date" type="text" name="datepick" placeholder="날짜를 선택해주세요" autocomplete="off" onkeydown="return false" required>

                     </div>

                  </div>

                  <div class="col-sm-7">

                     <div class="row">

                        <div class="col-sm-6">

                           <div class="form-group">

                              <span class="form-label">시</span>

                              <select id="Hour" name="hour" class="form-control" required>

                                 <!-- <option>1</option>

                                 <option>2</option>

                                 <option>3</option>

                                 <option>4</option>

                                 <option>5</option>

                                 <option>6</option>

                                 <option>7</option>

                                 <option>8</option>

                                 <option>9</option>

                                 <option>10</option>

                                 <option>11</option>

                                 <option>12</option> -->

                              </select>

                              <span class="select-arrow"></span>

                           </div>

                        </div>

                        <div class="col-sm-6">

                           <div class="form-group">

                              <span class="form-label">분</span>

                              <select id="Minute" name="minute" class="form-control" required>

                                 <!-- <option>05</option>

                                 <option>10</option>

                                 <option>15</option>

                                 <option>20</option>

                                 <option>25</option>

                                 <option>30</option>

                                 <option>35</option>

                                 <option>40</option>

                                 <option>45</option>

                                 <option>50</option>

                                 <option>55</option> -->

                              </select>

                              <span class="select-arrow"></span>

                           </div>

                        </div>

                        

                     </div>

                  </div>

               </div>

            </div>

            <div class="modal-footer">

               <button type="submit" class="btn btn-success" id="resBtn_confirm">예약</button>

               <button class="btn btn-info" data-dismiss="modal">닫기</button>

            </div>

         </form>

      </div>

   </div>

</div>

<div class="modal fade" id="maskInfo-modal">

   <div class="modal-dialog modal-sm">

      <div class="modal-content">

         <div class="modal-header">

            <button class="close" data-dismiss="modal">

               <span>&times;</span>

            </button>

         </div>

         <div class="modal-body">

            <div class="body_title"></div>

            <div class="body_content">

               <div class="content_type"></div>

               <div class="content_addr"></div>

               <div class="content_stock"></div>

               <div class="content_stock_count"></div>

               <div class="content_stock_at"></div>

               <div class="content_created_at"></div>

            </div>

         </div>

         <div class="modal-footer">

         </div>

      </div>

   </div>

</div>

<script type="text/javascript"

      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12d8eede943e602b615bb4e2dc8e5e30&libraries=services,clusterer,drawing"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

   $(function() {

      jQuery.curCSS = function(element, prop, val) {

          return jQuery(element).css(prop, val);

      };

      console.log($('.info_btn_toggle'))

      //$('#filter_mask').addClass('selected_filter');

      $('.menu_wrap > .current_refresh:eq(3)').addClass('selected_filter');

      /* $('.info_btn_toggle').on('click',function(){

         console.log($('.info_wrap'));

         $('.info_wrap').css("transform","translateX(-391px)");

         $('.info-toggle').css("left","0");

      }); */

      $('.filter_btn').on('click',function(){

    	  console.log(this)

    	  console.log($(this).html())

    	  $('.filter_btn').removeClass('filter_btn_active');

    	  $(this).toggleClass('filter_btn_active');

    	  filter_apply($(this).html(),$(this).html());

      });

      $('.search_keyword_input').autocomplete({

         source : function(request, response) {

            $.ajax({

               url : "<c:url value='/Homespital/Map/searchList.hst'/>",

               type : "GET",

               dataType: "json",

               data : {"search_keyword" : $(".search_keyword_input").val(),"apiStatus" : apiStatus},

               success : function(data){

                  console.log(data);

                  response($.map(data, function(item){

                     return {

                        label: item,

                        value: item

                     }

                  }));

               },

               error : function(){ //실패

                     alert("통신에 실패했습니다.");

                  }

            });

         },

         minLength : 1,

         autoFocus : false,

         select : function(evt, ui) {

               console.log("전체 data: " + JSON.stringify(ui));

               console.log(ui.item.label);

               $('.search_keyword_input').val(ui.item.label);

               $('.search_keyword_submit').trigger('click');

               /* console.log("db Index : " + ui.item.idx);

               console.log("검색 데이터 : " + ui.item.value); */

           },

           focus : function(evt, ui) {

               return false;

           },

           close : function(evt) {

              

           }

      })

      $('.search_keyword_submit').click(function(){

 

         console.log('검색',$('.search_keyword_input').val().length);

         console.log($('.filter_btn_active').html());

         $(".reservation_info").hide();

         var search_val = $('.search_keyword_input').val();

         var search_dept = $('.filter_btn_active').html()

         

         if(search_dept == '전체')

         {

        	 search_dept = '';

         }

         

         if($('.search_keyword_input').val().length > 0)

         {

            switch (apiStatus) {

            case 0:

               loadHospitalList(search_val,search_dept);

               break;

            case 1:

            case 2:

               loadPharmacyList(search_val);

               break;

            default:

               

            }

            

         }

 

      });

      

      $('.info_btn_toggle').click(function(){

         console.log($('.info_wrap'));

         $('.info_wrap').toggleClass('warp_invisible');

         $('.info-toggle').toggleClass('left_toggle');

      });

      

      $('#filter_hospital').click(function(){

         apiStatus = 0;

         console.log('병원 필터 클릭',apiStatus);

         $('.search_list').html('');

         $('.search_keyword_input').val('');

         $(".reservation_info").hide();

         $('.top_filter_area').show();

         

         $('#filter_hospital').addClass('selected_filter');

         $('#filter_pharmacy').removeClass('selected_filter');

      });

      $('#filter_pharmacy').click(function(){

         apiStatus = 1;

         console.log('약국 필터 클릭',apiStatus);

         $('.search_list').html('');

         $('.search_keyword_input').val('');

         $(".reservation_info").hide();

         $('.top_filter_area').hide();

         

         $('#filter_hospital').removeClass('selected_filter');

         $('#filter_pharmacy').addClass('selected_filter');

      });

      

      $('.menu_wrap > .current_refresh:eq(0)').click(function(){

         $('.menu_wrap > .current_refresh:eq(0)').addClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(1)').removeClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(2)').removeClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(3)').removeClass('selected_filter');

      })

      

      $('.menu_wrap > .current_refresh:eq(1)').click(function(){

         $('.menu_wrap > .current_refresh:eq(0)').removeClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(1)').addClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(2)').removeClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(3)').removeClass('selected_filter');

      })

      

      $('.menu_wrap > .current_refresh:eq(2)').click(function(){

         $('.menu_wrap > .current_refresh:eq(0)').removeClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(1)').removeClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(2)').addClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(3)').removeClass('selected_filter');

      })

      

      $('.menu_wrap > .current_refresh:eq(3)').click(function(){

         $('.menu_wrap > .current_refresh:eq(0)').removeClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(1)').removeClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(2)').removeClass('selected_filter');

         $('.menu_wrap > .current_refresh:eq(3)').addClass('selected_filter');

      })

      

      $(".reservation_info").hide();

      

	  $("#reservation_form").submit(function(){	

    	  

    	  $(':disabled').each(function(e) {

    	      $(this).removeAttr('disabled');

    	  })

    	  

    	  console.log($('#reservation_form').serialize()+"&hourMinute="+$('#Hour').val()+":"+$('#Minute').val());

    	  

    	  $.ajax({

				url:"<c:url value='/Homespital/Map/Reservation.hst'/>",

				data:$('#reservation_form').serialize()+"&hourMinute="+$('#Hour').val()+":"+$('#Minute').val(),

				dataType:'text',

				type:'post',

				success:function(data){

					console.log(data);

					

					if(data == 1)

					{

						alert("예약이 완료되었습니다");

						$('#reservation-modal').modal('hide');

					}

					else if(data == 2)

					{

						alert("현재시간 이전의 시간으로는 예약할 수 없습니다");

					}

					else if(data == 3)

					{

						alert("이미 오늘 이 병원에 예약을 하셨습니다");

					}

 

				},

				error:function(e){

		            console.log(e);   

	            }

		  });

 

    	  $('#name').attr('disabled', true);

    	  $('#email').attr('disabled', true);

    	  $('#tel').attr('disabled', true);

    	  $('#modal_hosp_name').attr('disabled', true);

      });

      

      /* $("#resBtn_confirm").click(function(){	

    	  

    	  $(':disabled').each(function(e) {

    	      $(this).removeAttr('disabled');

    	  })

    	  

    	  console.log($('#reservation_form').serialize()+"&hourMinute="+$('#Hour').val()+":"+$('#Minute').val());

    	  

    	  $.ajax({

				url:"<c:url value='/Homespital/Map/Reservation.hst'/>",

				data:$('#reservation_form').serialize()+"&hourMinute="+$('#Hour').val()+":"+$('#Minute').val(),

				dataType:'text',

				type:'post',

				success:function(data){

					console.log(data);

					if(data == 1)

					{

						alert("예약이 완료되었습니다");

					}

				},

				error:function(e){

		            console.log(e);   

	            }

		  });

 

    	  $('#name').attr('disabled', true);

    	  $('#email').attr('disabled', true);

    	  $('#tel').attr('disabled', true);

    	  $('#modal_hosp_name').attr('disabled', true);

      }); */

      

      $('#reservation_date').datepicker({

         dateFormat: "yy-mm-dd",

         onSelect: function(dateText, inst) {

             var date = new Date();

             console.log(date.getDate());

             console.log(parse(dateText));

             changeSelector(date,parse(dateText));

         },

         showAnim: "slide",

         showMonthAfterYear: true ,

         minDate: 0,

         yearSuffix: "년",

         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],   //한글 캘린더중 월 표시를 위한 부분

           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],   //한글 캘린더 중 월 표시를 위한 부분

           dayNames: ['일', '월', '화', '수', '목', '금', '토'],   //한글 캘린더 요일 표시 부분

           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],   //한글 요일 표시 부분

           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],   // 한글 요일 표시 부분

      });

 

      $('#select_department').on("change", function() {

    	  var idx = $("#select_department option").index( $("#select_department option:selected") );

    	  filter_apply(this.value,idx);

      });

      

      $('#Hour').on("change", function() {

    	  var date = new Date();

    	  console.log(this.value,date.getHours());

    	  if(this.value != date.getHours())

    	  {

    		  $("#Minute").empty();

    		  

    		  option = "";

    		  for(var i = 0; i <= 50; i=i+10)

    		  {

    			  if(i==0)

    			  {

    				  option += "<option>0"+i+"</option>";

    			  }

    			  else

    			  {

    				  option += "<option>"+i+"</option>";

    			  }

    		  }

    		  

    		  $('#Minute').append(option);

    	  }

    	  else

    	  {

    		  $("#Minute").empty();

    		  var min = ((Math.floor(date.getMinutes() / 10)) * 10) + 10;

			  console.log(min);

			  

			  option = "";

			  if(min == 60)

			  {

				  for(var i = 0; i <= 50; i=i+10)

	    		  {

					  if(i==0)

	    			  {

	    				  option += "<option>0"+i+"</option>";

	    			  }

	    			  else

	    			  {

	    				  option += "<option>"+i+"</option>";

	    			  }

	    		  }

				  console.log(option)

				  $('#Minute').append(option);

			  }

			  else

			  {

				  for(var i = min; i <= 50; i=i+10)

	    		  {

					  if(i==0)

	    			  {

	    				  option += "<option>0"+i+"</option>";

	    			  }

	    			  else

	    			  {

	    				  option += "<option>"+i+"</option>";

	    			  }

	    		  }

				  console.log(option)

				  $('#Minute').append(option);

			  } 

    	  }

      });

      

   });

</script>

<script>

 

   var markers = [];

   var currentMarkers = [];

 

   var circle;

   

   var intervalReservation;

   

   var currentLatLng;

   

   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

   lat, lon,

   mapOption = {

      center : new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표

      level : 3, // 지도의 확대 레벨

      mapTypeId : kakao.maps.MapTypeId.ROADMAP

   // 지도종류

   };

   

   // 지도를 생성한다 

   var map = new kakao.maps.Map(mapContainer, mapOption);

   

   var geocoder = new kakao.maps.services.Geocoder();

   

   var apiStatus = 3; // 0:병원, 1: 약국, 2: 공적마스크, 3: 확진자 동선

   

   var deptStatus = 0; //~14

   /*

   	전체

	내과

	비뇨기과

	산부인과

	성형외과

	소아청소년과

	신경과

	안과

	이비인후과

	일반외과

	정신건강의학과

	정형외과

	치과

	피부과

	한방과

   */

   

   kakao.maps.event.addListener(map, 'dragend', function() {

      // 지도의  레벨을 얻어옵니다

       var level = map.getLevel();

   

       // 지도의 중심좌표를 얻어옵니다 

       var latlng = map.getCenter(); 

       searchAddrFromCoords(latlng, displayCenterInfo);

       var bound = map.getBounds();

       

       console.log("마커길이(드래그)",markers.length);

       for (var i = 0; i<markers.length; i++)

       {

          console.log(bound.contain(markers[i].getPosition()),markers[i]);

          if(!bound.contain(markers[i].getPosition()))

          {

             markers[i].setMap(null);

             markers.splice(i, 1);

             

             console.log("지도밖 삭제처리",markers.length,markers);

          }

       }

      

       console.log("지도레벨(드래그)",level);

       console.log("위치(드래그)",latlng);

       console.log("바운드(드래그)",bound);

       console.log("거리차이",distance(currentLatLng.getLat(),currentLatLng.getLng(),latlng.getLat(),latlng.getLng(),"kilometer"))

       console.log("거리차이(Boolean)",distance(currentLatLng.getLat(),currentLatLng.getLng(),latlng.getLat(),latlng.getLng(),"kilometer")>0.8)

 

       if(distance(currentLatLng.getLat(),currentLatLng.getLng(),latlng.getLat(),latlng.getLng(),"kilometer")>0.7)

       {

    	   loadMapApi(latlng.getLat(),latlng.getLng(),apiStatus);

           currentLatLng = latlng;

       }

       

   });

   

   kakao.maps.event.addListener(map, 'zoom_changed', function() {

      // 지도의  레벨을 얻어옵니다

       var level = map.getLevel();

       

      var latlng = map.getCenter(); 

      searchAddrFromCoords(latlng, displayCenterInfo);

       var bound = map.getBounds();

 

       console.log("지도레벨(드래그)",level);

       console.log("위치(드래그)",latlng);

       console.log("바운드(드래그)",bound);

       console.log("거리차이",distance(currentLatLng.getLat(),currentLatLng.getLng(),latlng.getLat(),latlng.getLng(),"kilometer"))

       console.log("거리차이(Boolean)",distance(currentLatLng.getLat(),currentLatLng.getLng(),latlng.getLat(),latlng.getLng(),"kilometer")>0.8)

 

       if(distance(currentLatLng.getLat(),currentLatLng.getLng(),latlng.getLat(),latlng.getLng(),"kilometer")>0.7)

       {

    	   removeMarker();

    	   loadMapApi(latlng.getLat(),latlng.getLng(),apiStatus);

           currentLatLng = latlng;

       }

   });

   

   // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 

   if (navigator.geolocation) {

   

      // GeoLocation을 이용해서 접속 위치를 얻어옵니다

      currentPosition()

   

      // 지도에 마커와 인포윈도우를 표시하는 함수입니다

      function displayMarker(locPosition) {

   

         // 마커를 생성합니다

         var marker_present = new kakao.maps.Marker({

            map : map,

            position : locPosition,

            image :  new kakao.maps.MarkerImage(

                  "https://ssl.pstatic.net/static/maps/m/pin_rd.png",

                    new kakao.maps.Size(35, 35))

         });

 

         // 지도 중심좌표를 접속위치로 변경합니다

         map.setCenter(locPosition);

      }

      

      function loadMapApi(latitude,longitude,status)

      {

         console.log('API 상태',status);

         switch (status) {

         case 0:

            loadHospital(latitude,longitude);

            $('.top_filter_area').show();

            $('#filter_hospital').addClass('selected_filter');

            $('#filter_pharmacy').removeClass('selected_filter');

            break;

         case 1:

            loadPharmacy(latitude,longitude);

            $('.top_filter_area').hide();

            $('#filter_hospital').removeClass('selected_filter');

            $('#filter_pharmacy').addClass('selected_filter');

            break;

         case 2:

            storesByGeo(latitude,longitude);

            $('.top_filter_area').hide();

            $('#filter_hospital').removeClass('selected_filter');

            $('#filter_pharmacy').removeClass('selected_filter');

            break;

         default:

            loadCovidMap();

            $('.top_filter_area').hide();

            $('#filter_hospital').removeClass('selected_filter');

            $('#filter_pharmacy').removeClass('selected_filter');

            break;

         }

      }

      function loadHospital(latitude,longitude)

      {

         $.ajax({

            url:"<c:url value='/Homespital/Map/Hospital.hst'/>",

            type:'get',

            datatype:'json',

            data:{"lat":latitude,"lng":longitude},

            beforeSend: function () {

               console.log("beforeSend");

               FunLoadingBarStart();

            },

            complete: function () {

               console.log("complete");

               FunLoadingBarEnd();

            },

            success:function(data){

               console.log(data);

               var jsonData = JSON.parse(data);

               console.log("연결성공", jsonData,typeof(jsonData));

               currentMarkers = jsonData;

               $.each(jsonData, function(i, item) {

                  if(item.auth=='제휴승인됨')

                  {

                	  var marker = new kakao.maps.Marker({

                          //map : map,

                          position : new kakao.maps.LatLng(item.cor_y, item.cor_x),

                          image :  new kakao.maps.MarkerImage(

                                "<c:url value='/images/map/hospital_image/hospital.png'/>",

                                  new kakao.maps.Size(35, 35)),

                          title : item.hosp_name

                       });

                  }

                  else

                  {

                	  var marker = new kakao.maps.Marker({

                          //map : map,

                          position : new kakao.maps.LatLng(item.cor_y, item.cor_x),

                          image :  new kakao.maps.MarkerImage(

                                "<c:url value='/images/map/hospital_image/hospital_normal.png'/>",

                                  new kakao.maps.Size(35, 35)),

                          title : item.hosp_name

                       });

                  }

                  

                  var dept_item = '';

                  

                  var iwContent = '<div class="infoWindowDiv">'+item.hosp_name+'</div>';

                     

                  var infowindow = new kakao.maps.InfoWindow({

                      content : iwContent

                  });

                  

                  kakao.maps.event.addListener(marker, 'click', function(){

                	 clearInterval(intervalReservation)

                     console.log("modal",item,i)

                     console.log($('.info_wrap').hasClass('warp_invisible'));

                     console.log($('.info-toggle').hasClass('left_toggle'));

                     console.log('auth',item.auth);

                     if(item.auth == '제휴승인됨'){

                    	 refreshReservation(item);	

                    	 intervalReservation = setInterval(() => {

                    		refreshReservation(item);	

                 		 }, 500);

                     }

                     else

                   	 {

                    	 $(".reservation_info").empty();

                    	 $(".reservation_info").append('<h3>홈스피탈 제휴 병원만\n예약 정보 확인 가능합니다</h3>');

                   	 }

                     

                     if($('.info-toggle').hasClass('left_toggle')==true)

                     {

                        $('.info_wrap').removeClass('warp_invisible');

                        $('.info-toggle').removeClass('left_toggle');

                     }

                     

                     var weekday_open = ((item.weekday_open == undefined || item.weekday_open == '0' || item.weekday_open.length == 0 || item.weekday_open == '') ? '800' : item.weekday_open)

                     var weekday_close = ((item.weekday_close == undefined || item.weekday_close == '0' || item.weekday_close.length == 0 || item.weekday_close == '') ? '2200' : item.weekday_close)

                     var weekend_open = ((item.weekend_open == undefined || item.weekend_open == '0' || item.weekend_open.length == 0 || item.weekend_open == '') ? '900' : item.weekend_open)

                     var weekend_close = ((item.weekend_close == undefined || item.weekend_close == '0' || item.weekend_close.length == 0 || item.weekend_close == '') ? '1200' : item.weekend_close)

                     var lunchtime = ((item.lunchtime == undefined || item.lunchtime == '0' || item.lunchtime.length == 0 || item.lunchtime.length == '') ? '12:30~1:30' : item.lunchtime)

                    		 

                     console.log("lunchtime",lunchtime);

                     console.log("typeof lunchtime",typeof lunchtime);

                     console.log("item.lunchtime.length",item.lunchtime.length);

                    		 

                     var weekday_open_H = weekday_open.substring(0,parseInt(weekday_open.length/2));

	               	 console.log("weekday_open",weekday_open_H);

	               	 var weekday_open_M = weekday_open.substring(parseInt(weekday_open.length/2),weekday_open.length);

	               	 console.log("weekday_open",weekday_open_M);

	               	  

	               	 var weekday_close_H = weekday_close.substring(0,parseInt(weekday_close.length/2));

	               	 console.log("weekday_close",weekday_close_H);

	               	 var weekday_close_M = weekday_close.substring(parseInt(weekday_close.length/2),weekday_close.length);

	               	 console.log("weekday_close",weekday_close_M);

	               	  

	               	 var weekend_open_H = weekend_open.substring(0,parseInt(weekend_open.length/2));

	               	 console.log("weekend_open",weekend_open_H);

	               	 var weekend_open_M = weekend_open.substring(parseInt(weekend_open.length/2),weekend_open.length);

	               	 console.log("weekend_open",weekend_open_M);

	               	  

	               	 var weekend_close_H = weekend_close.substring(0,parseInt(weekend_close.length/2));

	               	 console.log("weekend_close",weekend_close_H);

	               	 var weekend_close_M = weekend_close.substring(parseInt(weekend_close.length/2),weekend_close.length);

	               	 console.log("weekend_close",weekend_close_M);

                    

                     var time = "평일 : " + weekday_open_H + ":" + weekday_open_M + "~" + weekday_close_H + ":"+weekday_close_M+"<br/>" 

                     + "주말 : " + weekend_open_H + ":" + weekend_open_M + "~" + weekend_close_H + ":"+ weekend_close_M;

                     

                     listitem = getDetailHospItem(item.hosp_name,item.dept_name,item.address,item.tel,time,lunchtime,item.cor_y, item.cor_x);

                     $('.search_list').html(listitem);

                  });

                  

                  kakao.maps.event.addListener(marker, 'mouseover', function() {

                  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다

                      infowindow.open(map, marker);

                  });

 

                  // 마커에 마우스아웃 이벤트를 등록합니다

                  kakao.maps.event.addListener(marker, 'mouseout', function() {

                      // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다

                      infowindow.close();

                  });

                  

                  var isSame = false;

                  for (var j = 0; j < markers.length; j++)

                  {

                     console.log(marker.getPosition().equals(markers[j].getPosition()));

                     //console.log(j,marker.getPosition().getLat() == markers[j].getLat(),marker.getPosition().getLat(),markers[j].getLat());

                     //if(marker.getPosition().getLat() == markers[j].getLat())

                     if(marker.getPosition().equals(markers[j].getPosition()))

                     {

                        isSame = true;

                     }

                     

                  }

                  

                  if(!isSame)

                  {

                     console.log("마커배열길이",jsonData.length,markers.length);

                     //if(data.count < markers.length)

                     marker.setMap(map);

                     console.log("중복이 아닌 마커",marker.getPosition());

                     markers.push(marker);

                     

                  }

                  else

                  {

                     console.log("중복 마커",marker.getPosition());

                     //marker.setMap(null);

                  }

               })

            },

            error:function(e){

               

            }

         });

      }

      function loadPharmacy(latitude,longitude)

      {

         $.ajax({

            url:"<c:url value='/Homespital/Map/Pharmacy.hst'/>",

            type:'get',

            datatype:'json',

            data:{"lat":latitude,"lng":longitude},

            beforeSend: function () {

               console.log("beforeSend");

               FunLoadingBarStart();

            },

            complete: function () {

               console.log("complete");

               FunLoadingBarEnd();

            },

            success:function(data){

               console.log(data);

               var jsonData = JSON.parse(data);

               console.log("연결성공", jsonData,typeof(jsonData));

               $.each(jsonData, function(i, item) {

                  

                  var marker = new kakao.maps.Marker({

                     //map : map,

                     position : new kakao.maps.LatLng(item.cor_y, item.cor_x),

                     image :  new kakao.maps.MarkerImage(

                           "<c:url value='/images/map/pharmacy_image/pharmacy_button.png'/>",

                             new kakao.maps.Size(35, 35))

                  });

                  

                  var iwContent = '<div class="infoWindowDiv">'+item.phar_name+'</div>';

                     

                  var infowindow = new kakao.maps.InfoWindow({

                      content : iwContent

                  });

                  kakao.maps.event.addListener(marker, 'click', function(){

                     console.log("modal",item,i)

                     console.log($('.info_wrap').hasClass('warp_invisible'));

                     console.log($('.info-toggle').hasClass('left_toggle'));

                     $(".reservation_info").hide();

                     if($('.info-toggle').hasClass('left_toggle')==true)

                     {

                        $('.info_wrap').removeClass('warp_invisible');

                        $('.info-toggle').removeClass('left_toggle');

                        

                     }

                     listitem = getDetailPharItem(item.phar_name,item.address,item.tel,item.cor_y, item.cor_x);

                     $('.search_list').html(listitem);

                  });

                  

                  kakao.maps.event.addListener(marker, 'mouseover', function() {

                    // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다

                      infowindow.open(map, marker);

                  });

 

                  // 마커에 마우스아웃 이벤트를 등록합니다

                  kakao.maps.event.addListener(marker, 'mouseout', function() {

                      // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다

                      infowindow.close();

                  });

                  

                  var isSame = false;

                  for (var j = 0; j < markers.length; j++)

                  {

                     console.log(marker.getPosition().equals(markers[j].getPosition()));

                     //console.log(j,marker.getPosition().getLat() == markers[j].getLat(),marker.getPosition().getLat(),markers[j].getLat());

                     //if(marker.getPosition().getLat() == markers[j].getLat())

                     if(marker.getPosition().equals(markers[j].getPosition()))

                     {

                        isSame = true;

                     }

                     

                  }

                  

                  if(!isSame)

                  {

                     console.log("마커배열길이",jsonData.length,markers.length);

                     //if(data.count < markers.length)

                     marker.setMap(map);

                     console.log("중복이 아닌 마커",marker.getPosition());

                     markers.push(marker);

                     

                  }

                  else

                  {

                     console.log("중복 마커",marker.getPosition());

                     //marker.setMap(null);

                  }

               })

            },

            error:function(e){

               

            }

         });

      }

      function storesByGeo(latitude,longitude)

      {

         $.ajax({

            url:"<c:url value='/Homespital/Map/Mask.hst'/>",

            type:'get',

            datatype:'json',

            data:{"lat":latitude,"lng":longitude},

            beforeSend: function () {

               console.log("beforeSend");

               FunLoadingBarStart();

            },

            complete: function () {

               console.log("complete");

               FunLoadingBarEnd();

            },

            success:function(data){

               var jsonData = JSON.parse(data)

               console.log("연결성공", jsonData,typeof(jsonData));

               $.each(jsonData.stores, function(i, item) {

                  var marker = new kakao.maps.Marker({

                     //map : map,

                     position : new kakao.maps.LatLng(item.lat, item.lng),

                     image :  new kakao.maps.MarkerImage(

                           translateRemainStatImage(item.remain_stat),

                             new kakao.maps.Size(35, 35))

                  });

                  

                  var iwContent = '<div class="infoWindowDiv">'+item.name+'</div>';

                     

                  var infowindow = new kakao.maps.InfoWindow({

                      content : iwContent

                  });

                  

                  kakao.maps.event.addListener(marker, 'mouseover', function() {

                    // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다

                      infowindow.open(map, marker);

                  });

 

                  // 마커에 마우스아웃 이벤트를 등록합니다

                  kakao.maps.event.addListener(marker, 'mouseout', function() {

                      // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다

                      infowindow.close();

                  });

                  

                  //kakao.maps.event.addListener(marker, 'click', makeOverListener(map));

                  kakao.maps.event.addListener(marker, 'click', function(){

                     console.log("modal",item,i)

                     $(".reservation_info").hide();

                     $('.body_title').html(item.name);

                     $('.content_addr').html(item.addr);

                     $('.content_stock').html(translateRemainStat(item.remain_stat));

                     $('.content_stock_count').html(translateRemainStatCount(item.remain_stat));

                     $('.content_type').html(translateType(item.type));

                     $('.content_stock_at').html('입고시간:'+item.stock_at);

                     $('.content_created_at').html('갱신시간:'+item.created_at);

                     $('#maskInfo-modal').modal('show');

                  });

                   

                  var isSame = false;

                  for (var j = 0; j < markers.length; j++)

                  {

                     console.log(marker.getPosition().equals(markers[j].getPosition()));

                     //console.log(j,marker.getPosition().getLat() == markers[j].getLat(),marker.getPosition().getLat(),markers[j].getLat());

                     //if(marker.getPosition().getLat() == markers[j].getLat())

                     if(marker.getPosition().equals(markers[j].getPosition()))

                     {

                        isSame = true;

                     }

                     

                  }

                  

                  if(!isSame)

                  {

                     console.log("마커배열길이",jsonData.count,markers.length);

                     //if(data.count < markers.length)

                     marker.setMap(map);

                     console.log("중복이 아닌 마커",marker.getPosition());

                     markers.push(marker);

                     

                  }

                  else

                  {

                     console.log("중복 마커",marker.getPosition());

                     //marker.setMap(null);

                  }

               });

            },

            error:function(e){

               console.log(e);

            }

         });

      }

      function loadCovidMap()

      {

         $.ajax({

            url:"<c:url value='/Homespital/Map/Covid.hst'/>",

            type:'get',

            datatype:'json',

            beforeSend: function () {

               console.log("beforeSend");

               FunLoadingBarStart();

            },

            complete: function () {

               console.log("complete");

               FunLoadingBarEnd();

            },

            success:function(data){

               var jsonData = JSON.parse(data);

               console.log("코로나 데이터",jsonData);

               $.each(jsonData, function(i, item) {

                  console.log("코로나 데이터",item);

                  console.log("코로나 데이터",item.LAT, item.LNG);

                  var coords = new kakao.maps.LatLng(item.LAT, item.LNG);

                         

                  var marker = new kakao.maps.Marker({

                      image :  new kakao.maps.MarkerImage(

                      "<c:url value='/images/map/corona_image/corona_button.png'/>",

                      new kakao.maps.Size(45, 45)),

                      position: coords

                  });

                  

                  

                  var iwContent = '<div class="infoWindowDiv">'+item.DATE_+" "+item.CONTENT+'</div>';

                  

                  var infowindow = new kakao.maps.InfoWindow({

                      content : iwContent

                  });

                  

                  kakao.maps.event.addListener(marker, 'mouseover', function() {

                    // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다

                      infowindow.open(map, marker);

                  });

 

                  // 마커에 마우스아웃 이벤트를 등록합니다

                  kakao.maps.event.addListener(marker, 'mouseout', function() {

                      // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다

                      infowindow.close();

                  });

                  

                  var isSame = false;

                  for (var j = 0; j < markers.length; j++)

                  {

                      console.log(marker.getPosition().equals(markers[j].getPosition()));

                      if(marker.getPosition().equals(markers[j].getPosition()))

                      {

                          isSame = true;

                      } 

                  }

                  if(!isSame)

                  {

                      marker.setMap(map);

                      console.log("중복이 아닌 마커",marker.getPosition());

                      markers.push(marker);

                  }

                  else

                  {

                      console.log("중복 마커",marker.getPosition());

                  }   

               });

            },

            error:function(e){

               

            }

         });

      }

      function loadHospitalList(search_val,search_dept)

      {

         $.ajax({

            url:"<c:url value='/Homespital/Map/hospitalList.hst'/>",

            type:'get',

            datatype:'json',

            data:{"search_keyword":search_val,"search_dept":search_dept},

            beforeSend: function () {

               console.log("beforeSend");

               FunLoadingBarStart();

            },

            complete: function () {

               console.log("complete");

               FunLoadingBarEnd();

            },

            success:function(data){

               var jsonData = JSON.parse(data);

               console.log("연결성공", jsonData,typeof(jsonData));

               var items = '';

               $.each(jsonData, function(i, item) {

                   console.log(item);

	               items += '<div class="search_item" onclick="searchItemClick(\''+item['ADDRESS']+'\',\''+search_dept+'\');">'+

	                          '<div class="search_item_detail">'+

	                             '<div class="detail_content">'+

	                                '<div class="content_title">'+

	                                   '<strong>'+item['HOSP_NAME']+'</strong>'+

	                                '</div>'+

	                                '<div class="content_body">'+

	                                   //item['ADDRESS']+

	                                   item['DEPT_NAME']+' '+ 

	                                   item['TEL']+

	                                '</div>'+

	                                '<div class="content_body">'+

	                                   item['ADDRESS']+

	                                '</div>'+

	                             '</div>'+

	                          '</div>'+

	                       '</div>'

               });

               $('.search_list').html(items);

            },

            error:function(e){

               

            }

         });

      }

      function loadPharmacyList(search_val)

      {

         $.ajax({

            url:"<c:url value='/Homespital/Map/pharmacyList.hst'/>",

            type:'get',

            datatype:'json',

            data:{"search_keyword":search_val},

            beforeSend: function () {

               console.log("beforeSend");

               FunLoadingBarStart();

            },

            complete: function () {

               console.log("complete");

               FunLoadingBarEnd();

            },

            success:function(data){

               var jsonData = JSON.parse(data);

               console.log("연결성공", jsonData,typeof(jsonData));

               var items = '';

               $.each(jsonData, function(i, item) {

                  console.log(item);

               

                  items += '<div class="search_item" onclick="searchItemClick(\''+item['ADDRESS']+'\');">'+

                           '<div class="search_item_detail">'+

                              '<div class="detail_content">'+

                                 '<div class="content_title">'+

                                    '<strong>'+item['PHAR_NAME']+'</strong>'+

                                 '</div>'+

                                 '<div class="content_body">'+

                                    item['TEL']+

                                 '</div>'+

                                 '<div class="content_body">'+

                                    item['ADDRESS']+

                                 '</div>'+

                              '</div>'+

                           '</div>'+

                        '</div>'

               });

               $('.search_list').html(items);

            },

            error:function(e){

               

            }

         });

      }

      function translateType(type)

      {

         switch (type) {

         case "01":

            return "약국"

         case "02":

            return "우체국"

         default:

            return "농협"

         }

      }

      

      function translateRemainStat(remain_stat)

      {

         switch (remain_stat) {

         case "plenty":

            return "충분"

         case "some":

            return "보통"

         case "few":

            return "부족"

         case "empty":

            return "재고x"

         default:

            return "판매X"

         }

      }

      

      function translateRemainStatImage(remain_stat)

      {

         switch (remain_stat) {

         case "plenty":

            return "<c:url value='/images/map/maskmap_image/mask_plenty.png'/>"

         case "some":

            return "<c:url value='/images/map/maskmap_image/mask_some.png'/>"

         case "few":

            return "<c:url value='/images/map/maskmap_image/mask_few.png'/>"

         default:

            return "<c:url value='/images/map/maskmap_image/mask_empty.png'/>"

         }

      }

      

      function translateRemainStatCount(remain_stat)

      {

         switch (remain_stat) {

         case "plenty":

            return "100개 이상"

         case "some":

            return "30개 이상 100개미만"

         case "few":

            return "2개 이상 30개 미만"

         case "empty":

            return "1개 이하"

         default:

            return "판매중지"

         }

      }

      

      var element_wrap = document.getElementById('search_wrap');

      

      function foldDaumPostcode() {

           // iframe을 넣은 element를 안보이게 한다.

           element_wrap.style.display = 'none';

       }

      function addressSearch()

      {

         if($('.info-toggle').hasClass('left_toggle')==true)

         {

            $('.info_wrap').removeClass('warp_invisible');

            $('.info-toggle').removeClass('left_toggle');

            

         }

         /*

         var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);

         new daum.Postcode({

               oncomplete: function(data) {

                   var addr = data.address; // 최종 주소 변수

 

                   // 주소 정보를 해당 필드에 넣는다.

                   document.getElementById("searchAddress").value = addr;

                  

                   // 주소로 상세 정보를 검색

                   geocoder.addressSearch(data.address, function(results, status) {

                       // 정상적으로 검색이 완료됐으면

                       if (status === kakao.maps.services.Status.OK) {

 

                           var result = results[0]; //첫번째 결과의 값을 활용

 

                           // 해당 주소에 대한 좌표를 받아서

                           var coords = new kakao.maps.LatLng(result.y, result.x);

                           // 지도를 보여준다.

                           mapContainer.style.display = "block";

                           map.relayout();

                           // 지도 중심을 변경한다.

                           map.setCenter(coords);

                           

                           element_wrap.style.display = 'none';

                           document.body.scrollTop = currentScroll;

                           //storesByGeo(result.y, result.x);

                           loadMapApi(result.y, result.x,apiStatus);

                       }

                   });

               },

               onresize : function(size) {

                   element_wrap.style.height = '500px';

               },

               width : '100%',

               height : '100%'

           }).embed(element_wrap);

         

         element_wrap.style.display = 'block';

         */

      }

      function currentPosition()

      {

         navigator.geolocation.getCurrentPosition(function(position) {

 

            removeMarker();

            lat = position.coords.latitude, // 위도

            lon = position.coords.longitude; // 경도

      

            console.log(lat);

            console.log(lon);

            //storesByGeo(lat,lon);

            loadMapApi(lat,lon,apiStatus);

            

            var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

      

            currentLatLng = locPosition;

            

            // 마커와 인포윈도우를 표시합니다

            displayMarker(locPosition);

      

         });

      }

      function searchAddrFromCoords(coords, callback) {

          geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         

      }

      function displayCenterInfo(result, status) {

          if (status === kakao.maps.services.Status.OK) {

              var infoDiv = document.getElementById('searchAddress');

 

              for(var i = 0; i < result.length; i++) {

                  // 행정동의 region_type 값은 'H' 이므로

                  if (result[i].region_type === 'H') {

                      infoDiv.value = result[i].address_name;

                      break;

                  }

              }

          }    

      }

      function searchItemClick(address,search_dept)

      {

         geocoder.addressSearch(address,function(result, status){

            if (status === kakao.maps.services.Status.OK) {

 

                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

   

                 console.log(apiStatus);

                 

                 removeMarker();

                 

                 map.setCenter(coords);

                 

                 currentLatLng = coords;

                 

                 if(circle != null)

                 	circle.setMap(null); 

                 

                 circle = new kakao.maps.Circle({

                	    center : coords,  // 원의 중심좌표 입니다 

                	    radius: 35, // 미터 단위의 원의 반지름입니다 

                	    strokeWeight: 5, // 선의 두께입니다 

                	    strokeColor: '#75B8FA', // 선의 색깔입니다

                	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다

                	    strokeStyle: 'dashed', // 선의 스타일 입니다

                	    fillColor: '#CFE7FF', // 채우기 색깔입니다

                	    fillOpacity: 0.7  // 채우기 불투명도 입니다   

                 }); 

 

                 circle.setMap(map); 

 

                 $.ajax({

                  url:"<c:url value='/Homespital/Map/detailView.hst'/>",

                  type:'get',

                  datatype:'json',

                  data:{"address":address,"apiStatus" : apiStatus,"search_dept":search_dept},

                  beforeSend: function () {

                     console.log("beforeSend");

                     FunLoadingBarStart();

                  },

                  complete: function () {

                     console.log("complete");

                     FunLoadingBarEnd();

                     loadMapApi(coords.getLat(),coords.getLng(),apiStatus);

                  },

                  success:function(data){

                     var jsonData = JSON.parse(data);

                     console.log("연결성공", jsonData,typeof(jsonData));

                     var item = '';

                     if(apiStatus == 0)

                     {

                        console.log("detailView:",jsonData[0]['WEEKDAY_OPEN'],jsonData[0]['LUNCHTIME']);

                        console.log("detailView:",jsonData[0]['WEEKDAY_OPEN'],jsonData[0]['LUNCHTIME']);

                        

                        var weekday_open = ((jsonData[0]['WEEKDAY_OPEN'] == undefined || jsonData[0]['WEEKDAY_OPEN'] == '0' || jsonData[0]['WEEKDAY_OPEN'].length == 0 || jsonData[0]['WEEKDAY_OPEN'] == '') ? '800' : jsonData[0]['WEEKDAY_OPEN'] + '')

                        var weekday_close = ((jsonData[0]['WEEKDAY_CLOSE'] == undefined || jsonData[0]['WEEKDAY_CLOSE'] == '0' || jsonData[0]['WEEKDAY_CLOSE'].length == 0 || jsonData[0]['WEEKDAY_CLOSE'] == '') ? '2200' : jsonData[0]['WEEKDAY_CLOSE'] + '')

                        var weekend_open = ((jsonData[0]['WEEKEND_OPEN'] == undefined || jsonData[0]['WEEKEND_OPEN'] == '0' || jsonData[0]['WEEKEND_OPEN'].length == 0 || jsonData[0]['WEEKEND_OPEN'] == '') ? '900' : jsonData[0]['WEEKEND_OPEN'] + '')

                        var weekend_close = ((jsonData[0]['WEEKEND_CLOSE'] == undefined || jsonData[0]['WEEKEND_CLOSE'] == '0' || jsonData[0]['WEEKEND_CLOSE'].length == 0 || jsonData[0]['WEEKEND_CLOSE'] == '') ? '1200' : jsonData[0]['WEEKEND_CLOSE'] + '')

                        var lunchtime = ((jsonData[0]['LUNCHTIME'] == undefined || jsonData[0]['LUNCHTIME'] == '0' || jsonData[0]['LUNCHTIME'].length == 0 || jsonData[0]['LUNCHTIME'] == '') ? '12:30~1:30' : jsonData[0]['LUNCHTIME'] + '')

 

                        console.log("weekday_open:",weekday_open);

                        console.log("weekday_close:",weekday_close);

                        console.log("weekend_open:",weekend_open);

                        console.log("weekend_close:",weekend_close);

                        console.log("lunchtime:",lunchtime);

                        

                        var weekday_open_H = weekday_open.substring(0,parseInt(weekday_open.length/2));

   	               	    console.log("weekday_open",weekday_open_H);

   	               	    var weekday_open_M = weekday_open.substring(parseInt(weekday_open.length/2),weekday_open.length);

   	               	    console.log("weekday_open",weekday_open_M);

   	               	  

   	               	    var weekday_close_H = weekday_close.substring(0,parseInt(weekday_close.length/2));

   	               	    console.log("weekday_close",weekday_close_H);

   	               	    var weekday_close_M = weekday_close.substring(parseInt(weekday_close.length/2),weekday_close.length);

   	               	 	console.log("weekday_close",weekday_close_M);

   	               	  

   	               	 	var weekend_open_H = weekend_open.substring(0,parseInt(weekend_open.length/2));

   	               	 	console.log("weekend_open",weekend_open_H);

   	               	 	var weekend_open_M = weekend_open.substring(parseInt(weekend_open.length/2),weekend_open.length);

   	               	 	console.log("weekend_open",weekend_open_M);

   	               	  

   	               	 	var weekend_close_H = weekend_close.substring(0,parseInt(weekend_close.length/2));

   	               	 	console.log("weekend_close",weekend_close_H);

   	               	 	var weekend_close_M = weekend_close.substring(parseInt(weekend_close.length/2),weekend_close.length);

   	               		console.log("weekend_close",weekend_close_M);

                       

                        var time = "평일 : " + weekday_open_H + ":" + weekday_open_M + "~" + weekday_close_H + ":"+weekday_close_M+"<br/>" 

                        + "주말 : " + weekend_open_H + ":" + weekend_open_M + "~" + weekend_close_H + ":"+ weekend_close_M;

                        

                        item = getDetailHospItem(jsonData[0]['HOSP_NAME'],jsonData[0]['DEPT_NAME'],jsonData[0]['ADDRESS'],jsonData[0]['TEL'],time,lunchtime,coords.getLat(),coords.getLng())

                        

                        /* console.log(markers,markers.length);

                        for(var i = 0; i < markers.length; i++)

                        {

                        	console.log("markers[i].getTitle()==jsonData[0]['HOSP_NAME']",markers[i].getTitle()==jsonData[0]['HOSP_NAME']);

                        	console.log("markers[i].getTitle()",markers[i].getTitle());

                     	} */

                     }

                     else if (apiStatus == 1)

                     {

                        console.log(jsonData[0]['PHAR_NAME']);

                        item = getDetailPharItem(jsonData[0]['PHAR_NAME'],jsonData[0]['ADDRESS'],jsonData[0]['TEL'],coords.getLat(),coords.getLng())

                     }

                     $(".reservation_info").show();

                     $('.search_list').html(item);

                  },

                  error:function(e){

                     

                  }

               });

                 

            }

         });

      }

 

      function getDetailHospItem(hospname,deptname,address,tel,time,detail,lat,lng)

      {

         item = '<div class="inner_top">'+

                  '<div class="inner_title_area">'+

                     '<div class="inner_title">'+

                        '<strong>'+hospname+'</strong>'+

                     '</div>'+

                     '<div class="inner_summary_info">'+

                        '<span>'+deptname+'</span>'+

                     '</div>'+

                  '</div>'+

                  '<div class="inner_btn_area">'+

                     '<div class="btn_direction">'+

                     '<a class="find_way_btn" href="https://map.kakao.com/link/to/'+hospname+','+lat+','+lng+'" style="color:blue" target="_blank">길찾기</a>'+

                        '<sec:authorize access="hasRole('ROLE_MEM')">'+

                        	'<button class="reservation_btn" onclick="reservation_show();">예약</button>'+

                        '</sec:authorize>'+

                     '</div>'+

                  '</div>'+

                  '<div class="inner_final_area">'+

	                  '<div class="inner_detail_address">'+

	                     '<img class="inner_final_icon" src="<c:url value='/images/map/detail_view/address.png'/>">'+

	                     '<div class="inner_end_box">'+address+'</div>'+

	                  '</div>'+

	                  '<div class="inner_detail_tel">'+

	                     '<img class="inner_final_icon" src="<c:url value='/images/map/detail_view/tel.png'/>">'+

	                     '<div class="inner_end_box">'+tel+'</div>'+

	                  '</div>'+

	                  '<div class="inner_detail_time">'+

	                     '<img class="inner_final_icon" src="<c:url value='/images/map/detail_view/time.png'/>">'+

	                     '<div class="inner_end_box">'+time+'</div>'+

	                  '</div>'+

	                  '<div class="inner_detail_time2">'+

	                     '<img class="inner_final_icon" src="<c:url value='/images/map/detail_view/detail_info.png'/>">'+

	                     '<div class="inner_end_box">'+

	                        '점심시간 '+detail+'<br/>'+

	                     '</div>'+

	                  '</div>'+

	               '</div>'+

               '</div>';

               

         return item;

      }

      

      function getDetailPharItem(pharname,address,tel,lat,lng)

      {

         item = '<div class="inner_top">'+

                  '<div class="inner_title_area">'+

                     '<div class="inner_title">'+

                        '<strong>'+pharname+'</strong>'+

                     '</div>'+

                     '<div class="inner_summary_info">'+

                        '<span>약국</span>'+

                     '</div>'+

                  '</div>'+

                  '<div class="inner_btn_area">'+

                     '<div class="btn_direction">'+

                        '<a class="find_way_btn" href="https://map.kakao.com/link/to/'+pharname+','+lat+','+lng+'" style="color:blue" target="_blank">길찾기</a>'+

                     '</div>'+

                  '</div>'+

                  '<div class="inner_final_area">'+

                     '<div class="inner_detail_address">'+

                        '<img class="inner_final_icon" src="<c:url value='/images/map/detail_view/address.png'/>">'+

                        '<div class="inner_end_box">'+address+'</div>'+

                     '</div>'+

                     '<div class="inner_detail_tel">'+

                        '<img class="inner_final_icon" src="<c:url value='/images/map/detail_view/tel.png'/>">'+

                        '<div class="inner_end_box">'+tel+'</div>'+

                     '</div>'+

                     '<div class="inner_detail_time">'+

                        '<img class="inner_final_icon" src="<c:url value='/images/map/detail_view/time.png'/>">'+

                        '<div class="inner_end_box">11:00~16:00</div>'+

                     '</div>'+

                     '<div class="inner_detail_time2">'+

                        '<img class="inner_final_icon" src="<c:url value='/images/map/detail_view/detail_info.png'/>">'+

                        '<div class="inner_end_box">'+

                           '영업시간 11:00~ 14:40 16:00~ 20:30<br/>'+

                           '휴무: 매주 월요일'+

                        '</div>'+

                     '</div>'+

                  '</div>'+

               '</div>';

         return item;

      }

      

      function reservation_show(){

         console.log($('#reservation-modal'));

         console.log($(".inner_title").text());

         console.log($(".inner_end_box:eq(0)").text());

         console.log($(".inner_summary_info").text());

         $('#modal_hosp_name').attr('value',$(".inner_title").text());

         $('#address').attr('value',$(".inner_end_box:eq(0)").text());

         $('#department').attr('value',$(".inner_summary_info").text());

         

         $.ajax({

             url:"<c:url value='/Homespital/Map/getDept.hst'/>",

             type:'get',

             datatype:'json',

             data:{"address":$('#address').val()},

             success:function(data){

                var jsonData = JSON.parse(data);

                console.log("연결성공", jsonData,typeof(jsonData));

                console.log(jsonData[0].DEPT_NAME);

                

                $('#dept_radio').empty();

                var option="";

                for(var i = 0; i < jsonData.length; i++)

	       		{

                	option += "<label class='keyboard disable radio-inline form-label'><input type='radio' name='optradio' value='"+jsonData[i].DEPT_NAME+"' required>"+jsonData[i].DEPT_NAME+"</label>";

	       		}

                $('#dept_radio').append(option);

                $('#symptom').empty();

                

                $('input[type=radio][name=optradio]').change(function() {

                    console.log($('input[type=radio][name=optradio]:checked').val());

                    if($('input[type=radio][name=optradio]:checked').val()=='기타')

                    {

                    	$('#symptom').empty();

                    	$('#symptom').append("<option>기타</option>");

                    }

                    else if($('input[type=radio][name=optradio]:checked').val()=='성형외과')

                    {

                    	$('#symptom').empty();

                    	$('#symptom').append("<option>성형</option>");

                    }

                    else

                    {

                    	$.ajax({

                            url:"<c:url value='/Homespital/Map/getSymptom.hst'/>",

                            type:'get',

                            datatype:'json',

                            data:{"dept_name":$('input[type=radio][name=optradio]:checked').val()},

                            success:function(data){

                            	var jsonData = JSON.parse(data);

                                console.log("연결성공", jsonData,typeof(jsonData));

                                console.log(jsonData[0].SYMPTOM);

                                

                                $('#symptom').empty();

                                var option="";

                                for(var i = 0; i < jsonData.length; i++)

                	       		{

                                	option += "<option>"+jsonData[i].SYMPTOM+"</option>";

                	       		}

                                $('#symptom').append(option);

                            },

                            error:function(e){

                                

                            }

                        });

                    }

                });

             },

             error:function(e){

                

             }

          });

         

         $.ajax({

             url:"<c:url value='/Homespital/Map/getAnotherRes.hst'/>",

             type:'get',

             datatype:'json',

             data:{"address":$('#address').val(),"email":$('#email').val()},

             success:function(data){

            	 var jsonData = JSON.parse(data);

                 console.log("연결성공", jsonData,typeof(jsonData));

                 if(jsonData.length > 0)

                 {

                	 if(confirm("이미 오늘 "+ jsonData[0].RES_DATE + " " + jsonData[0].RES_TIME +" 경 "+jsonData[0].HOSP_NAME+"에 예약하셨습니다.\r\n그래도 예약하시겠습니까?") == true){

                    	 $('#reservation-modal').modal('show');

                     }

                     else{

                         return ;

                     }

                 }

                 else

                 {

                	 $('#reservation-modal').modal('show');

                 }

                 

             },

             error:function(e){

            	 console.log("연결에러", e);

             }

         });

   

      }

      

      

 

      function changeApi(status)

      {

    	 $('.search_list').empty();

    	 $(".reservation_info").empty();

         apiStatus = status;

         console.log('상태',apiStatus);

         if(apiStatus==0)

         {

        	 $('#select_department').show();

        	 $('.close_wrap').hide();

         }

         else if(apiStatus==2)

         {

        	 $('.close_wrap').show();

         }

         else

         {

        	 $('#select_department').hide();

        	 $('.close_wrap').hide();

         }

         

         refreshMap();

      }

      function refreshMap()

      {

         removeMarker();

         var latlng = map.getCenter(); 

         //storesByGeo(latlng.getLat(),latlng.getLng());

         loadMapApi(latlng.getLat(),latlng.getLng(),apiStatus);

      }

      function removeMarker()

      {

         for(var i = 0; i < markers.length; i++ )

         {

            markers[i].setMap(null);

         }

         markers = [];

      }

      

      function FunLoadingBarStart() {

         console.log($('.load_wrap'),$('.load_img'));

         

         $('.load_wrap').show();

      }

      function FunLoadingBarEnd() {

         

         $('.load_wrap').hide();

         

      }

      

      function refreshReservation(item){

    	  console.log('item',item)

    	  if(apiStatus == 0)

    	  {

    		  $.ajax({

    	         	 url:"<c:url value='/Homespital/Map/Hospital/countReservation.hst'/>",

    	         	 type:'get',

    	              datatype:'json',

    	              data:{"address":item.address},

    	              success:function(data){

    	             	console.log(data); 

    	             	$(".reservation_info").empty();

    	             	createReservationTable(data);

    	             	$(".reservation_info").show();

    	              },

    	              error:function(e){

    	             	console.log(e); 

    	              }

    	      });

    	  }

    	 

      }

      

      function changeSelector(date,day) {

 

    	  

    	  $.ajax({

          	  url:"<c:url value='/Homespital/Map/getHospital.hst'/>",

          	  type:'get',

              datatype:'json',

              data:{"address":$('#address').val()},

              success:function(data){

              	  console.log(data); 

              	  var jsonData = JSON.parse(data);

              	  console.log(jsonData); 

              	  var weekday_open = jsonData.weekday_open != undefined ? jsonData.weekday_open : '800'

              	  var weekday_close = jsonData.weekday_close != undefined ? jsonData.weekday_close : '2200'

              	  var weekend_open = jsonData.weekend_open != undefined ? jsonData.weekend_open : '900'

              	  var weekend_close = jsonData.weekend_close != undefined ? jsonData.weekend_close : '1200'

              	  var lunchtime = (jsonData.lunchtime != undefined || jsonData.lunchtime != '0') ? jsonData.lunchtime : '12:30~1:30'

              	  

              	  console.log("weekday_open",weekday_open);

              	  

 

            	  $("#Hour").empty();

            	  

            	  console.log("weekday_open.length",weekday_open.length);

            	  var weekday_open_H = weekday_open.substring(0,parseInt(weekday_open.length/2));

            	  console.log("weekday_open",weekday_open_H);

            	  var weekday_open_M = weekday_open.substring(parseInt(weekday_open.length/2),weekday_open.length);

            	  console.log("weekday_open",weekday_open_M);

            	  

            	  var weekday_close_H = weekday_close.substring(0,parseInt(weekday_close.length/2));

            	  console.log("weekday_close",weekday_close_H);

            	  var weekday_close_M = weekday_close.substring(parseInt(weekday_close.length/2),weekday_close.length);

            	  console.log("weekday_close",weekday_close_M);

            	  

            	  var weekend_open_H = weekend_open.substring(0,parseInt(weekend_open.length/2));

            	  console.log("weekend_open",weekend_open_H);

            	  var weekend_open_M = weekend_open.substring(parseInt(weekend_open.length/2),weekend_open.length);

            	  console.log("weekend_open",weekend_open_M);

            	  

            	  var weekend_close_H = weekend_close.substring(0,parseInt(weekend_close.length/2));

            	  console.log("weekend_close",weekend_close_H);

            	  var weekend_close_M = weekend_close.substring(parseInt(weekend_close.length/2),weekend_close.length);

            	  console.log("weekend_close",weekend_close_M);

            	  

            	  console.log("lunchtime",lunchtime.split('~')[0])

            	  

            	  var lunchtime_start_H = lunchtime.split('~')[0].substring(0,lunchtime.split('~')[0].indexOf(':'));

            	  console.log("lunchtime",lunchtime_start_H)

            	  var lunchtime_start_M = lunchtime.split('~')[0].substring(lunchtime.split('~')[0].indexOf(':')+1,lunchtime.split('~')[0].length);

            	  console.log("lunchtime",lunchtime_start_M)

            	  

            	  console.log("lunchtime",lunchtime.split('~')[1])

            	  

            	  var lunchtime_end_H = lunchtime.split('~')[1].substring(0,lunchtime.split('~')[1].indexOf(':'));

            	  console.log("lunchtime",lunchtime_end_H)

            	  var lunchtime_end_M = lunchtime.split('~')[1].substring(lunchtime.split('~')[1].indexOf(':')+1,lunchtime.split('~')[1].length);

            	  console.log("lunchtime",lunchtime_end_M)

            	  

            	  console.log(day.getDate());

            	  console.log((date.getHours() + 24) % 12 || 12);

            	  console.log(date.getMinutes());

            	  

            	  var option

            	  

            	  if(day.getDate() != date.getDate())

            	  {

                	  $("#Minute").empty();

            		  

            		  option = "";

            		  for(var i = weekday_open_H; i <= weekday_close_H-1; i++)

            		  {

            			  if(i<10)

            			  {

            				  option += "<option>0"+i+"</option>";

            			  }

            			  else

            			  {

            				  option += "<option>"+i+"</option>";

            			  }

            		  }

            		  $('#Hour').append(option);

            		  

            		  option = "";

            		  for(var i = 0; i <= 50; i=i+10)

            		  {

            			  if(i==0)

            			  {

            				  option += "<option>0"+i+"</option>";

            			  }

            			  else

            			  {

            				  option += "<option>"+i+"</option>";

            			  }

            		  }

            		  

            		  $('#Minute').append(option);

            	  }

            	  else

            	  {

        	    	  $("#Minute").empty();

 

        			  option = ""; 

        			  var min = ((Math.floor(date.getMinutes() / 10)) * 10) + 10;

        			  console.log(min);

        			  

        			  if(min == 60)

        			  {

        				  for(var i = 0; i <= 50; i=i+10)

        	    		  {

        					  if(i==0)

        	    			  {

        	    				  option += "<option>0"+i+"</option>";

        	    			  }

        	    			  else

        	    			  {

        	    				  option += "<option>"+i+"</option>";

        	    			  }

        	    		  }

        				  console.log(option)

        				  $('#Minute').append(option);

        				  

        				  option = "";

        				  for(var i = date.getHours()+1; i <= weekday_close_H-1; i++)

        				  {

        					  if(i<10)

        	    			  {

        	    				  option += "<option>0"+i+"</option>";

        	    			  }

        	    			  else

        	    			  {

        	    				  option += "<option>"+i+"</option>";

        	    			  }

        				  }

        				  console.log(option)

        				  $('#Hour').append(option);

        			  }

        			  else

        			  {

        				  for(var i = min; i <= 50; i=i+10)

        	    		  {

        					  if(i==0)

        	    			  {

        	    				  option += "<option>0"+i+"</option>";

        	    			  }

        	    			  else

        	    			  {

        	    				  option += "<option>"+i+"</option>";

        	    			  }

        	    		  }

        				  console.log(option)

        				  $('#Minute').append(option);

        				  

        				  option = "";

        				  for(var i = date.getHours(); i <= weekday_close_H-1; i++)

        				  {

        					  if(i<10)

        	    			  {

        	    				  option += "<option>0"+i+"</option>";

        	    			  }

        	    			  else

        	    			  {

        	    				  option += "<option>"+i+"</option>";

        	    			  }

        				  }

        				  console.log(option)

        				  $('#Hour').append(option);

        			  } 

            	  }

 

            	  

              },

              error:function(e){

              	  console.log(e); 

              }

          });

    	  

	  }

      

      function filter_apply(value,idx)

      {

    	  for(var i = 0; i < markers.length; i++)

          {

    		  markers[i].setMap(null);

          }

    	  

    	  var deptMarkers = []

          console.log(value);

          

 

          console.log("선택한 index : " + idx);

          console.log(markers);

          

          deptStatus = idx;

          

          console.log(currentMarkers);

          

          for(var i = 0; i < currentMarkers.length; i++)

          {

        	  if(idx == 0 || idx == '전체')

        	  {

        		  for(var i = 0; i < markers.length; i++)

                  {

            		  markers[i].setMap(map);

                  }

        		  return;

        	  }

              else if(value == currentMarkers[i].dept_name)

        	  {

        		  console.log(currentMarkers[i])

        		  deptMarkers.push(currentMarkers[i])

        	  }

          }

          console.log(deptMarkers)

          

          for(var i = 0; i < markers.length; i++)

          {

        	  for(var j = 0; j < deptMarkers.length; j++)

              {

        		  console.log(markers[i].getTitle())

        		  console.log(deptMarkers[j].hosp_name)

        		  if(markers[i].getTitle() == deptMarkers[j].hosp_name)

            	  {

            		  console.log(markers[i])

            		  markers[i].setMap(map);

            	  }

              }

          }

      }

      

      //yy-mm-dd

      function parse(str) {

	   	  var y = str.substr(0, 2);

	   	  console.log(y);

	   	  var m = str.substr(5, 2);

	   	  console.log(m);

	   	  var d = str.substr(8, 2);

	   	  console.log(d);

	   	  return new Date(y,m-1,d);

      }

 

      

      function deg2rad(deg){

    	  return (deg * Math.PI / 180.0);

      }

      function rad2deg(rad){

    	  return (rad * 180 / Math.PI);

      }

      function distance(lat1, lon1, lat2, lon2, unit){

    	  var theta = lon1 - lon2;

    	  var dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

    	  

    	  dist = Math.acos(dist);

          dist = rad2deg(dist);

          dist = dist * 60 * 1.1515;

          

          if (unit == "kilometer") {

              dist = dist * 1.609344;

          } else if(unit == "meter"){

              dist = dist * 1609.344;

          }

 

          return dist;

      }

   }

 

</script>