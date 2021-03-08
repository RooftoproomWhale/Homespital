<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003234675773) 68%, rgba(255, 206, 196, 0.5) 163%),linear-gradient(163deg, rgba(49, 146, 170, 0.07944489965716128) 86%, rgba(239, 112, 138, 0.5) 40%),linear-gradient(30deg, rgba(76, 79, 173, 0.6173675716587805) 22%, rgba(237, 106, 134, 0.5) 169%),linear-gradient(48deg, rgba(31, 85, 147, 0.7323890641868473) 64%, rgba(247, 126, 132, 0.5) 43%); background-blend-mode: overlay,multiply,color,normal;}
body > div.col-sm-9.col-sm-offset-3.col-lg-10.col-lg-offset-2.main > div:nth-child(4) > div > div > div > table > tbody > tr > td {
	font-size: 1.2em;

}
.panel-container{
height:200px;
margin-top: 65px;
margin-bottom: 30px;
}
#my-content{
height:100%
}
.breadcrumb{
display: none;}
.top-campaign{
padding-bottom: 150px}
@media screen and (max-width: 520px) {
.breadcrumb{display: ""}
}
</style>

</head>
<body>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">MyPage</li>
			</ol>
		</div><!--/.row-->
		
	
		
		<div class="panel panel-container">
			<div class="row" >
				<div class="col-xs-6 col-md-6 col-lg-6 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding"><i class="far fa-file-alt color-teal"></i>
							<div class="large">${count[0]["RESERCOUNT"]}</div>
							<div class="text-muted">진료 예약 현황</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-6 col-lg-6 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding"><i class="fas fa-pills color-blue"></i>
							<div class="large">${count[0]["PRECOUNT"]}</div>
							<div class="text-muted">복용 중인 약품수</div>
						</div>
					</div>
				</div>
<!-- 				<div class="col-xs-4 col-md-4 col-lg-4 no-padding"> -->
<!-- 					<div class="panel panel-red panel-widget "> -->
<!-- 						<div class="row no-padding"><em class="fa fa-xl fa-search color-red"></em> -->
<!-- 							<div class="large">5.2k</div> -->
<!-- 							<div class="text-muted">방문 수 </div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div><!--/.row-->
		</div>
		
		<div class="row" id="my-content">
            <div class="col-lg-6">
                <!-- TOP CAMPAIGN-->
                <div class="top-campaign">
                    <h3 class="title-3 m-b-30"> 개인정보 </h3>
                    <div class="table-responsive">
                        <table class="table table-top-campaign"></br></br>
                            <tbody>
                           
                                <tr>
                                    <td>이름</td>
                                    <td>${list[0]['mem_name']}</td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td>${list[0]['mem_email']}</td>
                                </tr>
                                <tr>
                                    <td>핸드폰 번호</td>
                                    <td>${list[0]['tel']}</td>
                                </tr>
                                <tr>
                                    <td>성별</td>
                                    <td>${list[0]['gender'] }</td>
                                </tr>
                                <tr>
                                    <td>나이</td>
                                    <td>${list[0]['age'] }대</td>
                                </tr>
                                <tr>
                                    <td>키</td>
                                    <td>${list[0]['height'] }cm</td>
                                </tr>
                                <tr>
                                    <td>몸무게</td>
                                    <td>${list[0]['weight'] }kg</td>
                                </tr>
                    
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--  END TOP CAMPAIGN-->
            </div>	
            <div class="col-lg-6" style="">
                <!-- TOP CAMPAIGN-->
                <div class="top-campaign">
                    <h3 class="title-3 m-b-30"> 질환 정보 </h3>
                    <div class="table-responsive">
                        <table class="table table-top-campaign"></br></br>
                            <tbody>
                                <tr>
                                    <td>자주 방문하는 병원</td>
                                    <td>${hosp_name}</td>
                                </tr>
                                <tr>
                                    <td>자주 방문하는 과</td>
                                    <td>${dept_name}</td>
                                </tr>
                                <tr>
                                    <td>가지고 있는 질환</td>
                                    <td>${ill_name}</td>
                                </tr>
                                <tr>
                                    <td>최근 방문 증상</td>
                                     <c:if test="${empty newres}" var="is">
                                     <td>최근 방문 증상이 없어요</td>
                                    </c:if>
                                    <c:if test="${not is}">
                                    <td>${newres[0]['SEL_SYMP']}</td>
                                    </c:if>
                                    
                                </tr>
                                <tr>
                                    <td>최근 방문 병원</td>
                                    <c:if test="${empty newres}" var="is">
                                    <td>최근 방문 병원이 없어요</td>
                                    </c:if>
        							<c:if test="${not is}">
                                    <td>${newres[0]['HOSP_NAME'] }</td>
                       				</c:if>
                                </tr>
                                <tr>
                                    <td>최근 처방 날짜</td>
                                    <c:if test="${empty count[0]['RESDATE']}" var="resis">
                                    <td>최근 처방이 없어요</td>
                                   </c:if>
                                    <c:if test="${not resis }">
                                    <td>${resdate}</td>
                                	</c:if>
                                </tr>
                                <tr>
                                    <td>가지고 있는 만성 질환</td>
                                    <td>${CHRONIC_ILL}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--  END TOP CAMPAIGN-->
            </div>		
<!--                             <div class="col-lg-3"> -->
<!--                                 <div class="au-card au-card--bg-blue au-card-top-countries m-b-30"> -->
<!--                                     <div class="au-card-inner"> -->
<!--                                         <div class="table-responsive"> -->
<!--                                             <table class="table table-top-countries"> -->
<!--                                                 <tbody> -->
<!--                                                     <tr> -->
<!--                                                         <td>United States</td> -->
<!--                                                         <td class="text-right">$119,366.96</td> -->
<!--                                                     </tr> -->
<!--                                                     <tr> -->
<!--                                                         <td>Australia</td> -->
<!--                                                         <td class="text-right">$70,261.65</td> -->
<!--                                                     </tr> -->
<!--                                                     <tr> -->
<!--                                                         <td>United Kingdom</td> -->
<!--                                                         <td class="text-right">$46,399.22</td> -->
<!--                                                     </tr> -->
<!--                                                     <tr> -->
<!--                                                         <td>Turkey</td> -->
<!--                                                         <td class="text-right">$35,364.90</td> -->
<!--                                                     </tr> -->
<!--                                                     <tr> -->
<!--                                                         <td>Germany</td> -->
<!--                                                         <td class="text-right">$20,366.96</td> -->
<!--                                                     </tr> -->
<!--                                                     <tr> -->
<!--                                                         <td>France</td> -->
<!--                                                         <td class="text-right">$10,366.96</td> -->
<!--                                                     </tr> -->
<!--                                                     <tr> -->
<!--                                                         <td>Australia</td> -->
<!--                                                         <td class="text-right">$5,366.96</td> -->
<!--                                                     </tr> -->
<!--                                                     <tr> -->
<!--                                                         <td>Italy</td> -->
<!--                                                         <td class="text-right">$1639.32</td> -->
<!--                                                     </tr> -->
<!--                                                 </tbody> -->
<!--                                             </table> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
		</div><!--/.row-->
	</div>	<!--/.main-->
</body>
</html>