<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/*custom font*/
@import url(https://fonts.googleapis.com/css?family=Montserrat); 

/*basic reset*/
* {margin: 0; padding: 0;}


html {
   height: 100%;
   /*Image only BG fallback*/
   
   /*background = gradient + image pattern combo*/
   background:white;
}

body {
   font-family: montserrat, arial, verdana;
   background-color: #ffffff;
}
/*form styles*/
#msform {
   width: 1000px;
   margin: 60px auto;
   text-align: left;
   position: relative;
}
#msform fieldset {
   background: #;
   border: 0 none;
   border-radius: 3px;
   box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
   padding: 20px 30px;
   box-sizing: border-box;
   width: 80%;
   margin: 0 10%;
   
   
   /*stacking fieldsets above each other*/
   position: relative;
}



/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
   display: none;
}
/*inputs*/
#msform input[type="text"],#msform input[type="password"], #msform textarea {
   padding: 15px;
   border: 1px solid #ccc;
   border-radius: 3px;
   margin-bottom: 10px;
   width: 100%;
   box-sizing: border-box;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
   height: 40px;
   box-sizing: border-box;
   border: 1px solid #919294;
   border-radius: 4px;
}

#msform textarea[name="chart"], #msform textarea[name="chart2"]
{
   padding: 15px;
   border: 1px solid #ccc;
   border-radius: 3px;
   margin-bottom: 10px;
   width: 100%;
   box-sizing: border-box;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
   height: 150px;
   border: 1px solid #919294;
}

/*buttons*/
button{
   width: 300px;
   background: #white;
   font-weight: bold;
   color: #white;
   border: 0 none;
   border-radius: 1px;
   cursor: pointer;
   padding: 10px 5px;
   margin: 10px 5px;
}
#msform .action-button{
   width: 100px;
   background: #f0eded;
   font-weight: bold;
   color: #white;
   border: 0 none;
   border-radius: 1px;
   cursor: pointer;
   padding: 10px 5px;
   margin: 10px 5px;
}
.btn {
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 10px 15px;
  font-size: 13px;
  cursor: pointer;
  box-sizing: border-box;
  border: 1px solid #4f87f7;
  border-radius: 4px;
}
.info {
  border-color: #2196F3;
  color: dodgerblue;
}

.info:hover {
  background: #2196F3;
  color: white;
}
#msform .action-button:hover, #msform .action-button:focus {
   
   box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fs-title {
   font-size: 15px;
   text-transform: uppercase;
   color: #2C3E50;
   margin-bottom: 10px;
}
.fs-subtitle {
   font-weight: normal;
   font-size: 13px;
   color: #666;
   margin-bottom: 20px;
}


/*progressbar*/
#progressbar {
   margin-bottom: 30px;
   overflow: hidden;
   /*CSS counters to number the steps*/
   counter-reset: step;
   margin-top: 150px;
}
#progressbar li {
   list-style-type: none;
   color: black;
   text-transform: uppercase;
   font-size: 9px;
   width: 25%;
   float: left;
   position: relative;
}
#progressbar li:before {
   content: counter(step);
   counter-increment: step;
   width: 20px;
   line-height: 20px;
   display: block;
   font-size: 10px;
   color: #333;
   background: white;
   border-radius: 3px;
   margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
   content: '';
   width: 100%;
   height: 2px;
   background: #00ddff;
   position: absolute;
   left: -50%;
   top: 9px;
   z-index: -1; /*put it behind the numbers*/
}
#progressbar li:first-child:after {
   /*connector not needed before the first step*/
   content: none; 
}
/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before,  #progressbar li.active:after{
   background: #00ddff;
   
}

#gender{
   width: 100%;
   height: 40px;
   border: 1px solid #ccc;
   border-radius: 3px;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
   float: left;
   padding: 10px 8px;
   
   
}

#age{
   width: 100%;
   height: 40px;
   border: 1px solid #ccc;
   border-radius: 3px;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
   float: left;
   padding: 10px 8px;   
}

