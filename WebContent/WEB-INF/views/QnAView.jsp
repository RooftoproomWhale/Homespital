<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 수정/삭제/목록 버튼 사이 간격 주기 */
.btn-success {
	margin-right: 5px;
}

#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	margin-top: 1000px;
	background-color: #474747;
	height: 150px;
	top:350px;
}

.jumbotron {
	background-size: cover;
	text-shadow: black 0.2em 0.2em 0.2em;
	color: white;
}

img {
	width: 200px;
	height: 200px;
	float: right;
}
</style>
<script>
	$(function() {
		//현재 글번호에 대한 코멘트 목록을 가져오는 함수-Ajax로 처리 

		//페이지 로드시 코멘트 목록 뿌려주기]		
		/* showComments(); */

		//코멘트 입력 및 수정처리]
		$('#submit').click(function() {
			if ($(this).val() == '등록') {
				var action = "<c:url value='/QnA/InsertAnswer.hst'/>";
				var answer = $('#answer').val();
				var no = $('#no').html();
			} else {
				var action = "<c:url value='/QnA/comEdit.hst'/>";
				var answer = $('#answer').val();
				var no = $('#no').html();
			}

			//ajax로 요청]
			console.log("answer: " + answer);
			console.log("no: " + no);
			$.ajax({
				url : action,
				data : {
					"answer" : answer,
					"no" : no
				},
				dataType : 'text',
				type : 'get',
				success : function(data) {
					console.log("성공");
					console.log(data);

					window.location.href = "<c:url value='/QnA/QnAView.hst?no="
							+ no + "'/>";
				},
				error : function(request, status, error) {
					console.log('실패');
					alert("code = " + request.status
							+ " message = "
							+ request.responseText
							+ " error = " + error); // 실패 시 처리
				}
			});
		});
	});///$(function(){})
</script>
<title>Q&A</title>
</head>
<body>
	<div class="container" style="padding-top: 88px">
		<div class="row">
			<main id="main">
				<div class="page-header">
					<h2 style="color: black">Q&A</h2>
				</div>
				<p class="lead">[ 궁금하신 점이 있으신가요? ]</p>
				<br />
				<div class="container"
					style="box-shadow: 3px 3px 3px 5px rgba(227, 225, 225);">
					<img src="../img/111.jpg" align="right">
					<div class="jumbotron" style="background-color: white">
						<h1 style="color: #e0dada">Homespital</h1>
					</div>

					<div class="row">
						<div class="col-md-offset-2 col-md-8">
							<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
							<c:if test="${username == list[0].mem_email}" var="flag">
								<ul id="pillMenu" class="nav nav-pills" style="width: 205px; margin-bottom: 10px">
									<li><a
										href="<c:url value='/QnA/QnAToEditForm.hst?no=${list[0].qna_no}&title=${list[0].title}&content=${list[0].content}&q_date=${list[0].q_date}&mem_email=${list[0].mem_email}'/>"
										class="btn btn-primary">수정</a></li>
									<li><a
										href="<c:url value='/QnA/QnADelete.hst?no=${list[0].qna_no}'/>" class="btn btn-danger">삭제</a></li>
									<li><a href="<c:url value='/QnA/QnA.hst'/>"
										class="btn btn-primary">목록</a></br></li>
								</ul>
							</c:if>
					<div>
					<c:if test="${!flag }">
						<ul id="pillMenu" class="nav nav-pills"
							style="width: 205px; margin-bottom: 10px; align-content: right;" >
								<li><a href="<c:url value='/QnA/QnA.hst'/>"
									class="btn btn-primary">목록</a></br></li>
						</ul>
					</c:if>
						</div>
					</div>
					</div>
					
					<div class="row">
						<div class="col-md-offset-2 col-md-8">
							<table class="table table-bordered table-striped">
								<tr>
									<th class="col-md-2 text-center" style="color: black">번호</th>
									<td id="no">${list[0].qna_no}</td>
								</tr>
								<tr class="info">
									<th class="text-center" style="color: black">제목</th>
									<td>${list[0].title}</td>
								</tr>
								<tr>
									<th class="text-center" style="color: black">작성자</th>
									<td>${list[0].mem_email}</td>
								</tr>
								<tr class="info">
									<th class="text-center" style="color: black">등록일</th>
									<td>${list[0].q_date}</td>
								</tr>
								<tr>
									<th class="text-center" style="color: black">조회수</th>
									<td>${list[0].hit}</td>
								</tr>
								<tr class="info">
									<th class="text-center" colspan="2" style="color: black">내용</th>
								</tr>
								<tr>
									<td colspan="2">${list[0].content}</td>
								</tr>
								<a class="btn btn-default" 
									href="<c:url value='/QnA/QnAView.hst?no=${list[0].qna_no -1}'/>"><span class="glyphicon glyphicon-chevron-up"></span> 이전글</a>
								<a class="btn btn-default" 
									href="<c:url value='/QnA/QnAView.hst?no=${list[0].qna_no +1}'/>"><span class="glyphicon glyphicon-chevron-down"></span> 다음글</a>
							</table>
							</br>
						</div>
					</div>

					<div class="row">
						<div class="col-md-offset-2 col-md-8">
							<div class="text-center">
								<!-- 한줄 코멘트 입력 폼-->
								<h3 style="color: black;">Q&A 답변</h3><br>
								<form name="replyForm" method="post">
									<input type="hidden" name="cno" />
								</form>
								<div class="row" id="comments">
									<div class="col-md-10">
										<sec:authorize access="hasRole('ROLE_ADM')">
											<input type="text" class="form-control" id="answer"
												name="answer" placeholder="내용을 입력하세요." value="" />
										</sec:authorize>
									</div>
									<div class="col-md-2">
										<sec:authorize access="hasRole('ROLE_ADM')">
											<c:if test="${listA[0].answer_content == null}" var="item">
												<input class="btn btn-primary" id="submit" type="button"
													value="등록" />
											</c:if>
											<c:if test="${!item }">
												<input class="btn btn-primary" id="submit" type="button"
													value="수정" />
											</c:if>

											</br>
											</br>
										</sec:authorize>
									</div>
									<div class="row">
										<div class="page-header">
											<textarea class="info" cols="90px" rows="5px" id="answerText"
												disabled="disabled" style="background-color: white; border-color:black; font-size: 18px; text-align: center; padding-top:15px; padding-left:15px; padding-right: 15px; border-right: none; border-left:none ">${listA[0].answer_content}</textarea>
										</div>
									</div>
									</br>
									</br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
</html>

