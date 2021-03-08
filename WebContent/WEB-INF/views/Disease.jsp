<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.24/themes/base/jquery-ui.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
#console, #cons {
	border: 1px solid #ccc;
}

#console li :not (:last-child ), #cons li:not (:last-child ){
	border-bottom: 1px solid #ccc
}

a {
	color: black;
}

/*메인*/
* {
  box-sizing: border-box;
  outline: none;
}

:root {
  --bg-color: #f5f8ff;;
  --main-color: #353536;
  --secondary-color: #8e92a4;
  --main-text-color: #5d606b;
  --secondary-dark-color: #9496a5;
  --tag-color-one: #e0fbf6;
  --tag-color-text-one: #58c2a9;
  --tag-color-two: #ece7fe;
  --tag-color-text-two: #8972f3;
  --tag-color-three: #fde7ea;
  --tag-color-text-three: #e77f89;
  --tag-color-four: #f7f8fc;
  --tag-color-text-four: #a0a6b5;
  --checkbox-color: #009e90;
  --button-color: #49beb7;
  --box-color: #fff1d6;
  --box-color-2: #d3e6ff;
  --box-color-3: #ffd9d9;
  --box-color-4: #daffe5;
  --task-color: #777982;
}

%flex {
  display: flex;
  align-items: center;
}

body {
  margin: 0;
  @extend %flex;
  justify-content: center;
  flex-direction: column;
  overflow: auto;
  width: 100%;
  height: 100vh;
  padding: 20px;
  font-family: 'DM Sans', sans-serif;;
  font-size: 12px;
  background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003234675773) 68%, rgba(255, 206, 196, 0.5) 163%),linear-gradient(163deg, rgba(49, 146, 170, 0.07944489965716128) 86%, rgba(239, 112, 138, 0.5) 40%),linear-gradient(30deg, rgba(76, 79, 173, 0.6173675716587805) 22%, rgba(237, 106, 134, 0.5) 169%),linear-gradient(48deg, rgba(31, 85, 147, 0.7323890641868473) 64%, rgba(247, 126, 132, 0.5) 43%); background-blend-mode: overlay,multiply,color,normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

button { 
  border: none; 
  background: none;
  cursor: pointer;
}

.task-manager {
top:41px;
  display: flex;
  justify-content: space-between;
  width: 100%;
  max-width: 1200px;
  height: 91vh;
  max-height: 900px;
  background: #fff;
  border-radius: 4px;
  box-shadow:
  0 0.3px 2.2px rgba(0, 0, 0, 0.011),
  0 0.7px 5.3px rgba(0, 0, 0, 0.016),
  0 1.3px 10px rgba(0, 0, 0, 0.02),
  0 2.2px 17.9px rgba(0, 0, 0, 0.024),
  0 4.2px 33.4px rgba(0, 0, 0, 0.029),
  0 10px 80px rgba(0, 0, 0, 0.04);
  overflow: hidden;
}
.item { 
	@extend %flex;
	color: var(--main-color);
	margin-bottom: 14px;
	font-weight: 500; 


}
.item svg { width : 14px;
	height: 14px;
	color: currentcolor;
	margin-right: 10px;
}
.item
	{
	color:var(--secondary-color);
}
.actions {
	padding: 12px;
	display: flex;
	justify-content: space-between;
}

.circle {
	border-radius: 50%;
	width: 10px;
	height: 10px;
	background-color: #fe4d46;
	box-shadow: 14px 0 0 0 #fbc023, 28px 0 0 0 #7dd21f;
}

.circle-2 {
	border-radius: 50%;
	width: 4px;
	height: 4px;
	background-color: #d5d7e3;
	box-shadow: -6px 0 0 0 #d5d7e3, 6px 0 0 0 #d5d7e3;
}

.right-bar {
	width: 340px;
	border-left: 1px solid #e3e7f7;
	display: flex;
	flex-direction: column;
	padding-top: 180px;
	background:white;
	height:91vh;
	top:41px;
	padding-top: 140px;
	left:1px;
	border-radius: 4px;
}

.right-bar .header {
	width: 100%;
	border-top: 1px solid #e3e7f7;
	font-size: 20px;
	color: var(- -main-text-color);
	left: 100px;
}

.right-content {
	padding: 10px 30px;
	overflow-y: auto;
	flex: 1;
}

.task-box,.task-help {
	position: relative;
	border-radius: 12px;
	width: 100%;
	margin: 20px 0;
	padding: 16px;
	cursor: pointer;
	box-shadow: 2px 2px 4px 0px rgba(235, 235, 235, 1);
}

