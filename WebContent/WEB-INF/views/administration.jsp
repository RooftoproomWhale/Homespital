<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value='/css/jquery-accordion-menu.css'/>" rel="stylesheet" type="text/css" />
<script src="<c:url value='/js/jquery-accordion-menu.js'/>" type="text/javascript"></script>
<script type='text/javascript'src='<c:url value="/js/timepicker/timepicker.js"/>'></script>

<style>
table {
   width: 100%;
}

table th {
   text-align: center;
   border-bottom: 2px solid gray;
   background-color: #EDFFFF;
   padding: 3px;
}

table td {
   border-bottom: 1px solid gray;
   padding: 3px;
}

table tr:last-child td {
   border: none;
}

a:hover {
   color: blue;
}

input #timePicker {
   border: 2px solid whitesmoke;
   border-radius: 20px;
   padding: 12px 10px;
   text-align: center;
   width: 250px;
}

</style>
<script>

   $(function() {

      $("#takePill0").on('click', function() {
         alert('지금 복용하시겠습니까?');
      });

      console.log('실행전');
      showList();
      function showList() {
         $.ajax({
            url : "<c:url value='/mapping/mappingList.hst'/>",
            type : 'post',
            success : showList_,
            error : function(e) {
               console.log('에러:', e)
            }
         });
      }
      ;

      function showList_(data) {
         var comments = "";
         $('#name').html(JSON.parse(data)[0]['MEM_NAME'] + '님');
         if (data == '[]') {
            comments += "<img style='width:300px;height:auto' src='" + '<c:url value="/images/medicine/notPres.png"/>' + "'/>";
            comments += "<h3>등록된 처방전이 없어요!</h3>";
         } else {
            $.each( JSON.parse(data), function(i, element) { 
               var count = Number(element['COUNT']);
               var mediArr = element['MEDI_NAME'] .split(',');
               comments += "<div class='panel panel-default'>";
               comments += '<div class="panel-heading col-md-11" role="tab" id="heading'+i+'">';
               comments += '<h4 class="panel-title">';
               comments += '<a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse'+i+'">';
               comments += element['HOS_NAME'] + " : "
                     + element['PRES_DATE'];
               if (element['COUNT'] == "0") {
                  comments += "<span style='color:red'> [복용이 끝난 약입니다]</span></a></h4></div>";
               }
               comments += '</a></h4></div><div data-toggle="modal" data-target="#alarmModal" data-preno="'+element['PRE_NO']+'"><a style="text-align:left;" class="btn col-md-1"><img alt="알람설정" src="../images/alarm.png"></a></div>';
               comments += '<div style="padding:0 5px 0 5px;" id="collapse'+i+'" class="panel-collapse collapse col-md-11" role="tabpanel">';
               comments += '<div style="padding:0" class="panel-body"><table class="table-striped">';
               comments += '<div id="collapse'+i+'" class="panel-collapse collapse" role="tabpanel">';
               comments += '<div style="margin:0;padding:0" class="panel-body"><table class="table-striped">';
               comments += '<tr><td><h3>약품명</h3></td><td><h3>총복용일수</h3></td><td><h3>남은 복용 횟수</h3></td><td rowspan="'
                     + (element["MEDI_NAME"].split(",").length + 1)
                     + '"><h3><span><a id="takePill'+i+'" href="<c:url value="/Administration/takePills.hst?preNo='
                     + element['PRE_NO']
                     + '"/>"><img alt="복용하기" src="../images/icon/drugeat.png"></a></span></h3></td></tr>';

               $.each(
                  element['MEDI_NAME'] .split(','),
                  function(k, val) {
                     if (val != "") {
                        comments += "<tr>"
                        comments += "<td><a href='";
                        comments += '<c:url value="/Homespital/Management.hst?dname=' + val + '"/>';
                        comments += "'>";
                        comments += "<h4>" + val + "</h4></a></td>";
                        comments += "<td><h4>" + element['DURATION'] + " 일 </h4></td>";
                        comments += "<td><h4>" + element['COUNT'] + " 회 </h4></td></tr>";
                     }
                  })
               comments += "</table></div></div></div>";
            });
         }
         $('#accordion').html(comments);
      }
      ;

   });
