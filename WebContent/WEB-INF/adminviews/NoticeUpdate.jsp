<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<style>
#footer 
{ 
  position: absolute; 
  width:100%; 
  left:0px; 
   bottom:0px; 
   background-color:#474747;
   height: 150px 
} 
</style>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>Insert title here</title>
<script>

$(function() {
	
	var no;
	var title;
	var content;
	
	$('#notice').on('click', function(){
		no = $('#no').val();
		title = $('#title').val();
 		content = $('#summernote').val();
		console.log(content);
		$.ajax({
			url: "<c:url value='/Admin/NoticeUpdate.hst'/>",
			data: {
				"no" : no,
				"title" : title,
				"content" : content
					}, 
			dataType: 'html',
			async: true,
			success: function(data){ 
				console.log('성공');
				window.location.href = "<c:url value='/Admin/NoticeDetail.hst?no="+no+"'/>"; 
			},
			error:function(request,status,error){
				console.log('실패');
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
			} 
		});
	});
});

$(document).ready(function() {
	$('#summernote').summernote({
		placeholder : 'content',
		minHeight : 370,
		maxHeight : null,
		focus : true,
		lang : 'ko-KR'
	});
});
</script>
</head>
<body>
	<div class="container" style="padding-top: 88px;">
		<div class="row">
			<h2 style="text-align: center;">글 수정</h2><br/><br/>
			<div style="width: 60%; margin: auto;">
				<form method="post" action="/write">
					<input type="text" id="no" name="no" style="width: 20%;" placeholder="글번호" disabled="disabled" value="${no}" /><br> 
					<input type="text" id="title" name="title" style="width: 40%;" placeholder="제목" value="${title}"/> <br><br/>
					<textarea id="summernote" name="content" class="summernote">${content}</textarea>
					<input id="notice" type="button" value="글 수정" style="float: right;" />
				</form>
			</div>
		</div>
	</div>
</body>
<script>
function goWrite(frm) {
	var writer = frm.writer.value;
	var title = frm.title.value;
	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (writer.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
</html>