.tack-box:hover {
	transform: scale(1.02);
}

.time {
	margin-bottom: 6px;
	opacity: 0.4;
	font-size: 10px;
}

.task-name {
	font-size: 14px;
	font-weight: 500;
	opacity: 0.6;
	padding-bottom: 10px
}

.yellow { 
  background-color: var(--box-color);
}

.blue { background-color: var(--box-color-2); }

.red { background-color: var(--box-color-3); }

.green { background-color: var(--box-color-4); }

.more-button {
	position: absolute;
	width: 3px;
	height: 3px;
	border-radius: 50%;
	background-color: #8e92a4;
	box-shadow: 0 -4px 0 0 #8e92a4, 0 4px 0 0 #8e92a4;
	opacity: 0.4;
	right: 20px;
	top: 15px;
	cursor: pointer;
}

.page-content {
	display: flex;
	flex-direction: column;
	flex: 1;
	padding: 40px 20px 0 20px;
	background: #FFFFFF;
	border-bottom: 1px solid #ddd;
}

.page-content .header {
	font-size: 26px;
	color: var(--main-color);
	margin-top: 30px;
}

.content-categories {
	display: flex;
	justify-content: space-evenly;
	width: 100%;
	padding: 20px 0;
}

.nav-item {
	display: none;
}

.category {
	font-weight: 500;
	color: var(--secondary-color);
	border-bottom: 1px solid #ddd;
	transition: .4s ease-in;
	padding: 20px;
	cursor: pointer;
	}
#opt-1:checked + label ,
#opt-2:checked +  label ,
#opt-3:checked +  label ,
#opt-4:checked +  label,
#opt-5:checked +  label,
#opt-6:checked +  label,
#opt-7:checked +  label,
#opt-8:checked +  label,
#opt-9:checked +  label,
#opt-10:checked +  label,
#opt-11:checked +  label  {
  color: var(--checkbox-color);
  border-bottom: 2px solid var(--checkbox-color);
}


.task-item {
	display: none;
}

.tasks-wrapper {
	padding: 20px 0;
	flex: 1;
	overflow-y: auto;
	height: 100%;
	padding-right: 8px;
}

.task {
	display: flex;
	justify-content: space-between;
	position: relative;
	margin-bottom: 16px;
	padding-left: 30px;
	color: var(- -task-color);
	font-size: 13px;
	font-weight: 500;
}.description-task :hover {
    transform: translatex(2px);
 }.task label {
	cursor: pointer;
  

}
label .label-text {
	position: relative;
}

label .label-text:before {
	content: '';
	position: absolute;
	width: 14px;
	height: 14px;
	border: 1px solid #ddd;
	border-radius: 2px;
	left: -24px;
	transition: .2s ease;
}

.task-item:checked+label .label-text:before {
	background-color: var(--checkbox-color);
	border: none;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3E%3Cpolyline points='20 6 9 17 4 12'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-size: 10px;
	background-position: center;
	border: 1px solid var(--checkbox-color);
}

.tag {
  font-size: 10px;
  padding: 4px 8px;
  border-radius: 20px;
  }
  .approved {
    background-color: var(--tag-color-one);
    color: var(--tag-color-text-one);
  }
  
  .progress {
    background-color: var(--tag-color-two);
    color: var(--tag-color-text-two);
   height: 20px;
   margin-bottom: 0px
  }

.review {
	background-color: var(--tag-color-three);
	color: var(--tag-color-text-three);
}

.waiting {
	background-color: var(--tag-color-four);
	color: var(--tag-color-text-four);
}

.upcoming {
	border-bottom: 1px solid #ddd;
	padding-bottom: 30px;
	margin-bottom: 30px;
}
@media screen and (max-width: 900px) {
  .left-bar {
    display: none;
  }
}

@media screen and (max-width: 700px) {
	.task-manager {
		flex-direction: column;
		overflow-y: auto;
	}
	.right-bar, .page-content {
		width: 100%;
		display: block;
	}
	.tasks-wrapper {
		height: auto;
	}
}

@media screen and (max-width: 520px) {
	.page-content {
		padding: 40px 10px 0 10px;
	}
	.right-content {
		padding: 10px 16px;
	}
	.category {
		padding: 20px;
	}
}

#jquery-accordion-menu {
	top: 81px;
}





.content {
	width: 260px;
	margin: 100px auto;
}