</script>
<style>
.upload-box {
     position: relative;
     width: 200px;
     height: 200px;
     margin: 50px auto;
     overflow: hidden;
     border: 1px dashed #ccc;
     text-align: center;
     &::after {
       display: inline-block;
       margin-top: -8px;
       content: "+";
       line-height: 200px;
       font-size: 90px;
       color: #ccc;
     }

     [type="file"] {
       display: none;
     }

     .upload-action {
       position: absolute;
       z-index: 1;
       top: 0;
       left: 0;
       box-sizing: border-box;
       width: 100%;
       height: 100%;
       cursor: pointer;
     }

     .preview-box {
       position: absolute;
       box-sizing: border-box;
       top: 0;
       left: 0;
       width: 100%;
       height: 100%;

       img {
         min-width: 100%;
         width: 100%;
         min-height: 100%;
       }
     }
   }

   .hide {
     display: none;
   }
</style>
<style>
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
   
}#accordion .panel-title a.collapsed{
border: 2px solid #8C8C8C
}
.panel-body{border: 2px solid red;}
.panel-body a h5{
border: none;
color: black;
}
.panel-body a h5:hover{
border-bottom: 1px red;
color: red;
}

ul{
   list-style-image: url("./images/icon/pills.png");
   text-align: left;
}


#accordion .panel-title a.collapsed:hover {
   color: #9c88b9;
}
.panel-heading{border: 2px solid #8C8C8C
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
.panel-group{
    margin-top: 7px;
}
</style>
<style>
.button-container {
    display: flex;

    margin: 10px auto;

    flex-wrap: wrap;
    justify-content: center;
}

.button {
  display: flex;
  overflow: hidden;

  margin: 10px;
  padding: 12px 12px;

  cursor: pointer;
  user-select: none;
  transition: all 150ms linear;
  text-align: center;
  white-space: nowrap;
  text-decoration: none !important;
  text-transform: none;
  text-transform: capitalize;

  color: #fff;
  border: 0 none;
  border-radius: 36px;

  font-size: 13px;
  font-weight: 500;
  line-height: 1.3;

  -webkit-appearance: none;
  -moz-appearance:    none;
  appearance:         none;
 
  justify-content: center;
  align-items: center;
  flex: 0 0 160px;
  
  float:right;
  
  box-shadow: 2px 5px 10px var(--color-smoke);

  &:hover {
    transition: all 150ms linear;

    opacity: .85;
  }
  
  &:active {
    transition: all 150ms linear;
    opacity: .75;
  }
  
  &:focus {
    outline: 1px dotted #959595;
    outline-offset: -4px;
  }
}

.button.-blue {
  color: #FFFFFF;
  background: #416dea;
}

</style>

<style>
.form-modal{
    position:relative;
    width:900px;
    height:auto;
    margin-top:4em;
    left:50%;
    transform:translateX(-50%);
    background:#fff;
    border-top-right-radius: 20px;
    border-top-left-radius: 20px;
    border-bottom-right-radius: 20px;
    box-shadow:0 3px 20px 0px rgba(0, 0, 0, 0.1)
}

.form-modal button {
   cursor: pointer;
   position: relative;
   text-transform: capitalize;
   font-size: 1em;
   z-index: 2;
   outline: none;
   background: #fff;
   transition: 0.2s;
}

.form-modal .btn {
   border-radius: 20px;
   border: none;
   font-weight: bold;
   font-size: 1.2em;
   padding: 0.8em 1em 0.8em 1em !important;
   transition: 0.5s;
   border: 1px solid #ebebeb;
   margin-bottom: 0.5em;
   margin-top: 0.5em;
}

.form-modal .login, .form-modal .signup {
   background: #57b846;
   color: #fff;
}

.form-modal .login:hover, .form-modal .signup:hover {
   background: #222;
}

.form-toggle {
   position: relative;
   width: 100%;
   height: auto;
}

.form-toggle button {
   width: 50%;
   float: left;
   padding: 1.5em;
   margin-bottom: 1.5em;
   border: none;
   transition: 0.2s;
   font-size: 1.1em;
   font-weight: bold;
   border-top-right-radius: 20px;
   border-top-left-radius: 20px;
}

.form-toggle button:nth-child(1) {
   border-bottom-right-radius: 20px;
}

.form-toggle button:nth-child(2) {
   border-bottom-left-radius: 20px;
}

#login-toggle {
   background: #57b846;
   color: #ffff;
}

