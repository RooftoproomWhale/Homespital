<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body > div.col-sm-9.col-sm-offset-3.col-lg-10.col-lg-offset-2.main > div:nth-child(4) > div > div > div > table > tbody > tr > td {
	font-size: 1.2em;
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
				<li class="active">MainPage</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"> MainPage</h1>
			</div>
		</div><!--/.row-->
		
		<div class="panel panel-container">
			<div class="row">
				<div class="col-xs-4 col-md-4 col-lg-4 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-users color-blue"></em>
							<div class="large">${total}</div>
							<div class="text-muted">지금까지 홈스피탈로 받으신 예약</div>
						</div>
					</div>
				</div>
				<div class="col-xs-4 col-md-4 col-lg-4 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-users color-teal"></em>
							<div class="large">${today}</div>
							<div class="text-muted">오늘 예약 수</div>
						</div>
					</div>
				</div>
				<div class="col-xs-4 col-md-4 col-lg-4 no-padding">
					<div class="panel panel-red panel-widget ">
						<div class="row no-padding"><em class="fa fa-xl fa-users color-red"></em>
							<div class="large">${prev }</div>
							<div class="text-muted">내일 예약 수 </div>
						</div>
					</div>
				</div>
			</div><!--/.row-->
		</div>
		
		<div class="row">
                            <div class="col-lg-6 ">
                                <!-- TOP CAMPAIGN-->
                                <div class="top-campaign">
                                    <h3 class="title-3 m-b-30"> 가장 최근 예약자 정보 </h3>
                                    <div class="table-responsive">
                                        <table class="table table-top-campaign">
                                            <tbody>
                                                <tr>
                                                    <td>이름</td>
                                                    <td>${mem[0].mem_name}</td>
                                                </tr>
                                                <tr>
                                                    <td>email</td>
                                                    <td>${mem[0].mem_email}</td>
                                                </tr>
                                                <tr>
                                                    <td>핸드폰 번호</td>
                                                    <td>${mem[0].tel}</td>
                                                </tr>
                                                <tr>
                                                    <td>성별</td>
                                                    <td>${mem[0].gender}</td>
                                                </tr>
                                                <tr>
                                                    <td>나이</td>
                                                    <td>${mem[0].age}대</td>
                                                </tr>
                                                <tr>
                                                    <td>키</td>
                                                    <td>${mem[0].height}(cm)</td>
                                                </tr>
                                                <tr>
                                                    <td>몸무게</td>
                                                    <td>${mem[0].weight}(kg)</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--  END TOP CAMPAIGN-->
                            </div>	
                            <div class="col-lg-6 " style="">
                                <!-- TOP CAMPAIGN-->
                                <div class="top-campaign">
                                    <h3 class="title-3 m-b-30"> 병원 정보 </h3>
                                    <div class="table-responsive">
                                        <table class="table table-top-campaign">
                                            <tbody>
                                                <tr>
                                                    <td>병원명</td>
                                                    <td>${list[0].hosp_name }</td>
                                                </tr>
                                                <tr>
                                                    <td>과 종류</td>
                                                    <td>${list[0].dept_name }</td>
                                                </tr>
                                                <tr>
                                                    <td>평일 영업 시간</td>
                                                    <td>${list[0].weekday_open } ~ ${list[0].weekday_close }</td>
                                                </tr>
                                                <tr>
                                                    <td>휴일 영업 시간</td>
                                                    <td>${list[0].weekend_open } ~ ${list[0].weekend_close }</td>
                                                </tr>
                                                <tr>
                                                    <td>점심 시간</td>
                                                    <td>${list[0].lunchtime }</td>
                                                </tr>
                                                <tr>
                                                    <td>주소</td>
                                                    <td style="font-size: 0.9em">${list[0].address }</td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td style="font-size: 1.8em"> </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td style="font-size: 1.8em"> </td>
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