#demo-list a {
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	white-space: nowrap;
	height: 60px;
	width: 100%;
	font-size: 14px
}

#footer {
	position: absolute;
	width: 100%;
	left: 0px;
	bottom: 0px;
	background-color: #474747;
	height: 150px
}
</style>

<script type="text/javascript">
jQuery(document).ready(function(){
	if(jQuery('.task-item').prop('checked')){
	 $(".task-item:checked").each(function(){ 
		 var txt = $(this).next().text();
	$(".task-item:checked").siblings('span').attr('class','tag approved').text("Selection");
	  $("<div class='task-box yellow'><div class='description-task'><div class='task-name'>"+txt+"</div><div class='time'>내용</div></div><div class='glyphicon glyphicon-remove more-button'></div></div>").appendTo('.right-content');
	 });
	}
	
	else{
		  $(this).siblings('span').attr('class','tag progress').text("UnSelection");
	}
});
	
	
		$(function() {
	/* 		var data = "".split(',');
			for(i=0;i<=data.length;i++){
		$("<div class='task-box yellow'><div class='description-task'><div class='task-name'>"+data[i]+"</div><div class='time'>내용</div></div><div class='glyphicon glyphicon-remove more-button'></div></div>").appendTo('.right-content')
			} */
		
			
			$(".task-item").change(function(){
				 var txt = $(this).next().text();
	             var disease=$('.task-name');
	             var taskbox=$('.task-box');
	             var size = disease.length;
	             $(this).siblings('span').attr('class','tag approved').text("Selection");
	             
		        if($(this).is(":checked")){

		             var is =true;
		              
		   
		               if(size==0){
		            	   $("<div class='task-box yellow'><div class='description-task'><div class='task-name'>"+txt+"</div><div class='time'>내용</div></div><div class='glyphicon glyphicon-remove more-button'></div></div>").appendTo('.right-content');
						 }
		               else{
		               		for (i=0;i<size;i++){
		            	   
		                		if(disease.eq(i).text()==txt){
		                		is = false;
		                  		}
		              		}
		               		if(is){
		            	  			 $("<div class='task-box yellow'><div class='description-task'><div class='task-name'>"+txt+"</div><div class='time'>내용</div></div><div class='glyphicon glyphicon-remove more-button'></div></div></div>").appendTo('.right-content');
		               	  }
		               }
		        	}
		        else{
		        	  $(this).siblings('span').attr('class','tag progress').text("UnSelection");
		        	for(i=0;i <size;i++){
		        		if(txt == disease.eq(i).text()){
		        			taskbox.eq(i).remove()
		        		}
		        		
		        	}
		        	
	    		}
		    });
		
		/*사용자 히스토리 select*/
		(function($){
			$.ajax({
				url:"<c:url value='/Disease/diseaseSelec.hst'/>",
				type:'post',
				success:showList_,
				error:function(e){console.log('에러:',e)}
			});		
			
		})

								

		/*사이드바 클릭삭제*/

		$(document).on("click", ".more-button", function() {
			var is = confirm("삭제 하시겠습니까?");
			if (is) {
				$(this).parent().remove(); $(this)
			}
		});
		/*탑메뉴*/

		$("input[name=nav]").change(function() {

			var idx = $('input[name=nav]').index(this);

			switch (idx) {
			case 0:
				$('.task').hide();
				$('.task').show();
				break;
			case 1:
				$('.task').hide();
				$('input[name=task-gs]').closest("div").show();
				break;
			case 2:
				$('.task').hide();
				$('input[name=task-ns]').closest("div").show();
				break;
			case 3:
				$('.task').hide();
				$('input[name=task-os]').closest("div").show();
				break;
			case 4:
				$('.task').hide();
				$('input[name=task-uro]').closest("div").show();
				break;
			case 5:
				$('.task').hide();
				$('input[name=task-np]').closest("div").show();
				break;
			case 6:
				$('.task').hide();
				$('input[name=task-ent]').closest("div").show();
				break;
			case 7:
				$('.task').hide();
				$('input[name=task-nr]').closest("div").show();
				break;
			case 8:
				$('.task').hide();
				$('input[name=task-gi]').closest("div").show();
				break;
			case 9:
				$('.task').hide();
				$('input[name=task-p]').closest("div").show();
				break;
			default:
				$('.task').hide();
				$('input[name=task-der]').closest("div").show();
				break;
			}
		});
	});