.form-modal form {
   position: relative;
   width: 90%;
   height: auto;
   left: 50%;
   transform: translateX(-50%);
}

#login-form, #signup-form {
   position: relative;
   width: 100%;
   height: auto;
   padding-bottom: 1em;
}

#signup-form {
   display: none;
}

#login-form button, #signup-form button {
   width: 100%;
   margin-top: 0.5em;
   padding: 0.6em;
}

.form-modal input {
   position: relative;
   width: 100%;
   font-size: 1em;
   padding: 1.2em 1.7em 1.2em 1.7em;
   margin-top: 0.6em;
   margin-bottom: 0.6em;
   border-radius: 20px;
   border: none;
   background: #ebebeb;
   outline: none;
   font-weight: bold;
   transition: 0.4s;
}

.form-modal input:focus, .form-modal input:active {
   transform: scaleX(1.02);
}

.form-modal input::-webkit-input-placeholder {
   color: #222;
}

.form-modal p {
   font-size: 16px;
   font-weight: bold;
}

.form-modal p a {
   color: #57b846;
   text-decoration: none;
   transition: 0.2s;
}

.form-modal p a:hover {
   color: #222;
}

.form-modal i {
   position: absolute;
   left: 10%;
   top: 50%;
   transform: translateX(-10%) translateY(-50%);
}

.fa-google {
   color: #dd4b39;
}

.fa-linkedin {
   color: #3b5998;
}

.fa-windows {
   color: #0072c6;
}

.-box-sd-effect:hover {
   box-shadow: 0 4px 8px hsla(210, 2%, 84%, .2);
}

@media only screen and (max-width:500px) {
   .form-modal {
      width: 100%;
   }
}

@media only screen and (max-width:400px) {
   i {
      display: none !important;
   }
}

body {
   background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003234675773)
      68%, rgba(255, 206, 196, 0.5) 163%),
      linear-gradient(163deg, rgba(49, 146, 170, 0.07944489965716128) 86%,
      rgba(239, 112, 138, 0.5) 40%),
      linear-gradient(30deg, rgba(76, 79, 173, 0.6173675716587805) 22%,
      rgba(237, 106, 134, 0.5) 169%),
      linear-gradient(48deg, rgba(31, 85, 147, 0.7323890641868473) 64%,
      rgba(247, 126, 132, 0.5) 43%);
   background-blend-mode: overlay, multiply, color, normal;
}

.contents {
   margin-top: 70px;
    padding-left: 30px;
    margin-bottom: 190px;
    background: white;
    border-radius: 4px;
    width: 78%;
    height: 850px;
    bottom: 10px;
    left: 40px;
}

@media ( min-width : 992px) {
   .col-md-offset-10 {
      margin-left: 89.33333333%;
   }
}

.img_wrap {
   width: 300px;
   margin-top: 50px;
   margin-bottom: 50px;
   align-content: center;
}

.img_wrap img {
   max-width: 100%;
}

.btn-file {
   position: relative;
   overflow: hidden;
   font-size: x-large;
}

.btn-file input[type=file] {
   position: absolute;
   top: 0;
   right: 0;
   min-width: 100%;
   min-height: 100%;
   font-size: 100px;
   text-align: right;
   filter: alpha(opacity = 0);
   opacity: 0;
   outline: none;
   background: white;
   cursor: inherit;
   display: block;
}

#timePicker{
  border: 2px solid whitesmoke;
  border-radius: 20px;
  padding: 12px 10px;
  text-align: center;
  width: 250px;
}

</style>

