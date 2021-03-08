/* ****************
 *  일정 편집
 * ************** */

var editEvent = function (event, element, view) {
	$('#item_name').empty();

	
	if(event.type=='복용약등록'){
	   	 $('#loading').show();

$('#item-date').text(event.start._i+"-"+event.end._i);
    $.ajax({
        type: "post",
        dataType:"json",
        url: "/proj/Calendar/Management.hst",/*"/proj/calendar/data.json",*/
        data: {'dname':event.title},
        success: function (response) {
      	 $.each(response, function(i, el){
      		$('<input type="button" class="btn items" id="item-'+i+'" value="'+el.item_NAME.substring(0,el.item_NAME.indexOf('('))+'"/>').appendTo('#item_name');
      	 
      	  	if(i ==0){
  			$('#item-0').addClass("click"); 
  		 }
      	  $('#item-'+i).on('click', function() {
      		  for(k=0;k < 4;k++){
      			  if(k != i){
      		  $('#item-'+k).removeClass("click");
      			  }
      		  };
      		
      		  switch (i) {
			case 0: $('#item-0').addClass("click");break;
			case 1:$('#item-1').addClass("click"); break;
			case 2:$('#item-2').addClass("click"); break;
			case 3:$('#item-3').addClass("click"); break;
			default:$('#item-4').addClass("click"); break;
			}
	      	  $('#material_NAME').html(el.material_NAME);
	      	 $('#storage_METHOD').html(el.storage_METHOD);
	      	 $('#valid_TERM').html(el.valid_TERM);
	      	 $('#entp_NAME').html(el.entp_NAME);
	      	 $('#nb_DOC').html(el.nb_DOC);
	      	 $('#er').html(el.ee_DOC.trim());
	      	 $('#ud_DOC').html(el.ud_DOC);
	      	 $('#chart').html(el.chart);
	      	 $('#imgs').attr("src",el.item_IMAGE);
      	  	})
      	  
      	  })
      	$("#item-0").trigger("click");
      	 $('#loading').hide();
      }
        ,error:function(request,error){
  			console.log('상태코드:',request.status);
  			console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
  			console.log('에러:',error);
  		
  		}
      });
	}
	
	var start ="";
	var no ="";
	if(event.type == "병원예약"){
	    no = event.reserv_NO
		}else{
		no = event.pre_no
		}

    $('.popover.fade.top').remove();
    $(element).popover("hide");
  

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }
    
    addBtnContainer.hide();
    modifyBtnContainer.show();
    
    
    if(event.type=="복용약등록"){
    	 modalTitle.html('복용중인 약 상세보기');
    	 	eventdrugModal.modal('show');
    	 	change();
    }
     else if(event.type=="병원예약"){
 
    	 start = moment(event.start).format('YYYY-MM-DD HH:mm');
    	 
    	 $('#apply_time').html(event.apply_TIME);
    	 $('input[name="update-start"]').val(start);
    	 change();
    	 	eventhosModal.modal('show');
    	
    	 }
     else{
    	   eventModal.modal('show');
     }


    //업데이트 버튼 클릭시-
    $('#updateEvent_no1,#updateEvent_no2').unbind();
    $('#updateEvent_no1,#updateEvent_no2').on('click', function () {
    
    	if($(this).attr('id')=='updateEvent_no1'){
    		 modalTitle.html('예약 변경');
    		 $('#deleteEvent_no1').css('display','none');
    		$('#updateEvents_no1').css('display','');
        	$('#updateEvent_no1').css('display','none');
//        	$('#titlecall').html('<input type="text" id="update_title" value='+event.title+'>')
//        	$('#namecall').html('<input type="text" id="update_name" value='+event.mem_NAME+'>')
        	$('#timecall').css('display','none');
        	$('#timecall2').css('display','');
    	}

    });
    /*예약변경후 */
$('#updateEvents_no1,#updateEvents_no1').on('click',function(){
	 var date = $('input[name="update-start"]').val();
     var RES_DATE=moment(date).format('YYYY-MM-DD');
     var RES_TIME=moment(date).format('HH:mm');
     var newday = new Date();
     var dates = new Date(date);
     if(dates < newday){
    	 alert('현재 시간이후로 입력해주세'); return false;
    	 
     }
	
        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }
        
  
	
	   var updateOk    
	    var updatename;
	  
	    	updatename ="예약을 변경 하시겠습니까?";
	      if(confirm(updatename)==true){
		event.title= $('#update_title').val();
		event.username=$('#update_name').val();
      
       
        $("#calendar").fullCalendar('updateEvent', event);
   
        //일정 업데이트
        $.ajax({
            type: "get",
            url: "update.hst",
            data: {
              'RES_DATE':RES_DATE,'RES_TIME':RES_TIME,'APPROVED':'대기중','reserv_NO':event.reserv_NO,"type":event.type
            },
            success: function (response) {
                alert('에약변경 신청되었습니다..')
                history.go(0);
              
            }
        });

	change();
	      }
});
//상세보기로 변경
function change() {
	 modalTitle.html('예약 상세페이지');
	 $('#approved').html(event.approved);
	 $('#dept_NAME').html(event.dept_NAME);
	 $('#sel_SYMP').html(event.sel_SYMP);
	 $('#apply_time').html(event.apply_Time);
	 $('#titlecall').html(event.title);
	 $('#namecall').html(event.mem_NAME);
	 starts= moment(event.start).format('YYYY-MM-DD HH:mm')
	 $('#timecall').text(starts);
	 $('#timecall').css('display','');
 	$('#timecall2').css('display','none');
	 $('#deleteEvent_no1').css('display','');
	 $('#updateEvents_no1').css('display','none');
 	$('#updateEvent_no1').css('display','');
}
//삭제버튼
$('#deleteEvent_no1,#deleteEvent_no2').on('click', function () {
    var deleteOk    
    var deletename;
  
    if(event.type =="병원예약"){
    	deletename ="예약을 취소 하시겠습니까?";
    }
    	else{
    		deletename="삭제 하시겠습니까?";
    	}
    
      if(confirm(deletename)==true){
    	  $('#deleteEvent_no1,#deleteEvent_no2').unbind();
    eventModal.modal('hide');
    eventdrugModal.modal('hide');
    eventhosModal.modal('hide');       
    	//삭제시
    $.ajax({
        type: "get",
        url: "delete.hst",
        data: {
            "type" :event.type,
            "no" :no
           
        },
        success: function (response) {
        	if(event.type =="병원예약"){
        		alert('예약 취소 되었습니다');
        	}else{
            alert('삭제되었습니다.');
        	}
        	history.go(0);
        }
    });
      }
    
});
};

