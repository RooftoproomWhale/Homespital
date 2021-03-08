<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<script>

</script>
<html lang="en">
<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">
                                <input class="au-input au-input--xl" type="text" name="search" placeholder="주소 검색" />
                                <button class="au-btn--submit" type="submit">
                                    <i class="zmdi zmdi-search"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </header>
            <!-- END HEADER DESKTOP-->
			<form action='<c:url value="/Admin/Corona_Map_Edit.hst"/>' method="post" class="form-horizontal" style="margin-left: 20px; margin-top: 150px;">
			<c:forEach var="item" items="${list }" varStatus="loop">
			<div class="row form-group">
				일련번호
				<div class="col col-md-3">
					<input type="text"  class="form-control" name="person${loop.index }" value="${item.person}" readonly="readonly" style="background-color: #d6d6d6;">
				</div>
				날짜
				<div class="col col-md-3">
					<input type="text" class="form-control" name="date_${loop.index }" value="${item.date_}" readonly="readonly" style="background-color: #d6d6d6;">
				</div>
				주소
				<div class="col col-md-3">
					<input type="text" class="form-control" name="content${loop.index }" value="${item.content}" tabindex="${loop.index+1 }">
				</div>
			</div>
			</c:forEach>
				<div class="col col-md-10">
					<button id="payment-button" type="submit" onclick="ok()"
						class="btn btn-lg btn-info btn-block">
						<span id="payment-button-amount">수정</span> <span
							id="payment-button-sending" style="display: none;">Sending…</span>
					</button>
				</div>
			</form>
		</div>
</div>
</body>

</html>
<!-- end document-->
<script>
function ok() {
	alert('수정 성공');
}
</script>