<head>
<title>복약관리</title>
</head>
<body>
   <div class="container-fluid">
      <div class="col-md-2">
      </div>
      <div class="contents col-md-8">
         <div class="row" style="padding-left: 15px;">
            <div class="page-header">
               <h2>복약관리</h2>
            </div>
            <p style="color: red;">3세 이하 유아는 사용이 권장되지 않으며 임부는 반드시 의사와 사전에 상의하고 사용하도록 합니다</p>
         </div>
         <br />
         <div class="row">
            <div class=" col-sm-12" style="padding-left: 15px;">
               <div class="alert alert-warning alert-dismissible mt-3" role="alert">
                  <strong id="name"></strong>의 복약목록입니다.
               </div>
               <br /><br /><br />
               <div class="button-container" style="padding-bottom: 10px">
                   <div class='button -blue center' data-toggle="modal" data-target="#vision">
                      <i class="fas fa-plus"></i> 복용약 추가</div>
               </div>
               <div style="text-align: center;" class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
               </div>
            </div>
         </div>
      </div>
   </div>
</body>

<div class="modal fade bs-example-modal-lg" tabindex="-1" id="vision" role="dialog">
   <div class="modal-dialog modal-lg">
       <div class="modal-content" style="text-align: center;">
       <form action="<c:url value='/mapping/mapping.hst'/>" method="post" enctype="multipart/form-data">
         <div style="width: 100%;text-align: center;">
            <span class="btn btn-primary btn-file" style="padding: 2px;margin: 5px;">
               사진 선택 <input style="display: inline-block;" type='file' id='filename' name='filename' />
            </span>
         </div>
         <div style="width: 600px;height: 600px;display: inline-block;" class="img_wrap">
            <img style="width: 100%;height: auto;padding-bottom: 5px;margin: 0" id="img" />
            <input id="submit" class="btn btn-lg btn-primary" type="submit" value="등록" />
         </div>
         <div style="width: 600px;height: 600px;display: inline-block;border:1px dashed gray;padding: 2px;" class="blank">
         </div>
      </form>
      </div>
   </div>
</div>

<!--  
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
   <div class="modal-dialog modal-lg">
       <div class="modal-content">
          <div class="row" style="padding: 50px;">
            <div class="col-md-6">
               <p class="title">잘못된 정보가 있을시 수정해주세요</p>
               <form action="<c:url value='/mapping/mapping.hst'/>" method="post" enctype="multipart/form-data">
                  <div>
                     <label>복용약1</label>
                     <input class="input" type="text" name="medi1" id="medi1"/>
                  </div>
                  <div>
                     <label>복용약1</label>
                     <input class="input" type="text" name="medi2" id="medi2"/>
                  </div>
                  <div>
                     <label>복용약1</label>
                     <input class="input" type="text" name="medi3" id="medi3"/>
                  </div>
                  <div>
                     <label>복용약1</label>
                     <input class="input" type="text" name="medi4" id="medi4"/>
                  </div>
                  <div>
                     <label>제조일</label>
                     <input type="date" />
                  </div>
                  <div>
                     <label>복용일수</label>
                     <input type="text" />
                  </div>
                  <div>
                     <label>1일 복용횟수</label>
                     <input type="text" />
                  </div>
               </form>
            </div>
            <div class="col-md-6">
               <img src="<c:url value='/images/icon/pills.png'/>"/>
            </div>
            <div class="col-md-4">
               <input id="submit" class="btn btn-lg btn-primary" style="width: 100%" type="submit" value="등록"/>
            </div>
         </div>
      </div>
   </div>
</div>
-->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog">
   <div class="modal-dialog" >
      <div class="modal-content" style="width: 350px;">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="myModalLabel">
               <img src='<c:url value="/images/alarm.png"/>'>복용 알람 설정
            </h4>
         </div>
         <div id="alarmBody" style="text-align: center;" class="modal-body">
            <div>
               <form id="alarmForm">
                  <input type="hidden" id="preno" name="preno" value="1234"/>
                  <div>
                  <label>아 침 </label>
                  <input style="text-align: center;" id='timepickerM' type='text' class="timepicker" name='timepickerM'/>
                  </div>
                  <div>
                  <label> 점 심 </label>
                  <input style="text-align: center;" id='timepickerA' type='text' class="timepicker" name='timepickerA'/>
                  </div>
                  <div>
                  <label> 저 녁 </label>
                  <input style="text-align: center;" id='timepickerE' type='text' class="timepicker" name='timepickerE'/>
                  </div>
               </form>
            </div>
         </div>
         <div class="modal-footer" style="text-align: center;">
            <button onclick="javascript:alarmfn()" id="alarmbtn" type="button" class="btn btn-primary">알람설정</button>
         </div>
      </div>
   </div>
