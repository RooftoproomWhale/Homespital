<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- SummerNote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src='<c:url value="/js/summernote/lang/summernote-ko-KR.js"/>'></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	margin-top: 1000px;
	background-color: #474747;
	height: 150px
}
.jumbotron{
  background-size: cover;
  text-shadow: black 0.2em 0.2em 0.2em;
  color:white;
}
img{
	width:200px;
	height:200px;
	float:right;
}
</style>
<script>
$(function() {

$('#next').on('click', function(){

	var user; 
	var content;
	var title;

	title = $('#text-input').val();
	content = $('#summernote').val();
	user = $('#user').val();
	
	console.log("user"+user);
	console.log("content"+content);
	console.log("title"+title);
	
	$.ajax({
			url: "<c:url value='/QnA/QnaInsert.hst'/>",
			data: {
				"title" : title,
				"content" : content,
				"user" : user
					}, //넘길 파라미터 
			dataType: 'html',
			async: true, // true:비동기, false:동기 
			success: function(data){ 
				console.log('성공');

				window.location.href = "<c:url value='/QnA/QnA.hst'/>";
				
			},
			error:function(request,status,error){
				console.log('실패');
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			} 
		});
	});
});
</script>
</head>
</html>
<body>
	<div class="container" style="padding-top: 88px;">
		<div class="row">
			<main id="main">
				<div class="page-header" >
					<h2 style="color: black">Q&A</h2>
				</div>
				<p>[ 궁금하신 점이 있으신가요? ]</p>
				<br />
				<div class="container" style="box-shadow:3px 3px 3px 5px rgba(227, 225, 225); ">
				<img src="../img/111.jpg" align="right">
					<div class="jumbotron" style="background-color: white">
						<h1 style="color: #e0dada"> Homespital </h1>
					</div>
					<div style="width: 60%; margin: auto;">
						<form>
							<input type="hidden" id="user" value="${userId}" />
							<input type="text" id="text-input" name="title" style="width: 40%;" placeholder="제목" />
							<br> <br>
							<textarea id="summernote" name="content"></textarea>
							<input id="next" type="button" value="글 작성" class="btn btn-primary" style="float: right;" />
						</form></br></br></br>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>