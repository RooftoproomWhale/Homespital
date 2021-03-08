
var draggedEventIsAllDay;
var activeInactiveWeekends = true;
var todays = moment(new Date).format('YYYY년MM월DD일 HH:mm');
function getDisplayEventDate(event) {
  var displayEventDate;


	  if(event.type=='병원예약'){
    var startTimeEventInfo = moment(event.start).format('YYYY-MM-DD HH:mm');
    displayEventDate = startTimeEventInfo;
	  }
	  else{
		  var startTimeEventInfo = moment(event.start).format('YYYY-MM-DD');
		    var endTimeEventInfo = moment(event.end).subtract(1, 'days').format('YYYY-MM-DD');
		    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
	  }
  
  return displayEventDate;
}

function filtering(event) {
  var show_username = true;
  var show_type = true;

  var username = $('input:checkbox.filter:checked').map(function () {
    return $(this).val();
  }).get();
  var types = $('#type_filter').val();

  show_username = username.indexOf(event.username) >= 0;

  if (types && types.length > 0) {
    if (types[0] == "all") {
      show_type = true;
    } else {
      show_type = types.indexOf(event.type) >= 0;
    }
  }

  return show_type;
}

function calDateWhenResize(event) {

  var newDates = {
    startDate: '',
    endDate: ''
  };

  if (event.allDay) {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
  } else {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
  }

  return newDates;
}



var calendar = $('#calendar').fullCalendar({
	
	themeSystem :'standard',
  eventRender: function (event, element, view) {

	if(event.type=='병원예약'){
		h = '예약날짜';
		name ='환자';
	}
	else{
		h= '복용기간';
		name ='복용자'
	}
    //일정에 hover시 요약
    element.popover({
    	
      title: $('<div />', {
        class: 'popoverTitleCalendar',
        text: event.title
      }).css({
        'background': event.backgroundColor,
        'color': event.textColor
      }),
     
      content: $('<div />', {
          class: 'popoverInfoCalendar'
        }).append('<p><strong>'+name+':</strong> ' + event.mem_NAME + '</p>')
        .append('<p><strong>구분:</strong> ' + event.type + '</p>')
        .append('<p><strong>'+h+':</strong> ' + getDisplayEventDate(event) + '</p>')
        ,
      delay: {
        show: "800",
        hide: "50"
      },
      trigger: 'hover',
      placement: 'top',
      html: true,
      container: 'body'
   });
	  
    return filtering(event);

  },


  header: {
    left: 'today, prevYear, nextYear',
    center: 'prev, title, next',
    right: 'month,agendaWeek,agendaDay,listWeek'
  },
  views: {
    month: {
      columnFormat: 'dddd'
    },
    agendaWeek: {
      columnFormat: 'M/D ddd',
      titleFormat: 'YYYY년 M월 D일',
      eventLimit: false
    },
    agendaDay: {
      columnFormat: 'dddd',
      eventLimit: false
    },
    listWeek: {
      columnFormat: ''
    }
  },

  /* ****************
   *  일정 받아옴 
   * ************** */

  events: function (start, end, timezone, callback) {
	  var param={};
	  param.retitles = '일정관리';
  $.ajax({
      type: "get",
      url: "View.hst",/*"/proj/calendar/data.json",*/
      dataType:"json",
      data: param,
      success: function (response) {
    	  console.log(response);
    	  response.forEach(el=>{
    		if(el.count != null){
    			el.backgroundColor = '#9775fa';
    			el.title = el.medi_name;
    			el.type = "복용약등록";
    			el.start =  moment(el.pres_date).format('YYYY-MM-DD');
    			var dates=new Date(el.start);
    			el.end = moment(dates.setDate(dates.getDate()+el.duration)).format('YYYY-MM-DD');
    		}
    		else{
    			el.backgroundColor = '#D25565';
    			el.title = el.hosp_NAME;
    			el.type="병원예약";
    			el.start =el.res_DATE+" "+el.res_TIME; 
  
    			
    		}
    		console.log(el);
    	  })
    	  
    	  
    	  
    	  
    	  
        var fixedDate = response.map(function (array) {
          if (array.allDay && array.start !== array.end) {
            // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
            array.end = moment(array.end).add(1, 'days');
          }
          return array;
        })
        callback(fixedDate);
      }
      ,error:function(request,error){
			console.log('상태코드:',request.status);
			console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
			console.log('에러:',error);
		
		}
    });
  },

  eventAfterAllRender: function (view) {
    if (view.name == "month") {
      $(".fc-content").css('height', 'auto');
    }
  },


  eventDragStart: function (event, jsEvent, ui, view) {
    draggedEventIsAllDay = event.allDay;
  },

  //일정 드래그앤드롭


  

  //이벤트 클릭시 수정이벤트
  eventClick: function (event, jsEvent, view) {
    editEvent(event);
  },

  locale: 'ko',
  timezone: "local",
  nextDayThreshold: "09:00:00",
  allDaySlot: true,
  displayEventTime: true,
  displayEventEnd: true,
  firstDay: 0, //월요일이 먼저 오게 하려면 1
  weekNumbers: false,
  selectable: true,
  weekNumberCalculation: "ISO",
  eventLimit: true,
  views: {
    month: {
      eventLimit: 12
    }
  },
  eventLimitClick: 'week', //popover
  navLinks: true,
  defaultDate: new Date, 
  timeFormat: 'HH:mm',
  defaultTimedEventDuration: '01:00:00',
  editable: false,
  minTime: '00:00:00',
  maxTime: '24:00:00',
  slotLabelFormat: 'HH:mm',
  weekends: true,
  nowIndicator: true,
  dayPopoverFormat: 'MM/DD dddd',
  longPressDelay: 0,
  eventLongPressDelay: 0,
  selectLongPressDelay: 0
});
/*필터*/
$("<select class='filter form-control'  onchange='filtering()' id='type_filter'><option value=''>모두</option><option value='병원예약'>병원예약</option><option value='복용약등록'>복용약등록</option></select>").appendTo('.fc-left');