/* 	function gitas() {
		var txt = $('#gita').val();
		if (txt != null) {
			var disease = $('li[name=disease]')
			var is = true;
			var size = disease.length

			if (size == 0) {
				return $(
						"<li name='disease'><a href='https://ko.wikipedia.org/wiki/"+txt+"'>"
								+ txt + "</a></li>").appendTo('#cons');
			} else {
				for (i = 0; i < size; i++) {
					if (disease.eq(i).text() == txt) {
						is = false;
					}
				}
				if (is) {
					return $(
							"<li name='disease'><a href='https://ko.wikipedia.org/wiki/"+txt+"'>"
									+ txt + "</a></li>").appendTo('#cons');
				}
			}
		}
	}; */
	
	function save() {
		var is = confirm("저장하시겠습니까?");
		if (is) {
			var str = ""
			var dis = $('.task-name');
			var disarr=new Array()
			for (i = 0; i < dis.length; i++) {
				str += $.trim(dis.eq(i).text()) + ",";
				disarr.push($.trim(dis.eq(i).text()))
			}
			for (i = 0; i < disarr.length; i++) {
				console.log(disarr[i])
			}

		 	   $.ajax({
		            type: "POST",
		            url: "<c:url value='/mypage/diseaseupdate.hst'/>",
		            data: 
		            	{"disarr":disarr}
		            ,
		            success: function (response) {
						console.log("성공")
		            },error:function(request,error){
		      			console.log('상태코드:',request.status);
		      			console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
		      			console.log('에러:',error);
		      		
		      		}
		        }); 
		return console.log(str.slice(0, -1));
		}
	};

	function dls() {
		var is = confirm("모두 삭제 하시겠습니까?");
		if (is) {
			$('#console li').remove();
		}
	}
</script>



