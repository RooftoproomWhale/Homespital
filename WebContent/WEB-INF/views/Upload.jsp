<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	
body{
	padding-top: 100px;
}

h1 {
	font-weight: bold;
	margin: 0;
}

h2 {
	text-align: center;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}


button {
	border-radius: 20px;
	border: 1px solid #FF4B2B;
	background-color: #FF4B2B;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	position: relative;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 480px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@
keyframes show { 0%, 49.99% {
	opacity: 0;
	z-index: 1;
}

50%,
100%
{
opacity
:
 
1;
z-index
:
 
5;
}
}
.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container {
	transform: translateX(-100%);
}

.overlay {
	background: #FF416C;
	background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
	background: linear-gradient(to right, #FF4B2B, #FF416C);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}
<!--이미지 업로드-->
.button_outer {
	background: #83ccd3;
	border-radius: 30px;
	text-align: center;
	height: 50px;
	width: 200px;
	display: inline-block;
	transition: .2s;
	position: relative;
	overflow: hidden;
}

.btn_upload {
	padding: 17px 30px 12px;
	color: #fff;
	text-align: center;
	position: relative;
	display: inline-block;
	overflow: hidden;
	z-index: 3;
	white-space: nowrap;
}

.btn_upload input {
	position: absolute;
	width: 100%;
	left: 0;
	top: 0;
	width: 100%;
	height: 105%;
	cursor: pointer;
	opacity: 0;
}

.file_uploading {
	width: 100%;
	height: 10px;
	margin-top: 20px;
	background: #ccc;
}

.file_uploading .btn_upload {
	display: none;
}

.processing_bar {
	position: absolute;
	left: 0;
	top: 0;
	width: 0;
	height: 100%;
	border-radius: 30px;
	background: #83ccd3;
	transition: 3s;
}

.file_uploading .processing_bar {
	width: 100%;
}

.success_box {
	display: none;
	width: 50px;
	height: 50px;
	position: relative;
}

.success_box:before {
	content: '';
	display: block;
	width: 9px;
	height: 18px;
	border-bottom: 6px solid #fff;
	border-right: 6px solid #fff;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	position: absolute;
	left: 17px;
	top: 10px;
}

.file_uploaded .success_box {
	display: inline-block;
}

.file_uploaded {
	margin-top: 0;
	width: 50px;
	background: #83ccd3;
	height: 50px;
}

.uploaded_file_view {
	max-width: 300px;
	margin: 40px auto;
	text-align: center;
	position: relative;
	transition: .2s;
	opacity: 0;
	border: 2px solid #ddd;
	padding: 15px;
}

.file_remove {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	display: block;
	position: absolute;
	background: #aaa;
	line-height: 30px;
	color: #fff;
	font-size: 12px;
	cursor: pointer;
	right: -15px;
	top: -15px;
}

.file_remove:hover {
	background: #222;
	transition: .2s;
}

.uploaded_file_view img {
	max-width: 100%;
}

.uploaded_file_view.show {
	opacity: 1;
}

.error_msg {
	text-align: center;
	color: #f00
}
</style>

<div class="container" id="container">
	<div class="form-container sign-in-container">
		<form enctype="multipart/form-data" action='<c:url value="/mapping/mapping.hst"/>' method="post">
			<h1>처방전 등록</h1>
			<span>처방전 사진을 등록하세요</span>
			
			<input type="file" name="filename"> Upload Image
			
			<input type="submit" value="등록">
		</form>
	</div>
	<div class="form-container sign-up-container">
		<form action="#">
			<h1>직접 입력</h1>
			
			<span>복용중인 약을 등록하세요</span>
			<input type="text" placeholder="약품명" />
			<input type="date" placeholder="진료일자" />
			<input type="text" placeholder="1회 복용량" />
			<input type="text" placeholder="1일 복용횟수" />
			<input type="text" placeholder="복용기간" />
			
			<button>등록</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>처방전 등록</h1>
				<p>처방전 사진을 등록해 주세요</p>
				<button class="ghost" id="signIn">처방전 등록</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>복약 등록</h1>
				<p>사진이 없을경우 직접 입력하세요</p>
				<button class="ghost" id="signUp">직접 입력</button>
			</div>
		</div>
	</div>
</div>






<script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});


var btnUpload = $("#upload_file"),
btnOuter = $(".button_outer");
btnUpload.on("change", function(e){
	var ext = btnUpload.val().split('.').pop().toLowerCase();
	if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
		$(".error_msg").text("Not an Image...");
	} 
	else {
		$(".error_msg").text("");
		btnOuter.addClass("file_uploading");
		setTimeout(function(){
			btnOuter.addClass("file_uploaded");
		},3000);
		var uploadedFile = URL.createObjectURL(e.target.files[0]);
		setTimeout(function(){
		$("#uploaded_view").append('<img src="'+uploadedFile+'" />').addClass("show");
		},3500);
}
});
$(".file_remove").on("click", function(e){
	$("#uploaded_view").removeClass("show");
	$("#uploaded_view").find("img").remove();
	btnOuter.removeClass("file_uploading");
	btnOuter.removeClass("file_uploaded");
});

</script>
