<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script>
$(function() {
   
//    필터
   $("#filter").change(function(){
      var state = jQuery('#filter option:selected').val();
      if ( state == 'all' ) 
      {
         console.log(state);
         $.ajax({ 
            url: "<c:url value='/Admin/HosAuth.hst'/>",
            data: {
                  }, //넘길 파라미터 
            dataType: 'html',
            async: true, // true:비동기, false:동기 
            success: function(data){ 
               console.log('성공');
               window.location.href = "<c:url value='/Admin/HosAuth.hst'/>";
            },
            error:function(request,status,error){
               console.log('실패');
               alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
            } 
         });
      } 
      else if ( state == 'approved' )
      {
         console.log(state);
         $.ajax({ 
            url: "<c:url value='/Admin/HosAuthApp.hst'/>",
            data: {
                  }, //넘길 파라미터 
            dataType: 'html',
            async: true, // true:비동기, false:동기 
            success: function(data){ 
               console.log('성공');
               window.location.href = "<c:url value='/Admin/HosAuthApp.hst'/>";
               
            },
            error:function(request,status,error){
               console.log('실패');
               alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
            } 
         });
      }
      else
      {
         console.log(state);
         $.ajax({ 
            url: "<c:url value='/Admin/HosAuthWait.hst'/>",
            data: {
                  }, //넘길 파라미터 
            dataType: 'html',
            async: true, // true:비동기, false:동기 
            success: function(data){ 
               console.log('성공');
               window.location.href = "<c:url value='/Admin/HosAuthWait.hst'/>";
            },
            error:function(request,status,error){
               console.log('실패');
               alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
            } 
         });
      }
      
   });
   //필터 끝
   
   $(".table-data-feature .item:first-child").on('click', function(){
      
      var tr = $(this).parent().parent().parent();
      var td = tr.children();
      var email = td.eq(2).text().trim();
      console.log("승인 클릭", email);
         $.ajax({ 
            url: "<c:url value='/Admin/ApproveAuth.hst'/>",
            type: "get", //get, post 방식 
            dataType: 'html', //or xml or script or html or json or text
            data: {
                  "email" : email
                  }, //넘길 파라미터 
            async: true, // true:비동기, false:동기 
            success: function(data){
               console.log('성공');
               var newUrl = window.location.href;
               console.log(newUrl);
               window.location.href = newUrl;
            },
            error:function(request,status,error){
               console.log('실패');
               alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
            } 
         });
   });
   
$(".table-data-feature .item:last-child").on('click', function(){
      
      var tr = $(this).parent().parent().parent();
      var td = tr.children();
      var email = td.eq(2).text().trim();
      console.log("거절 클릭", email);
      $.ajax({ 
         url: "<c:url value='/Admin/DenyAuth.hst'/>",
         type: "get", //get, post 방식 
         dataType: 'html', //or xml or script or html 
         data: {
            "email" : email
            }, //넘길 파라미터 
         async: true, // true:비동기, false:동기 
         success: function(data){ 
//             console.log(data);
               console.log('성공');
               var newUrl = window.location.href;
               console.log(newUrl);
               window.location.href = newUrl;
         },
         error:function(request,status,error){
            console.log("에러");
            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
         } 
      });
         
   });
   
   $("#searchBtn").on("click", function(){
      var keyword = $("#search").val();
      console.log(keyword, "제휴 검색");
      $.ajax({ 
         url: "<c:url value='/Admin/HosAuthSearch.hst'/>",
         type: "get", //get, post 방식 
         dataType: 'html', //or xml or script or html 
         data: {
            "search_keyword" : keyword
            }, //넘길 파라미터 
         async: true, // true:비동기, false:동기 
         success: function(data){ 
            console.log(data);
               console.log('성공', keyword);
//                window.location.href = newUrl;
//                var renewURL = location.href;
               window.location.href = "<c:url value='/Admin/HosAuthSearch.hst?search_keyword="+keyword+"'/>";
         },
         error:function(request,status,error){
            console.log("에러");
            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
         } 
      });
   });
});
</script>
<body class="animsition">
   <div class="page-wrapper">
      <!-- PAGE CONTAINER-->
      <div class="page-container">
         <!-- HEADER DESKTOP-->
         <header class="header-desktop">
            <div class="section__content section__content--p30">
               <div class="container-fluid">
                  <div class="header-wrap">
                     <form class="form-header" method="">
                        <input class="au-input au-input--xl" type="text" id="search"
                           placeholder="병원명 검색" />
                        <button class="au-btn--submit" type="button" id="searchBtn">
                           <i class="zmdi zmdi-search"></i>
                        </button>
                     </form>
                  </div>
               </div>
            </div>
         </header>
         <!-- END HEADER DESKTOP-->

         <!-- MAIN CONTENT-->
         <div class="main-content">
            <div class="section__content section__content--p30">
               <div class="container-fluid">
                  <div class="row">
                     <div class="col-md-12">
                        <!-- DATA TABLE -->
                        <h3 class="title-5 m-b-35">Authorization</h3>
                           <div class="table-data__tool">
                               <div class="table-data__tool-left">
                                   <div class="rs-select2--light rs-select2--sm">
                                       <select class="js-select2" name="filter" id="filter">
                                           <option value = "all">All</option>
                                           <option selected="selected" value="approved">승인됨</option>
                                           <option value="standBy">대기중</option>
                                       </select>
                                       <div class="dropDownSelect2"></div>
                                   </div>
                               </div>
                           </div>
                        <div class="table-responsive table-responsive-data2">
                           <table class="table table-data2">
                              <thead>
                                 <tr>
                                    <th><label class="au-checkbox"> <input
                                          type="checkbox"> <span class="au-checkmark"></span>
                                    </label></th>
                                    <th>Name</th>
                                    <th>Id</th>
                                    <th>Tel</th>
                                    <th>ApprovedDate</th>
                                    <th>Status</th>
                                    <th></th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:if test="${empty list}" var="isEmpty">
                                    <tr>
                                       <td colspan="4">제휴 신청이 없습니다.</td>
                                    </tr>
                                 </c:if>
                                 <c:if test="${not isEmpty}">
                                    <c:forEach items="${list}" var="item" varStatus="loop">
                                       <tr class="tr-shadow">
                                          <td><label class="au-checkbox"> <input
                                                type="checkbox"> <span class="au-checkmark"></span>
                                          </label></td>
                                          <td>${item.hosp_name }</td>
                                          <td><span class="block-email">${item.mem_email }</span></td>
                                          <td class="desc">${item.tel }</td>
                                          <td>${item.approved_date }</td>
                                          <td><c:if test="${item.auth == '승인대기중'}">
                                                <span class="status--denied">${item.auth }</span>
                                             </c:if> <c:if test="${item.auth == '제휴승인됨'}">
                                                <span class="status--process">${item.auth }</span>
                                             </c:if> <c:if test="${item.auth == '제휴거절됨'}">
                                                <span class="status--denied">${item.auth }</span>
                                             </c:if></td>
                                          <td><c:if test="${item.auth == '승인대기중'}">
                                                <div class="table-data-feature">
                                                   <button class="item" data-toggle="tooltip"
                                                      data-placement="top" title="승인">
                                                      <i class="zmdi zmdi-mail-send"></i>
                                                   </button>
                                                   <button class="item" data-toggle="tooltip"
                                                      data-placement="top" title="거절">
                                                      <i class="zmdi zmdi-delete"></i>
                                                   </button>
                                                </div>
                                             </c:if></td>
                                       </tr>
                                       <tr class="spacer"></tr>
                                    </c:forEach>
                                 </c:if>
                              </tbody>
                           </table>
                        </div>
                        <!-- END DATA TABLE -->
                     </div>
                  </div>
               </div>
               <div style="display: block; text-align: center;">
                   <c:if test="${paging.startPage != 1 }">
                     <a href="<c:url value='/Admin/HosAuth.hst?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">&lt;</a> 
                  </c:if> 
                   <c:forEach begin="${paging.startPage }" end="${paging.endPage }" 
                     var="p"> 
                     <c:choose> 
                        <c:when test="${p == paging.nowPage }"> 
                            <b>${p }</b> 
                         </c:when>
                        <c:when test="${p != paging.nowPage }"> 
                            <a 
                               href="<c:url value='/Admin/HosAuth.hst?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
                         </c:when> 
                     </c:choose> 
                   </c:forEach> 
                  <c:if test="${paging.endPage != paging.lastPage}"> 
                  <a 
                         href="<c:url value='/Admin/HosAuth.hst?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
                  </c:if> 
                </div> 
            </div>
         </div>
      </div>
   </div>
         
			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<!-- DATA TABLE -->
								<h3 class="title-5 m-b-35">Authorization</h3>
								<!--                                 <div class="table-data__tool"> -->
								<!--                                     <div class="table-data__tool-left"> -->
								<!--                                         <div class="rs-select2--light rs-select2--sm"> -->
								<!--                                             <select class="js-select2" name="time"> -->
								<!--                                                 <option selected="selected">All</option> -->
								<!--                                                 <option value="">Authorized</option> -->
								<!--                                                 <option value="">Denied</option> -->
								<!--                                             </select> -->
								<!--                                             <div class="dropDownSelect2"></div> -->
								<!--                                         </div> -->
								<!--                                     </div> -->
								<!--                                 </div> -->
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th><label class="au-checkbox"> <input
														type="checkbox"> <span class="au-checkmark"></span>
												</label></th>
												<th>Name</th>
												<th>Id</th>
												<th>Tel</th>
												<th>ApprovedDate</th>
												<th>Status</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty list}" var="isEmpty">
												<tr>
													<td colspan="4">제휴 신청이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${not isEmpty}">
												<c:forEach items="${list}" var="item" varStatus="loop">
													<tr class="tr-shadow">
														<td><label class="au-checkbox"> <input
																type="checkbox"> <span class="au-checkmark"></span>
														</label></td>
														<td>${item.hosp_name }</td>
														<td><span class="block-email">${item.mem_email }</span></td>
														<td class="desc">${item.tel }</td>
														<td>${item.approved_date }</td>
														<td><c:if test="${item.auth == '승인대기중'}">
																<span class="status--denied">${item.auth }</span>
															</c:if> <c:if test="${item.auth == '제휴승인됨'}">
																<span class="status--process">${item.auth }</span>
															</c:if> <c:if test="${item.auth == '제휴거절됨'}">
																<span class="status--denied">${item.auth }</span>
															</c:if></td>
														<td><c:if test="${item.auth == '승인대기중'}">
																<div class="table-data-feature">
																	<button class="item" data-toggle="tooltip"
																		data-placement="top" title="승인">
																		<i class="zmdi zmdi-mail-send"></i>
																	</button>
																	<button class="item" data-toggle="tooltip"
																		data-placement="top" title="거절">
																		<i class="zmdi zmdi-delete"></i>
																	</button>
																</div>
															</c:if></td>
													</tr>
													<tr class="spacer"></tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
								<!-- END DATA TABLE -->
							</div>
						</div>
					</div>
					<div style="display: block; text-align: center;">
 						<c:if test="${paging.startPage != 1 }">
							<a href="<c:url value='/Admin/HosAuth.hst?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">&lt;</a> 
						</c:if> 
 						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" 
							var="p"> 
							<c:choose> 
								<c:when test="${p == paging.nowPage }"> 
 									<b>${p }</b> 
 								</c:when>
								<c:when test="${p != paging.nowPage }"> 
 									<a 
 										href="<c:url value='/Admin/HosAuth.hst?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
 								</c:when> 
							</c:choose> 
 						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}"> 
						<a 
 								href="<c:url value='/Admin/HosAuth.hst?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
						</c:if> 
 					</div> 
				</div>
			</div>
		</div>
	</div>
</body>

</html>
<!-- end document-->