<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="task-manager col-md-7">
			<div class="page-content">
				<div class="header">내 질병 관리</div>
				<div class="content-categories">
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-1" checked>
						<label class="category" for="opt-1">모두</label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-2">
						<label class="category" for="opt-2">내분비내과</label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-3">
						<label class="category" for="opt-3">심혈관내과</label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-4">
						<label class="category" for="opt-4">피부과</label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-5">
						<label class="category" for="opt-5">호흡기내과</label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-6">
						<label class="category" for="opt-6">소화기내과</label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-7">
						<label class="category" for="opt-7">신경과</label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-8">
						<label class="category" for="opt-8">정형외과 </label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-9">
						<label class="category" for="opt-9">비뇨기과 </label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-10">
						<label class="category" for="opt-10">안과 </label>
					</div>
					<div class="label-wrapper">
						<input class="nav-item" name="nav" type="radio" id="opt-11">
						<label class="category" for="opt-11">이비인후과 </label>
					</div>
				</div>

				<!-- task wrapper 시작 -->
				<div class="tasks-wrapper">
					<!-- 내분비내과 -->
					<div class="task">
						<input class="task-item" name="task-gs" type="checkbox"
							id="item-1" checked> <label for="item-1"> <span
							class="label-text">당뇨병</span>
						</label> <span class="tag progress" id="items-1">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-gs" type="checkbox"
							id="item-2"> <label for="item-2"> <span
							class="label-text">골다공증</span>
						</label> <span class="tag progress" >UnSelection</span>
					</div>
					<!-- 내분비내과 끝-->
					<!-- 심혈관내과 -->
					<div class="task">
						<input class="task-item" name="task-ns" type="checkbox"
							id="item-3"> <label for="item-3"> <span
							class="label-text">심장질환</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-ns" type="checkbox"
							id="item-4"> <label for="item-4"> <span
							class="label-text">고혈압</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<!-- 심혈관내과 끝 -->
					<!-- 피부과 -->
					<div class="task">
						<input class="task-item" name="task-os" type="checkbox"
							id="item-5"> <label for="item-5"> <span
							class="label-text">대상포진</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-os" type="checkbox"
							id="item-6"> <label for="item-6"> <span
							class="label-text">아토피 피부염</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<!-- 피부과 끝 -->
					<!-- 호흡기내과 -->
					<div class="task">
						<input class="task-item" name="task-uro" type="checkbox"
							id="item-7"> <label for="item-7"> <span
							class="label-text">폐렴</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-uro" type="checkbox"
							id="item-8"> <label for="item-8"> <span
							class="label-text">천식</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-uro" type="checkbox"
							id="item-9"> <label for="item-9"> <span
							class="label-text">기흉</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-uro" type="checkbox"
							id="item-10"> <label for="item-10"> <span
							class="label-text">결핵</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<!-- 호흡기내과 끝 -->
					<!-- 소화기내과 -->
					<div class="task">
						<input class="task-item" name="task-np" type="checkbox"
							id="item-11"> <label for="item-11"> <span
							class="label-text">간염</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-np" type="checkbox"
							id="item-12"> <label for="item-12"> <span
							class="label-text">소화불량</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-np" type="checkbox"
							id="item-13"> <label for="item-13"> <span
							class="label-text">담석</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<!-- 소화기내과 끝 -->
					<!-- 신경과 -->
					<div class="task">
						<input class="task-item" name="task-ent" type="checkbox"
							id="item-14"> <label for="item-14"> <span
							class="label-text">간질</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-ent" type="checkbox"
							id="item-15"> <label for="item-15"> <span
							class="label-text">치매</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-ent" type="checkbox"
							id="item-16"> <label for="item-16"> <span
							class="label-text">뇌졸증</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<!-- 신경과 끝 -->
					<!-- 정형외과 -->
					<div class="task">
						<input class="task-item" name="task-nr" type="checkbox"
							id="item-17"> <label for="item-17"> <span
							class="label-text">관절염</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-nr" type="checkbox"
							id="item-18"> <label for="item-18"> <span
							class="label-text">디스크</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<!-- 정형외과 끝 -->
					<!-- 비뇨기과  -->
					<div class="task">
						<input class="task-item" name="task-gi" type="checkbox"
							id="item-19"> <label for="item-19"> <span
							class="label-text">전립선염</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-gi" type="checkbox"
							id="item-20"> <label for="item-20"> <span
							class="label-text">요로결석</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<!-- 비뇨기과  끝 -->
					<!-- 이비인후과 -->
					<div class="task">
						<input class="task-item" name="task-p" type="checkbox" id="item-21">
						<label for="item-21"> <span class="label-text">비염</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-p" type="checkbox" id="item-22">
						<label for="item-22"> <span class="label-text">축농증</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<!-- 이비인후과 끝 -->
					<!-- 안과  -->
					<div class="task">
						<input class="task-item" name="task-der" type="checkbox"
							id="item-23"> <label for="item-23"> <span
							class="label-text">백내장</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<div class="task">
						<input class="task-item" name="task-der" type="checkbox"
							id="item-24"> <label for="item-24"> <span
							class="label-text">녹내장</span>
						</label> <span class="tag progress">UnSelection</span>
					</div>
					<!-- 안과  끝 -->



				</div>
				<!-- task wrapper 끝 -->
			</div>
		</div>
		<!-- task manager 끝 -->
		<div class="right-bar col-md-2">

			<div class="header">질병 선택 목록</div>
			<div class="right-content">
				<div class="task-help blue">
					<div class="description-task">

						<div class=""></div>
						<div class="time">질병선택후 아래 저장버튼을 눌러주세요<br> <span class="glyphicon glyphicon-ok" style="font-size: 1.6em;color: black;" onclick="save();">저장하기</span></div>
					</div>
					<div class="glyphicon glyphicon-remove more-button"></div>
					
				</div>
			</div>
		</div>
	</div>
</div>


<script src="<c:url value='/js/jquery-accordion-menu.js'/>" type="text/javascript"></script>

<script type="text/javascript">
	(function($) {
		$.expr[":"].Contains = function(a, i, m) {
			return (a.textContent || a.innerText || "").toUpperCase().indexOf(
					m[3].toUpperCase()) >= 0;
		};
		function filterList(header, list) {

			var form = $("<form>").attr({
				"class" : "filterform",
				action : "#"
			}), input = $("<input>").attr({
				"class" : "filterinput",
				type : "text"
			});
			$(form).append(input).appendTo(header);
			$(input).change(
					function() {
						var filter = $(this).val();
						if (filter) {
							$matches = $(list).find(
									"a:Contains(" + filter + ")").parent();
							$("li", list).not($matches).slideUp();
							$matches.slideDown();
						} else {
							$(list).find("li").slideDown();
						}
						return false;
					}).keyup(function() {
				$(this).change();
			});
		}
		$(function() {
			filterList($("#form"), $("#demo-list"));
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jquery-accordion-menu").jqueryAccordionMenu();

	});

	$(function() {

		$("#demo-list li").click(function() {
			$("#demo-list li.active").removeClass("active")
			$(this).addClass("active");
		})
	})
</script>


