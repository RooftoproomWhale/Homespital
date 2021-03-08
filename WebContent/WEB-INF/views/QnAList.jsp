<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	margin-top:1000px;
	background-color: #474747;
	height: 150px;
	top:100px;
}
.jumbotron{ 
  	background-size: cover;
  	text-shadow: black 0.2em 0.2em 0.2em;
  	color:white;
}
table {
    width: 100%;
    border: 1px solid #444444;
}
img{
	width:200px;
	height:200px;
	float:right;
}
</style>
<title>Q&A</title>
</head>
<body>
	<div class="container" style="padding-top: 100px; box-shadow: 20em;">
		<div class="row">
			<main id="main">
				<div class="col-md-offset-2 col-md-3">
					<img src="../img/222.PNG">
				</div>
				</br>
				<div class="container" style="box-shadow:3px 3px 3px 5px rgba(227, 225, 225); ">
					<div class="jumbotron" style="background-color: white;">
						<h1 style="color: #e0dada"> Homespital </h1>
					</div>
					<div class="row" style="margin-bottom: 10px">
						<div class="col-md-12 text-right" style="padding-top:60px">
						<sec:authorize access="hasRole('ROLE_MEM')">
							<a href="<c:url value='/QnA/ToInsertForm.hst'/>" class="glyphicon glyphicon-pencil">작성하기</a>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_HOS')">
							<a href="<c:url value='/QnA/ToInsertForm.hst'/>" class="glyphicon glyphicon-pencil">작성하기</a>
						</sec:authorize>
						</div>
					</div></br>
					<div class="row">
						<div class="col-md-12">
							<table id="table"class="table table-bordered table-hover text-center">
								<tr class="info">
									<!-- 각 컬럼의 폭은 <td>계열에 class="col-*-*"추가 -->
									<th class="col-md-1 text-center" style="color: black">번호</th>
									<th class="text-center" style="color: black">제목</th>
									<th class="col-md-1 text-center" style="color: black">작성자</th>
									<th class="col-md-2 text-center" style="color: black">등록일</th>
									<th class="col-md-1 text-center" style="color: black">조회수</th>
								</tr>
								<c:if test="${empty list}" var="isEmpty">
									<tr>
										<td colspan="4">등록된 게시물이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not isEmpty}">
									<c:forEach items="${list}" var="item" varStatus="loop">
										<tr class="line">
											<!-- 각 컬럼의 폭은 <td>계열에 class="col-*-*"추가 -->
											<td>${item.qna_no}</td>
											<td class="text-left"><a href='<c:url value="/QnA/QnAView.hst?no=${item.qna_no}"/>'>${item.title}</a></td>
											<td>${item.mem_email}</td>
											<td>${item.q_date}</td>
											<td>${item.hit}</td>
										</tr>
									</c:forEach>
								</c:if>
							</table></br></br></br>
						</div>
						<!-- column -->
					</div>
					<!-- row -->
					<!-- 페이징 -->
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a href="<c:url value='/QnA/QnA.hst?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p}</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="<c:url value='/QnA/QnA.hst?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a href="<c:url value='/QnA/QnA.hst?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
						</c:if>
					</div></br></br>
					<!-- 검색용 UI -->
				</div>
			</main>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</html>