</div>


<script>
$(document).ready(function() {
      $('#alarmModal').on('show.bs.modal', function (event) {
         var button = $(event.relatedTarget);
         var preno = button.data('preno');
         console.log(preno);
         $.ajax({
            url : "<c:url value='/alarmSelec.hst'/>",
            type : 'post',
            data : {'preno':preno},
            success : function(data){
               console.log(data);
               console.log(jQuery.isEmptyObject(JSON.parse(data)));
               if (jQuery.isEmptyObject(JSON.parse(data))) {
                  $('#timepickerM').val('09:00');
                  $('#timepickerA').val('12:00');
                  $('#timepickerE').val('18:00');
               } else {
                  $('#timepickerM').val(JSON.parse(data)[0]['ALARM']);
                  $('#timepickerA').val(JSON.parse(data)[1]['ALARM']);
                  $('#timepickerE').val(JSON.parse(data)[2]['ALARM']);
               }
            },
            error : function(e) {
               console.log('에러:', e)
            }
         })
         $('#preno').val(preno);
         console.log($('#preno').val());
      })
   });
</script>

<script>
function alarmfn(){
var params = jQuery("#alarmForm").serialize();
   $.ajax({
      url : "<c:url value='/alarm.hst'/>",
      type : 'post',
      data : params,
      success : function(){
         $('#alarmModal').modal('hide');
      },
      error : function(e) {
         console.log('에러:', e)
      }
   });
}
</script>

<script>
/*
var options = { now: "00:00", //hh:mm 24 hour format only, defaults to current time 
      twentyFour: true, //Display 24 hour format, defaults to false 
      upArrow: 'wickedpicker__controls__control-up', //The up arrow class selector to use, for custom CSS 
      downArrow: 'wickedpicker__controls__control-down', //The down arrow class selector to use, for custom CSS 
      close: 'wickedpicker__close', //The close class selector to use, for custom CSS 
      hoverState: 'hover-state', //The hover state class to use, for custom CSS 
      title: '알람시간', //The Wickedpicker's title, s
      showSeconds: false, //Whether or not to show seconds, 
      secondsInterval: 1, //Change interval for seconds, defaults to 1 , 
      minutesInterval: 1, //Change interval for minutes, defaults to 1 
      beforeShow: null, //A function to be called before the Wickedpicker is shown 
      show: null, //A function to be called when the Wickedpicker is shown 
      clearable: false, //Make the picker's input clearable (has clickable "x") 
      };
   var timepicker = $('.timepicker').wickedpicker(options);
   */
   
   var options={
          enableTime: true,
          noCalendar: true,
          dateFormat: "H:i",
          time_24hr: true,
          defaultDate: "00:00"
      }
   var timepicker = $('.timepicker').flatpickr(options);
</script>

<script type="text/javascript">
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

<script>
   var sel_file;
   $(function(){
      $("#filename").on("change",handleImgFileSelect);
      $(".img_wrap").hide();
   });
   
   function handleImgFileSelect(e){
      var files = e.target.files;
      var filesArr = Array.prototype.slice.call(files);
      
      filesArr.forEach(function(f){
         if(!f.type.match("image.*")){
            alert("이미지 파일만 업로드 가능합니다.");
            return;
         }
         sel_file = f;
         var reader = new FileReader();
         reader.onload = function(e) {
            $("#img").attr("src",e.target.result);
            $(".blank").hide();
            $(".img_wrap").show();
         }
         reader.readAsDataURL(f);
      });
   }   
</script>