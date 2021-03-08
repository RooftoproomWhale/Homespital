<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<link href="<c:url value='/css/jquery-accordion-menu.css'/>" rel="stylesheet" type="text/css" />
<script>
$(function(){

	
	var str ="예약리스트";
	console.log('실행전');
	showList();
	function showList(){
		$.ajax({
			url:"<c:url value='/Calendar/View.hst'/>",
			data:{'retitles':str},
			type:'post',
			success:showList_,
			error:function(e){console.log('에러:',e)}
		});			
	};
	
	function showList_(data){
		function colors(data) {
			var str="";
			switch (data) {
			case '승인됨': str ='addblue';break;
			case '거절됨': str ='addred';break;
			default: str ='addDefault';break;
			}
			return str;
		};
		console.log('예약 목록:',data);
		var comments="";
		if(data=='[]'){
			comments+="<div style='text-align:center'><img style='width:300px;height:auto' src='"+'<c:url value="/images/medicine/notPres.png"/>'+"'/>";
			comments+="<h3>예약 내역이 없어요!</h3></div>";
		}
		else{
			$.each(JSON.parse(data),function(i,element){
				var approved=element['approved'];
				var color = colors(approved);
				comments+="<div class='panel panel-default'>";
				comments+='<div class="panel-heading" role="tab" id="heading'+i+'">';
				comments+='<h4 class="panel-title">';
				comments+='<a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse'+i+'">';
				comments+=' 예약일시: '+element['res_DATE']+" "+element['res_TIME']+"</a></h4></div>";
				comments+='<div id="collapse'+i+'" class="panel-collapse collapse" role="tabpanel">';
				comments+='<div class="panel-body"> <span class="panelspan">병원</span>: '+element['hosp_NAME']+'&emsp;<span class="panelspan">환자</span>: '+element["mem_NAME"]+"<span class='panelspan'>&emsp;증상</span>: "+element['sel_SYMP']+"<span class='panelspan'>&emsp;진료과</span>:"+element['dept_NAME']+"<span class='panelspan'>&emsp;예약상태</span>:<span class='"+color+"'> "+element['approved']+"</span>";
				comments+="</div></div></div>";
		
			});
		}
		$('#accordion').html(comments);
		
	};

});

</script>
<style>
.addblue{
color:blue;}
.addred{
color:red}
.addDefault{
color:#5D5D5D;}
.panelspan{
font-weight: bold;
color:#8C8C8C;
}
a:hover, a:focus {
	text-decoration: none;
	outline: none;
}

.demo {
	padding: 100px 0;
}

.heading-title {
	margin-bottom: 100px;
}

#accordion .panel {
	border: none;
	background: none;
	border-radius: 0;
	box-shadow: none;
}

#accordion .panel-heading {
	padding: 0;
}

#accordion .panel-title a {
	display: block;
	font-size: 16px;
	color: #9c88b9;
	padding: 17px 40px 17px 65px;
	background: #fff;
	border: 2px solid #8C8C8C;
	border-bottom: none;
	position: relative;
	transition: all 0.5s ease 0s;
	
}
#accordion .panel-title a.collapsed {
	background: #fafafa;
	color: #959595;
}

#accordion .panel-title a.collapsed:hover {
	color: #9c88b9;
}

#accordion .panel-title a:after, #accordion .panel-title a.collapsed:after {
	content: "\f068";
	font-family: FontAwesome;
	font-size: 15px;
	color: #fff; 
	width: 45px;
	height: 100%;
	line-height: 54px;
	text-align: center;
	position: absolute;
	top: 0px;
	left: -1px;
	background: #9c88b9;
	transition: all .2s;
}

#accordion .panel-title a.collapsed:after {
	content: "\f067";
	color: #959595;
	background: #f4f4f4;
	transition: all 0.5s ease 0s;
}

#accordion .panel-title a.collapsed:hover:after {
	background: #9c88b9;
	color: #fff;
}

#accordion .panel-title a:before {
	content: "";
	position: absolute;
	bottom: -11px;
	left: -1px;
	border-bottom: 12px solid transparent;
	border-right: 12px solid #9c88b9;
}

#accordion .panel-title a.collapsed:before {
	display: none;
}

#accordion .panel-body {
    font-size: 14px;
    color: #b7b7b7;
    padding: 7px 65px 15px;
    line-height: 20px;
    margin-left: 12px;
    background: #fff;
    border: 1px solid #BDBDBD;
    border-top: 2px solid #BDBDBD;
}
body {
background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003234675773) 68%, rgba(255, 206, 196, 0.5) 163%),linear-gradient(163deg, rgba(49, 146, 170, 0.07944489965716128) 86%, rgba(239, 112, 138, 0.5) 40%),linear-gradient(30deg, rgba(76, 79, 173, 0.6173675716587805) 22%, rgba(237, 106, 134, 0.5) 169%),linear-gradient(48deg, rgba(31, 85, 147, 0.7323890641868473) 64%, rgba(247, 126, 132, 0.5) 43%); background-blend-mode: overlay,multiply,color,normal;}
.contents{
	background: white;
	top: 100px;
	left: 120px;
	padding-bottom: 100px;}
</style>

<head>
<title>복약관리</title>
</head>
<body>
<div class="container-fluid">
		<div class="col-md-2">
		</div>
		<div class="contents col-md-8">
			<div class="row" style="padding-left: 70px;">
				<div class="page-header">
					<h2 style="color: blue">진료현황</h2>
				</div>
				<p style="color: red;">3세 이하 유아는 사용이 권장되지 않으며 임부는 반드시 의사와 사전에 상의하고 사용하도록 합니다</p>
			</div>
			<br />
			<div class="row">
				<div class=" col-sm-12" style="padding-left: 70px;">
					<div class="alert alert-warning alert-dismissible mt-3" role="alert">
						<strong>${mem_name}님</strong>의 진료예약 현황입니다
					</div>
					<br />
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						
						
						
					
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
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
	})(jQuery);
</script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

	});

	$(function() {

		$("#demo-list li").click(function() {
			$("#demo-list li.active").removeClass("active")
			$(this).addClass("active");
		})
	})
</script>
</html>