#contact{
position:absolute;
top: 1000px;
width: 100%;
}
#footer{
position:absolute;
top: 1300px;
width: 100%;
}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<script>
   $(function() {

      $("#signupBtn").on('click',function(){
           
           var email = $('#email').val();
           var pwd = $('#pwd').val();
           var name = $('#name').val();
           var tel = $('#phone').val();
           var gender = $('#gender').val();
           var age = parseInt($('#age').val());
           var height = parseInt($('#height').val());
           var weight = parseInt($('#weight').val());
           var role = "ROLE_MEM";
           var enable = "1";
           var illStr = "";
           var chronic = $('#chronic').val();
           
              console.log($("input:checkbox[name=illness]:checked").length);
           if($("input:checkbox[name=illness]:checked").length == 0)
           {
              alert('해당사항 없을 시 해당없음 선택하세요');
           }
           else
             {
              $("input[name=illness]:checked").each(function() {
                   var test = $(this).val();
                   console.log(test);
                   illStr += test + "-";
                   console.log(illStr);
                });
              
              $.ajax({
                   url:'<c:url value="/Member/Insert.hst"/>',
                   type:'post',
                   datatype:'html',
                   traditional : true,
                   data:
                   {
                      "email" : email,
                      "pwd" : pwd,
                       "name" : name,
                       "gender" : gender,
                       "tel" : tel,
                       "age" : age, 
                       "height" : height,
                       "weight" : weight,
                       "role" : "ROLE_MEM",
                       "enable" : "1",
                       "illStr" : illStr,
                       "chronic" : chronic
                   },
                   success:function(data){
                    console.log("회원가입 성공");
                    alert("회원가입 완료 되었습니다.")
                    window.location.href = "<c:url value='/User/Login.hst'/>";
                   },
             
              });
             }
         });
        
    //병원찾기   
      $("#searchBtn").on("click",function() {
         console.log($('#search').val().length);
      if($('#search').val().length >= 2)
      {
         var keyword = $("#search").val();
         $.ajax({
            url : "<c:url value='/Member/HospitalSearch.hst'/>",
            type : "get", //get, post 방식 
            dataType : 'json', //or xml or script or html 
            data : {
               "search_keyword" : keyword
            }, //넘길 파라미터  
            async : true, // true:비동기, false:
            success : function(data) {
               var items = '';
               console.log(data);
               if(data == "")
               {
                  console.log("data null");
                  items = '<table class="table">' +
                                 '<tbody>' +
                                      ' <tr> ' +
                                          '<td colspan="4">검색 된 병원이 없습니다.</td>' +
                                     '</tr>' +
                                  '</tbody>'+
                              '</table> ';
               }
               
               else
               {
               items += 
                  '<table class="table">' + 
                     '<tbody style="font-size:14px">' + 
                        '<tr>' +
                           '<th class="col-md-4 text-left">병원명</th>' +
                           '<th class="col-md-4 text-left">주소</th>' +
                           '<th class="col-md-2 text-left">번호</th>' +
                        '</tr>'
                     '</tbody>' + 
                  '</table>';
               $.each(data,function(i, item) {
                  console.log(item);
                     items += 
                        
                        '<table class="table">' + 
                           '<tbody style="font-size:13px">' + 
                     /*          '<tr>' +
                                 '<th class="col-md-4 text-left">병원명</th>' +
                                 '<th class="col-md-4 text-left">주소</th>' +
                                 '<th class="col-md-2 text-left">번호</th>' +
                              '</tr>'+  */
                              '<tr id="hosCheck" onclick="searchHospClick('+ i + ')" style="cursor:hand">' + 
                              '<input type="hidden" id="hospCode'+ i +'" value="' + item['hosp_code'] + '"/>' +
                                 '<td class="col-md-4 text-left" id="hospName'+i+'">' + item['hosp_name'] + '</td>' + 
                                 '<td class="col-md-4 text-left" id="hospAddr'+i+'">' + item['address'] + '</td>' + 
                                 '<td class="col-md-2 text-left" id="hospTel'+i+'">' + item['tel'] + '</td>' + 
                              '</tr>' + 
                           '</tbody>' + 
                        '</table>';
                  });
               }
            
            $('#searchTable').html(items);
         },
         error : function(request, status, error) {
            console.log("에러");
            alert("code = " + request.status
                  + " message = "
                  + request.responseText
                  + " error = " + error); // 실패 시 처리
                  }
               });
      }
      else
      {
         alert('2자 이상 입력해주세요');
         return false;
      }
         });
      
      
            //이메일 유효성
          $('#email').keyup(function(){
             var email = $("input[name='email']");
            var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if(email.val()=="")
            {
               $('font[name=emailcheck]').text('');
                 $('font[name=emailcheck]').html("");
               $('#emailBtn').attr('disabled', true);
            }
            else if(!emailRegex.test(email.val()))
            {
               $('font[name=emailcheck]').text('');
                 $('font[name=emailcheck]').html("이메일 주소가 유효하지 않습니다");
                 $('#yun').css('background-color', '#bab6b6');
                  $('#yun').attr('disabled', true);
                  $('#emailBtn').attr('disabled', true);
                  
               email.focus();
            }
            else
            {
               $('font[name=emailcheck]').text('');
                 $('font[name=emailcheck]').html("");
               $('#emailBtn').attr('disabled', false);
            }
              
             });
          
            //핸드폰 유효성
          $('#phone').keyup(function(){
                var phone = $("input[name='phone']");
                var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

               if(phone.val()=="")
               {
                  $('font[name=phonecheck]').text('');
                    $('font[name=phonecheck]').html("");
               }
               else if(!regExp.test(phone.val()))
               {
                  $('font[name=phonecheck]').text('');
                    $('font[name=phonecheck]').html("휴대폰 번호가 유효하지 않습니다");
                  phone.focus();
               }
               else
               {
                  $('font[name=phonecheck]').text('');
                    $('font[name=phonecheck]').html("");
                  
               }
                 
            });
            
        //이름 유효성
          $('#name').keyup(function(){
                var name = $("input[name='name']");
                var regExp = /^[가-힣]{1,4}$/;

               if(name.val()=="")
               {
                  $('font[name=namecheck]').text('');
                    $('font[name=namecheck]').html("");
               }
               else if(!regExp.test(name.val()))
               {
                  $('font[name=namecheck]').text('');
                    $('font[name=namecheck]').html("한글 입력바랍니다");
                  name.focus();
               }
               else
               {
                  $('font[name=namecheck]').text('');
                  $('font[name=namecheck]').html("");
                  
               }
                 
            });
        
          //키 유효성
          $('#height').keyup(function(){
                var height = $("input[name='height']");
                var regExp = /^[0-9]+$/;

               if(height.val()=="")
               {
                  $('font[name=heightcheck]').text('');
                    $('font[name=heightcheck]').html("");
               }
               else if(!regExp.test(height.val()))
               {
                  $('font[name=heightcheck]').text('');
                    $('font[name=heightcheck]').html("숫자만 입력바랍니다");
                  height.focus();
               }
               else
               {
                  $('font[name=heightcheck]').text('');
                    $('font[name=heightcheck]').html("");
                  
               }
                 
            });
          
          //몸무게 유효성
          $('#weight').keyup(function(){
                var weight = $("input[name='weight']");
                var regExp = /^[0-9]+$/;

               if(weight.val()=="")
               {
                  $('font[name=weightcheck]').text('');
                    $('font[name=weightcheck]').html("");
               }
               else if(!regExp.test(weight.val()))
               {
                  $('font[name=weightcheck]').text('');
                    $('font[name=weightcheck]').html("숫자만 입력바랍니다");
                  weight.focus();
               }
               else
               {
                  $('font[name=weightcheck]').text('');
                    $('font[name=weightcheck]').html("");
                  
               }
                 
            });
      
       //비밀번호 유효성
         $(function(){
           $('#yun').css('background-color', '#bab6b6');
             $('#pwd').keyup(function(){
             $('font[name=check]').text('');
             }); 

             $('.form-control').keyup(function(){
              if($('#pwd').val() =="" || $('#spwd').val()=="")
              {
                  $('font[name=check]').text('');
                  $('font[name=check]').html("");
                   $('#yun').css('background-color', '#bab6b6');
                  $('#yun').attr('disabled', true);
              }
              else if($('#pwd').val()!=$('#spwd').val())
              {
                  $('font[name=check]').text('');
                  $('font[name=check]').html("비밀번호가 일치하지 않습니다");
                  $('#yun').css('background-color', '#bab6b6');
                  $('#yun').attr('disabled', true);
              }
              else
              {
                  $('font[name=check]').text('');
                  $('font[name=check]').html("비밀번호가 일치합니다");
                  $('#yun').attr('disabled', false);
                  $('#yun').css('background-color', '#f0eded');
              }
        
             });
         });
       
         $(function(){
            
           $('#yun1').css('background-color', '#bab6b6');
             $('#sample4_detailAddress').keyup(function(){
             $('font[name=sample4]').text('');
             });
              
             $('.form-control1').keyup(function(){
              var sample4_detailAddress = $("input[name='sample4_detailAddress']");
              var regExp = /^[가-힣0-9]+$/;
             if(sample4_detailAddress.val()=="")
            {
                   console.log(sample4_detailAddress.val(), 1);
                 $('font[name=sample4]').text('');
                  $('font[name=sample4]').html("");
                 $('#yun1').css('background-color', '#bab6b6');
                  $('#yun1').attr('disabled', true);
              }
           else if(!regExp.test(sample4_detailAddress.val()))
           {
               $('font[name=sample4]').text('');
               $('font[name=sample4]').html("모든 항목을 추가하시오");
               $('#yun1').css('background-color', '#bab6b6');
               $('#yun1').attr('disabled', true);
              
               sample4_detailAddress.focus();
           }
           else
           {
               $('font[name=sample4]').text('');
                 $('font[name=sample4]').html("");
                 $('#yun1').attr('disabled', false);
                 $('#yun1').css('background-color', '#f0eded');
           }
             
           });
             
         });  

      //jQuery time
      var current_fs, next_fs, previous_fs; //필드
      var left, opacity, scale; //애니매이션 필드 셋 속성
      var animating; //빠른 멀티 클릭시 방지를 위한 플래그
      var code;

       $("#emailBtn").on('click', function() {
          var userEmail = $('#email').val();
            alert("홈스피탈 서비스 인증 번호 해당 메일로 발송하였습니다")
            $.ajax({
               type : 'GET',
               url : '<c:url value="/mailauth/testMail.hst"/>',
               data : {
               "userEmail" : userEmail                  
               },
               success : function(result) {
                  console.log("성공");
                  console.log(result);
                  code=result;
               }
            })
         })

         $("#emailAuthBtn").on('click', function() {
         console.log(code);
         var text=$('#authCode').val();
         console.log(text);
         if(code == text)
         {
            alert("인증이 완료 되었습니다");
            $('#pwd').focus();
         }
         else
         {
            alert("인증번호를 확인해 주세요");
            $('#authCode').focus();
         }
//             $.ajax({
//                type : 'get',
//                url : '<c:url value="/mailauth/emailConfirm.hst"/>',
//                data : {'code':code,"text":text},
//                success : function(result) {
//                      alert("인증이 완료 되었습니다")
//                },
//                error:function(request,status,error){
//                console.log("에러");
//                alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
//             } 
//             })
         })
      
      $(document).ready(function() {
         $('.check-all').click(function() {
            $('.ab').prop('checked', this.checked);
         });
      });

      $(".next").click(
            function() {
               if (animating) {
                  return false;
               }
               animating = true;
               current_fs = $(this).parent();
               next_fs = $(this).parent().next();

               //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
               $("#progressbar li").eq($("fieldset").index(next_fs))
                     .addClass("active");

               //다음 필드셋 표시
               next_fs.show();
               //현재 필드셋을 스타일로 숨긴다.
               current_fs.animate({
                  opacity : 0
               }, {
                  step : function(now, mx) {
                     //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
                     //1.current_fs 80%로 축소
                     scale = 1 - (1 - now) * 0.2;
                     //2.오른쪽에서 next_fs 50% 가져오기
                     left = (now * 50) + "%";
                     //3.next_fs의 불투명도 1로 증가시킨다
                     opacity = 1 - now;
                     current_fs.css({
                        'transform' : 'scale(' + scale + ')',
                        'position' : 'absolute'
                     });
                     next_fs.css({
                        'left' : left,
                        'opacity' : opacity
                     });
                  },
                  duration : 800,
                  complete : function() {
                     current_fs.hide();
                     animating = false;
                  },
                  //사용자가 정의 플러그인에서 나옴
                  easing : 'easeInOutBack'
               });
            });

      $(".previous").click(
            function() {
               if (animating)
                  return false;
               animating = true;

               current_fs = $(this).parent();
               previous_fs = $(this).parent().prev();

               //진행률 표시줄에서 현재 단계 비활성화
               $("#progressbar li").eq($("fieldset").index(current_fs))
                     .removeClass("active");

               //이전 필드셋 표시
               previous_fs.show();
               //현재 필드셋을 스타일로 숨긴다.
               current_fs.animate({
                  opacity : 0
               }, {
                  step : function(now, mx) {
                     scale = 0.8 + (1 - now) * 0.2;
                     left = ((1 - now) * 100) + "%";
                     opacity = 1 - now;
                     current_fs.css({
                        'left' : left
                     });
                     previous_fs.css({
                        'transform' : 'scale(' + scale + ')',
                        'opacity' : opacity
                     });
                  },
                  duration : 800,
                  complete : function() {
                     current_fs.hide();
                     animating = false;
                  },
                  //사용자 정의 플로그인에서 나옴
                  easing : 'easeInOutBack'
               });

            });
     
      $(".submit").click(function() {
         return false;
      })
      $(".input-group-addon")
            .click(
                  function() {
                     console.log($(".input-group-addon"), "검색")
                     console.log('검색',
                                 $('#input_hospital').val().length);
                     var search_val = $('#input_hospital').val();
                     if (search_val.length > 0) {
                        $
                              .ajax({
                                 url : "<c:url value='/Homespital/Account/loadHospitalList.hst'/>",
                                 type : 'get',
                                 datatype : 'json',
                                 data : {
                                    "search_keyword" : search_val
                                 },
                                 beforeSend : function() {
                                    console.log("beforeSend");
                                 },
                                 complete : function() {
                                    console.log("complete");
                                 },
                                 success : function(data) {
                                    var jsonData = JSON.parse(data);
                                    console.log("연결성공", jsonData,
                                          typeof (jsonData));
                                    var items = '<tbody>';
                                    $.each(jsonData, function(i,
                                          item) {
                                       console.log(item);

                                       items += "<tr>";
                                       items += "<td>"
                                             + item['HOSP_NAME']
                                             + "<td>";
                                       items += "<td>"
                                             + item['ADDRESS']
                                             + "<td>";
                                       items += "<td>"
                                             + item['TEL']
                                             + "<td>";
                                       items += "</tr>";
                                    });
                                    items += "<tbody>";
                                    $('.table').html(items);
                                 },
                                 error : function(e) {

                                 }
                              });
                     }
                  });

      $("#auth_prev").click(
            function() {
               if (animating) {
                  return false;
               }
               animating = true;
               current_fs = $(this).parent();
               previous_fs = $(this).parent().prev().prev().prev().prev();

               //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
               $("#progressbar li").show();
               $("#progressbar li").eq($("fieldset").index(previous_fs))
                     .addClass("active");

               previous_fs.show();
               //현재 필드셋을 스타일로 숨긴다.
               current_fs.animate({
                  opacity : 0
               }, {
                  step : function(now, mx) {
                     //current_fs의 불투명도가 0이므로 줄어듦 - now에 저장 됨
                     //1.previous_fs를 80%에서 100%로 확장
                     scale = 0.8 + (1 - now) * 0.2;
                     //2.current_fs를 오른쪽으로 가져감 (50%)-0%
                     left = ((1 - now) * 100) + "%";
                     //3.previous_fs의 불투명도를 1로 증가시킴.
                     opacity = 1 - now;
                     current_fs.css({
                        'left' : left
                     });
                     previous_fs.css({
                        'transform' : 'scale(' + scale + ')',
                        'opacity' : opacity
                     });
                  },
                  duration : 800,
                  complete : function() {
                     current_fs.hide();
                     animating = false;
                  },
                  //사용자 정의 플로그인에서 나옴
                  easing : 'easeInOutBack'
               });
            })

      $("#authHos").click(function name() {
         if ($("#check_1").is(":checked") == false) {
            alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
            return;
         } else if ($("#check_2").is(":checked") == false) {
            alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
            return;
         } else if ($("#check_3").is(":checked") == false) {
            alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
            return;
         } else {
            if (animating) {
               return false;
            }
            animating = true;
            current_fs = $(this).parent();
            next_fs = $(this).parent().next().next().next().next();

            //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
            $("#progressbar li").hide();

            //다음 필드셋 표시
            next_fs.show();
            //현재 필드셋을 스타일로 숨긴다.
            current_fs.animate({
               opacity : 0
            }, {
               step : function(now, mx) {
                  //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
                  //1.current_fs 80%로 축소
                  scale = 1 - (1 - now) * 0.2;
                  //2.오른쪽에서 next_fs 50% 가져오기
                  left = (now * 50) + "%";
                  //3.next_fs의 불투명도 1로 증가시킨다
                  opacity = 1 - now;
                  current_fs.css({
                     'transform' : 'scale(' + scale + ')',
                     'position' : 'absolute'
                  });
                  next_fs.css({
                     'left' : left,
                     'opacity' : opacity
                  });
               },
               duration : 800,
               complete : function() {
                  current_fs.hide();
                  animating = false;
                  $('html').scrollTop(0);
               },
               //사용자가 정의 플러그인에서 나옴
               easing : 'easeInOutBack'
            });
         }
      });

      $(".nextBtn").click(
            function() {
               if ($("#check_1").is(":checked") == false) {
                  alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                  return;
               } else if ($("#check_2").is(":checked") == false) {
                  alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                  return;
               } else if ($("#check_3").is(":checked") == false) {
                  alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                  return;
               } else {
                  if ($("#check_authHos").is(":checked") == false) {
                     if (animating) {
                        return false;
                     }
                     animating = true;
                     current_fs = $(this).parent();
                     next_fs = $(this).parent().next();

                     //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.

                     $("#progressbar li").eq(
                           $("fieldset").index(next_fs)).addClass(
                           "active");

                     //다음 필드셋 표시
                     next_fs.show();
                     //현재 필드셋을 스타일로 숨긴다.
                     current_fs.animate({
                        opacity : 0
                     }, {
                        step : function(now, mx) {
                           //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
                           //1.current_fs 80%로 축소
                           scale = 1 - (1 - now) * 0.2;
                           //2.오른쪽에서 next_fs 50% 가져오기
                           left = (now * 50) + "%";
                           //3.next_fs의 불투명도 1로 증가시킨다
                           opacity = 1 - now;
                           current_fs.css({
                              'transform' : 'scale(' + scale + ')',
                              'position' : 'absolute'
                           });
                           next_fs.css({
                              'left' : left,
                              'opacity' : opacity
                           });
                        },
                        duration : 800,
                        complete : function() {
                           current_fs.hide();
                           animating = false;
                           $('html').scrollTop(0);
                        },
                        //사용자가 정의 플러그인에서 나옴
                        easing : 'easeInOutBack'
                     });
                  } else {
                     if (animating) {
                        return false;
                     }
                     animating = true;
                     current_fs = $(this).parent();
                     next_fs = $(this).parent().next().next().next()
                           .next();

                     //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
                     $("#progressbar li").hide();

                     //다음 필드셋 표시
                     next_fs.show();
                     //현재 필드셋을 스타일로 숨긴다.
                     current_fs.animate({
                        opacity : 0
                     }, {
                        step : function(now, mx) {
                           //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
                           //1.current_fs 80%로 축소
                           scale = 1 - (1 - now) * 0.2;
                           //2.오른쪽에서 next_fs 50% 가져오기
                           left = (now * 50) + "%";
                           //3.next_fs의 불투명도 1로 증가시킨다
                           opacity = 1 - now;
                           current_fs.css({
                              'transform' : 'scale(' + scale + ')',
                              'position' : 'absolute'
                           });
                           next_fs.css({
                              'left' : left,
                              'opacity' : opacity
                           });
                        },
                        duration : 800,
                        complete : function() {
                           current_fs.hide();
                           animating = false;
                        },
                        //사용자가 정의 플러그인에서 나옴
                        easing : 'easeInOutBack'
                     });
                  }
               }
            });
      
      $("#nextBtn1").click(function() {
               
               if ($('#HosName').val() == "") {
                  alert("검색 후 진행해 주세요");
                  return false;
               } else if ($("#check_5").is(":checked") == false) {
                  alert("약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                  return false;
               }

               else {
                  if (animating) {
                     return false; 
                  }
                  animating = true;
                  current_fs = $(this).parent();
                  next_fs = $(this).parent().next();

                  //next_fs의 색인을 사용하여 진행률 표시 줄에서 다음 단계를 활성화합니다.
                  $("#progressbar li").eq($("fieldset").index(next_fs))
                        .addClass("active");

                  //다음 필드셋 표시
                  next_fs.show();
                  //현재 필드셋을 스타일로 숨긴다.
                  current_fs.animate({
                     opacity : 0
                  }, {
                     step : function(now, mx) {
                        //current_fs의 불투명도가 0으로 줄어듦 - "now"에 저장됨
                        //1.current_fs 80%로 축소
                        scale = 1 - (1 - now) * 0.2;
                        //2.오른쪽에서 next_fs 50% 가져오기
                        left = (now * 50) + "%";
                        //3.next_fs의 불투명도 1로 증가시킨다
                        opacity = 1 - now;
                        current_fs.css({
                           'transform' : 'scale(' + scale + ')',
                           'position' : 'absolute'
                        });
                        next_fs.css({
                           'left' : left,
                           'opacity' : opacity
                        });
                     },
                     duration : 800,
                     complete : function() {
                        current_fs.hide();
                        animating = false;
                     },
                     //사용자가 정의 플러그인에서 나옴
                     easing : 'easeInOutBack'
                  });
               }
            });

      
      $('#hosAuthBtn').click(function() {
         var hospCode = $('#hosCode').val();
           var hospName = $('#clickedHosName').val();
           var hosId = $('#hosId').val();
           var hosPwd = $("#hosPwd").val();
           
           console.log(hospName + hosId + hosPwd);
           console.log("hospCode: " + hospCode);
           
                 $.ajax({
                    url : "<c:url value='/Member/HospitalAuthSub.hst'/>",
                    type : 'get',
                    datatype : 'html',
                    data : {
                       "hospCode" : hospCode,
                       "email" : hosId,
                       "pwd" : hosPwd,
                       "name" : hospName,
                       "gender" : "병원",
                       "tel" : "X",
                       "age" : 0,
                       "height" : 0,
                       "weight" : 0,
                       "role" : "ROLE_HOS",
                       "enable" : "0"
                    },
                    success : function(data) {
                       alert('제휴신청이 완료되었습니다');
                       window.location.href = "<c:url value='/Home/ToHomePage.hst'/>";
                    },
                    error : function(request, status, error) {
                       alert("아이디와 비밀번호를 확인하세요");
                    }
                 });
        });
   });
   
   function searchHospClick(i) {
      var hospCode = $('#hospCode' + i).val();

      console.log('#hospCode' + i);
      console.log('hospCode: ' + hospCode);
      
            $.ajax({
               url : "<c:url value='/Member/HosSearchList.hst'/>",
               type : "get", //get, post 방식 
               dataType : 'json', //or xml or script or html 
               data : {
                  "hosp_code" : hospCode
               }, //넘길 파라미터 
               async : true, // true:비동기, false:동기 
               success : function(data) {
                  console.log("병원 선택 성공: " + data);
            
                  var items = '<label style="font-size: 1.1em; padding-top:10px; padding-left:10px">병원 :</label>'
                        + '<div class="col-md-10">'
                        + '<input type="text" class="form-control" id="clickedHosName" placeholder="병원명" disabled="disabled" value="'+data[0].hosp_name+'">'
                        + '</div>'
                        + '<label style="font-size: 1.1em; padding-top:10px; padding-left:10px">주소 :</label>'
                        + '<div class="col-md-10">'
                        + '<input type="text" class="form-control" placeholder="주소" disabled="disabled" value="'+data[0].address+'">'
                        + '</div>'
                        + '<label style="font-size: 1.1em; padding-top:10px; padding-left:10px">번호 :</label>'
                        + '<div class="col-md-10">'
                        + '<input type="text" class="form-control" placeholder="번호" disabled="disabled" value="'+data[0].tel+'">'
                        + '</div>';

                  $('#selectedHosp').html(items);
                  $('#close').click();
                    var hospCode = data[0].hosp_code;
                    console.log("click: " + hospCode);
                    $("#hosCodeDiv").html('<input type="text" type="hidden" id="hosCode" value="'+hospCode+'">');
               },
               error : function(request, status, error) {
                  console.log("에러");
                  alert("code = " + request.status + " message = "
                        + request.responseText + " error = " + error); // 실패 시 처리
               }
            });
   }

   function sample6_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = ''; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수

                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     fullAddr = data.roadAddress;

                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     fullAddr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                  if (data.userSelectedType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                           + ')' : '');
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('sample6_address').value = fullAddr;

                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById('sample6_address2').focus();
               }
            }).open();
   }
