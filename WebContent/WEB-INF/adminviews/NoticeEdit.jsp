<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<body class="animsition">
	<div class="page-container">
		<div class="section__content section__content--p30"
			style="padding-top: 50px">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-10 col-md-push-2">
						<div class="card">
							<div class="card-header">
								<strong>공지사항 수정</strong>
							</div>
							<div class="card-body card-block">
<!-- 								<form action="" method="post"  enctype="multipart/form-data" class="form-horizontal"> -->

									<div class="row form-group">
									
										<div class="col-12 col-md-12">
											<input type="text" id="text-input" name="text-input"
												placeholder="제목" class="form-control" value="원래내용"> <small
												class="form-text text-muted"></small>
										</div>
									</div>
									<div class="row form-group">
										<div class="col-12 col-md-12">
											<textarea name="textarea-input" id="textarea-input" rows="15"
												placeholder="내용" class="form-control">원래내용~</textarea>
										</div>
									</div>
									<div class="row form-group">
										<div class="col col-md-2">
											<label for="file-input" class=" form-control-label">파일첨부</label>
										</div>
										<div class="col-12 col-md-9">
											<input type="file" id="file-input" name="file-input"
												class="form-control-file">
										</div>
									</div>
									<div class="">
										<a href="<c:url value='/Homespital/Notice.hst'/>">
										<button type="submit" class="btn btn-primary btn-sm"
												style="position: absolute; right: 20px; bottom: 20px;">
												<i class="fa fa-dot-circle-o"></i> 수정
											</button></a>
									</div>
<!-- 								</form> -->
							</div>
								</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
</script>