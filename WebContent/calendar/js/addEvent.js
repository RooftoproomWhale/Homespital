//일정추가
var eventModal = $('#eventModal');
//예약세부
var eventhosModal=$('#eventhosModal')
//복용약 세부
var eventdrugModal = $('#eventdrugModal');
//복용약 수정
var eventdrugModaladd=$('#eventdrugModaladd');
var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $("input[name='edit-title']");
var editStart = $('input[name="edit-start"]');
var editEnd =  $('input[name="edit-end"]');
var editType = $("select[name='edit-type'] ");
var editDesc = $('#edit-desc');
var apply_time = $("#apply_time");
var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김
    
    if(eventType =="복용약등록"){
    	modalTitle.html("복용약 등록")
     }else{
    modalTitle.html('병원 예약');
     }
    editType.val(eventType).prop('selected', true);
    editTitle.val(null);
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    if(eventType=="복용약등록"){
    	eventdrugModaladd.modal('show');
    		
    }
	else{
    eventModal.modal('show');
 
    }
  

   
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

 
    //새로운 일정 저장버튼 클릭
    $('#save-event1,#save-event2').unbind();
    $('#save-event1,#save-event2').on('click',function () {
    
    		var editTypes="";
        	for(i=0;i <= editType.length;i++){
        		if($.trim(editType.eq(i).val())!=''){
        			var editTypes = editType.eq(i).val();	
        		}};
        		
            		var one=0;
            		var to=1;
            		if(editTypes=='병원예약'){
            			editTitles = editTitle.eq(to).val();	
            			editStarts= editStart.eq(to).val();
            			editEnds =editStart.eq(to).val();;
            			editColor='#D25565'
            			allday=false;
            		}
            		else{
            			editTitles = editTitle.eq(one).val();	
            			editStarts= editStart.eq(one).val();
            			editEnds=editEnd.eq(one).val();
            			editColor='#9775fa'
            			allday=true;
            		}
 
        var eventData = {
        		
            _id: eventId,
        	
            title: editTitles,
            
            start: editStarts,
            end: editEnds,
            description: editDesc.val(),
            type: editTypes,
            username: '가길동',
            backgroundColor: editColor,
            textColor: '#ffffff',
            allDay: allday
        	
        };
            		
        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false; 
        }
        today = moment(new Date).format('YYYY년MM월DD일 HH:mm');
 /*       if(eventData.start < today){
        	alert('스케줄은 '+today+' 이후에만 등록 가능합니다')
        	return false;
        }*/
  
        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
      
        eventModal.modal('hide');
        eventdrugModaladd.modal('hide');
   	
   
     eventhosModal.modal('hide');
        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "",////<c:url value='/Calendar/insert.hst'/>
            data: {
                //.....
            },
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};