</script>

<!------------------------------------------- 우편번호 찾기 ------------------------------------------->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
</script>
<script>
   $(function() {
      
   });
</script>
  <!-- progressbar -->
  <%
     StringBuffer buff1 = new StringBuffer();
     StringBuffer buff2 = new StringBuffer();
     StringBuffer buff3 = new StringBuffer();
     BufferedReader reader1 = null;
     BufferedReader reader2 = null;
     BufferedReader reader3 = null;
     String str1, str2, str3;
     try {
        String filePath1 = application.getRealPath("/file/서비스이용약관.txt");
        String filePath2 = application.getRealPath("/file/개인정보 이용 약관.txt");/* <---input 파일을 연다. */
        String filePath3 = application.getRealPath("/file/위치기반서비스 이용 약관.txt");
        reader1 = new BufferedReader(new FileReader(filePath1));
        reader2 = new BufferedReader(new FileReader(filePath2));
        reader3 = new BufferedReader(new FileReader(filePath3));
        while (true) {
           str1 = reader1.readLine(); /* <-- 한행의 텍스트 데이터를 읽는다. */
           str2 = reader2.readLine();
           str3 = reader3.readLine();
           if (str1 == null)
              break;
           if (str2 == null)
              break;
           if (str3 == null)
              break;
           
           buff1.append(str1 + "\r\n");
           buff2.append(str2 + "\r\n");
           buff3.append(str3 + "\r\n");
           
            /* out.print(str + "</br>"); */ /*  <--- 읽은 데이터를 모니터로 출력 한다. */
        }   
     } 
     catch (FileNotFoundException fnfe) 
     {
        out.print("파일이 존재 하지 않습니다.");
     } 
     catch (IOException ioe) 
     {
        out.print("파일을 읽을수 없습니다.");
     }

     finally 
     {
        try 
        {
           reader1.close();
           reader2.close();
           reader3.close();/*  <---- 파일을 닫는다. */
        } 
        catch (Exception e) 
        {

        }
     }
  %>
<form id="msform">
   <div id="hosCodeDiv" style="visibility: hidden"></div>
   <div class="col-md-offset-2 col-xs-offset-3 col-md-8 col-xs-6" align="center">
      <ul id="progressbar">
         <li class="active">Agreement</li>
         <li>Account Setup</li>
         <li>Individual Setup</li>
         <li>History</li>
      </ul>
      <!-- fieldsets -->
      <fieldset>
         <div class="alert alert-info">
            <h1 class="fs-title" style="font-size: 1.3em"><strong>약관 동의</strong></h1>
            <h3 style="font-size: 0.8em">이용 약관에 동의 하셔야 이용이 가능합니다.</h3>
         </div>
         <h4 class="scheme-g"><strong>서비스</strong> 이용 약관</h4>
         <textarea name="chart" style="font-size: 1em;" disabled="disabled"><%=buff1 %></textarea>
         <p>
            <input class="ab" type="checkbox" id="check_1" name="" /> 위의 약관에 동의합니다.
         </p><br />
         <h4 class="scheme-g"><strong>개인정보</strong> 이용 약관</h4>
         <textarea name="chart2" style="font-size: 1em;" disabled="disabled"><%=buff2 %></textarea>
         <p>
            <input class="ab" type="checkbox" id="check_2" name="" /> 위의 약관에 동의합니다.
         </p><br />
         <h4 class="scheme-g"><strong>위치기반서비스</strong> 이용 약관</h4>
         <textarea name="chart2" style="font-size: 1em;" disabled="disabled"><%=buff3 %></textarea>
         <p>
            <input class="ab" type="checkbox" id="check_3" name="" /> 위의 약관에 동의합니다.
         </p>
         <p style="padding-top: 5px; color: red">
            <input class="check-all" type="checkbox" id="check_3" name="all" />
            <strong>전체 동의 시 체크</strong><br />
         </p>

         <!--          <input type="checkbox" id="check_authHos" name="" /> 병원 제휴 시 체크<br /> -->
         <input type="button" id="authHos" class="action-button" value="병원 제휴" />
         <input type="button" name="nextBtn" class="nextBtn action-button" value="일반회원" />
      </fieldset>
      <fieldset>
         <div class="alert alert-info">
            <h1 class="fs-title" style="font-size: 1.3em"><strong> 계정 정보</strong></h1>
            <h3 style="font-size: 0.8em">아이디로 사용할 e-mail과 비밀번호를 입력하세요.</h3>
         </div>
         <div class="form-group">
            <div class="row">
               <div class="col-md-8">
                  <input class="input_text" type="text" id="email" name="email" placeholder="이메일을 입력하세요" /> 
                  <font name="emailcheck" size="2.5" color="red"></font>
               </div>
               <div class="col-md-4" style="padding-left: 40px">
                  <input type="button" class="btn btn-info" id="emailBtn" disabled="disabled" value="이메일 발송" />
               </div>
               <div class="col-md-8">
                  <input type="text" id="authCode" placeholder="인증번호 입력" />
               </div>
               <div class="col-md-4" style="padding-left: 40px">
                  <input type="button" class="btn btn-info" id="emailAuthBtn" value="이메일 인증" />
               </div>
               <div class="col-md-12">
                  <input type="password" id="pwd" class="form-control" placeholder="비밀번호" /> 
                  <input type="password" id="spwd" class="form-control" placeholder="비밀번호 확인" /> 
                     <font name="check" size="2.5" color="red"></font>
               </div>
            </div>
            <!-- <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
               <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div> -->
         </div>

         <input type="button" name="previous" class="previous action-button" value="이전" /> 
         <input type="button" name="next" id="yun" disabled="disabled" class="next action-button" value="다음" />

      </fieldset>
      <fieldset>
         <div class="alert alert-info">
            <h1 class="fs-title" style="font-size: 1.3em"><strong>개인 정보</strong></h1>
            <h3 style="font-size: 0.8em">개인 정보를 입력해주세요.</h3>
         </div>
         <div class="form-group">
            <div class="row">
               <div class="col-md-12">
                  <input type="text" id="name" name="name" placeholder="이름" /> 
                     <font name="namecheck" size="2.5" color="red"></font> 
                  <input type="text" id="phone" name="phone" placeholder="핸드폰 번호 " /> 
                     <font name="phonecheck" size="2.5" color="red"></font>
               </div>
               <div class="col-md-6">
                  <select class="form-control" id="gender" style="border-color: #919294">
                     <option value="X">성별</option>
                     <option value="남자">남자</option>
                     <option value="여자">여자</option>
                  </select>
               </div>
               <div class="col-md-6"> 
                  <select class="form-control" id="age" style="border-color: #919294">
                     <option>나이</option>
                     <option value="10세이하">10세 이하</option>
                     <option value="10대">10대</option>
                     <option value="20대">20대</option>
                     <option value="30대">30대</option>
                     <option value="40대">40대</option>
                     <option value="50대">50대</option>
                     <option value="60대">60대</option>
                     <option value="70대">70대</option>
                     <option value="80대">80대</option>
                     <option value="90대">90대</option>
                  </select>
               </div>
               <div class="col-md-6" style="padding-top: 10px">
                  <input type="text" id="height" name="height" placeholder="키(cm)">
                  <font name="heightcheck" size="2.5" color="red"></font>
               </div>
               <div class="col-md-6" style="padding-top: 10px">
                  <input type="text" id="weight" name="weight" placeholder="몸무게(kg)">
                  <font name="weightcheck" size="2.5" color="red"></font>
               </div>

               <div class="form-group">
                  <div class="col-md-8">
                     <input type="text" id="sample4_postcode" placeholder="우편번호">
                  </div>
                  <div class="col-md-4" style="padding-left: 30px">
                     <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-info">
                  </div>
               </div>

               <div class="col-md-12">
                  <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
                  <input type="text" id="sample4_jibunAddress" placeholder="지번주소">
                     <span id="guide" style="color: #999; display: none"></span> 
                  <input type="text" id="sample4_extraAddress" placeholder="참고항목">
                  <input type="text" id="sample4_detailAddress" name="sample4_detailAddress" class="form-control1" placeholder="상세주소"> 
                     <font name="sample4" size="2.5" color="red"></font>
               </div>
            </div>
         </div>
         <input type="button" name="previous" class="previous action-button" value="이전" /> 
         <input type="button" name="next" id="yun1" disabled="disabled" class="next action-button" value="다음" />

      </fieldset>
      <fieldset>
         <div class="alert alert-info">
            <h1 class="fs-title" style="font-size: 1.3em"><strong>병력 및 만성질환</strong></h1>
            <h3 style="font-size: 0.8em">겪었던 병력을 선택하시고 만성적으로 가지고 있는 질환을 입력해주세요.</h3>
         </div>
         <!--          <div class="row"> -->
         <!--             <div class="col-md-4"> -->
         <!--                <select class="form-control"> -->
         <!--                   <option value="">내과</option> -->
         <!--                   <option value="">비뇨기과</option> -->
         <!--                   <option value="">산부인과</option> -->
         <!--                   <option value="">성형외과</option> -->
         <!--                   <option value="">소아청소년과</option> -->
         <!--                   <option value="">신경과</option> -->
         <!--                   <option value="">안과</option> -->
         <!--                   <option value="">이비인후과</option> -->
         <!--                   <option value="">일반외과</option> -->
         <!--                   <option value="">정신건강의학과</option> -->
         <!--                   <option value="">정형외과</option> -->
         <!--                   <option value="">치과</option> -->
         <!--                   <option value="">피부과</option> -->
         <!--                   <option value="">한방과</option> -->
         <!--                   <option value="">기타</option> -->
         <!--                </select> -->
         <!--             </div> -->
         <!--          </div> -->
         <!--          <div class="row"> -->
         <!--             <div class="col-md-3" style="padding:10px"> -->
         <!--                <input type="checkbox" id="symptom" name="symptom" /> 증상1 -->
         <!--             </div> -->
         <!--             <div class="col-md-3" style="padding:10px"> -->
         <!--                <input type="checkbox" id="symptom" name="symptom" /> 증상2 -->
         <!--             </div> -->
         <!--             <div class="col-md-3" style="padding:10px"> -->
         <!--                <input type="checkbox" id="symptom" name="symptom" /> 증상3 -->
         <!--             </div> -->
         <!--          </div> -->
         <h5 class="page-header" align="left">겪은 적이 있는 질환을 선택하세요</h5>
         <div class="row" style="padding-top: 15px; padding-bottom: 15px">
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="aGan" name="illness" value="1" /> A형 간염
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="bGan" name="illness" value="2" /> B형 간염
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="goHyeol" name="illness" value="3" /> 고혈압
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="gyeol" name="illness" value="4" /> 결핵
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="giHyung" name="illness" value="5" /> 기흉
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="brian" name="illness" value="6" /> 뇌질환
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="dang" name="illness" value="7" /> 당뇨
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="heart" name="illness" value="8" /> 심장질환
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="cancer" name="illness" value="9" /> 암
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="cheon" name="illness" value="10" /> 천식
            </div>
            <div class="col-md-3" style="padding: 10px">
               <input type="checkbox" id="lung" name="illness" value="11" /> 폐렴
            </div>
            <div class="col-md-3" style="padding: 10px; color:  red">
               <input type="checkbox" id="nothing" name="illness" value="12" /> <strong>해당없음</strong>
            </div>
         </div>
         </br>
         <textarea style="border-color: #03b6fc" id="chronic" name="chart2" placeholder="주의해야할 만성적으로 가지고 있는 질환을 입력하세요"></textarea>
         <input type="button" name="previous" class="previous action-button" value="이전" /> 
         <input type="button" id="signupBtn"  class="action-button" value="회원가입" />
      </fieldset>
      <fieldset>
         <div class="alert alert-info">
            <h1 class="fs-title" style="font-size: 1.3em" ><strong>병원 제휴</strong></h1>
            <h3 style="font-size: 0.8em">병원을 선택해주세요</h3>
         </div>
         <div class="row">
            <div class="col-md-8" style="padding-left:80px">
               <input id="search" type="text" class="form-control" placeholder="병원명을 검색하세요" />
            </div>
            <div class="col-md-2">
               <input type="button" data-toggle="modal" data-target="#regi-modal" id="searchBtn" value="병원 검색" class="btn btn-info">
            </div>
         </div>
         <div class="form-group" id="selectedHosp">
            <label style="font-size: 1.1em; padding-top: 10px; padding-left: 10px; color: black">병원:</label>
            <div class="col-md-10">
               <input type="text" class="form-control" id="HosName" placeholder="병원명" disabled="disabled">
            </div>
            <label style="font-size: 1.1em; padding-top: 10px; padding-left: 10px; color: black" >주소:</label>
            <div class="col-md-10">
               <input type="text" class="form-control" placeholder="병원 주소" disabled="disabled">
            </div>
            <label style="font-size: 1.1em; padding-top: 10px; padding-left: 10px; color: black">번호:</label>
            <div class="col-md-10">
               <input type="text" class="form-control" placeholder="병원 번호" disabled="disabled">
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <input type="checkbox" id="check_5" name="symptom" /> 위의 병원이 맞으시면 체크 후 다음 버튼을 눌러주세요
            </div>
         </div></br>
         <input type="button" id="auth_prev" class="action-button" value="이전" />
         <input type="button" id="nextBtn1" class="action-button" value="다음" />
      </fieldset>
      <fieldset>
         <div class="alert alert-info">
            <h1 class="fs-title" style="font-size: 1.3em"><strong>병원 제휴</strong></h1>
            <h3 style="font-size: 0.8em">사용할 아이디와 비밀번호를 입력하세요</h3>
         </div>
         <div>
            <label style="font-size: 0.9em; padding-top: 10px; padding-left: 14px; color: black">아이디:</label>
            <div class="col-md-9" style="margin-left: 46px">
               <input type="text" id="hosId" class="form-control" placeholder="아이디">
            </div>
            <label style="font-size: 0.9em; padding-top: 10px; padding-left: 14px; color: black">비밀번호:</label>
            <div class="col-md-9" style="margin-left: 32px">
               <input type="password" id="hosPwd" class="form-control" placeholder="비밀번호">
            </div>
            <label style="font-size: 0.9em; padding-top: 10px; padding-left: 10px; color: black">비밀번호 확인 :</label>
            <div class="col-md-9">
               <input type="password" class="form-control" placeholder="비밀번호 확인"></br>
            </div>
         </div>
         <input type="button" name="previous" class="previous action-button" value="이전" /> 
         <input type="button" id="hosAuthBtn" class="action-button" value="제휴신청" />
      </fieldset>
      <div class="modal fade" id="regi-modal">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h2>제휴회원 병원 찾기</h2>
               </div>
               <!--                <div class="modal-body"> -->
               <!--                   <div class="input-group">  -->

               <!--                      <div class="input-group-addon" id="searchBtn"> -->
               <!--                         <span class="glyphicon glyphicon-search"></span> -->
               <!--                      </div> -->
               <!--                   </div> -->
               <!--                </div> -->
               <div class="col-md-11" style="font-size: 1.2em; padding-left: 70px;" id="searchTable">
                  <!--                   <table class="table"> -->
                  <!--                      <tbody> -->
                  <%--                      <c:if test="${empty list}" var="isEmpty"> --%>
                  <!--                         <tr> -->
                  <!--                            <td colspan="4">검색 된 병원이 없습니다.</td> -->
                  <!--                         </tr> -->
                  <%--                      </c:if> --%>
                  <%--                      <c:if test="${not isEmpty}"> --%>
                  <%--                         <c:forEach items="${list }" var="item" varStatus="loop"> --%>
                  <!--                            <tr id="hosCheck"> -->
                  <%--                               <td id="hospName ${loop.index }">${item.hosp_name }</td> --%>
                  <!--                               <td id="hospDept">신경외과</td> -->
                  <%--                               <td id="hospAddr ${loop.index }">${item.address }</td> --%>
                  <%--                               <td id="hospTel ${loop.index }">${item.tel }</td> --%>
                  <!--                            </tr> -->
                  <%--                         </c:forEach> --%>
                  <%--                      </c:if> --%>
                  <!--                      </tbody> -->
                  <!--                   </table>    -->
               </div>
               <div class="modal-footer">
                  <button class="btn btn-info" id="close" data-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
   </div>
</form>