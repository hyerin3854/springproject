<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
//실시간 예약 BootStrap modal Show
$(document).on('click', '.roomReserveListModal', function() {
	var ro_num = $(this).attr('value');
	$('#roomReserveNo').val(ro_num);
	$('#ddayYear').val(0);
	$('#ddayMonth').val(0);
	var ddayOption = 'default';
	var ddayYear = $('#ddayYear').val();
	var ddayMonth = $('#ddayMonth').val();
	reserveCalendar(ro_num, ddayYear, ddayMonth, ddayOption);
	$("#roomReserveListModal").modal('show');
});
//달력 month 변경
$(document).on('click', '.calendarMoveBtn', function() {
	var ro_num = $('#roomReserveNo').val();
	var ddayOption = $(this).attr('ddayOption');
	var ddayYear = $('#ddayYear').val();
	var ddayMonth = $('#ddayMonth').val();
	reserveCalendar(ro_num, ddayYear, ddayMonth, ddayOption);
});
//달력 load function
function reserveCalendar(ro_num, ddayYear, ddayMonth, ddayOption){
	$.ajax({
		url : "calendar",
		type : "POST",
		data : {ro_num, ddayYear:ddayYear, ddayMonth:ddayMonth, ddayOption:ddayOption},
		dataType : "json",
		success : function(data) {
			var html ="";
			var calendarTitle = data.ddayYear+"년 "+(data.ddayMonth+1)+"월";
			$("#calendarTitle").html(calendarTitle);
			var calendarList = data.calendarList;
			html = calenderAppend(calendarList);
			$('#calendarListTbody').html(html);
			$('#ddayYear').val(data.ddayYear);
			$('#ddayMonth').val(data.ddayMonth);
		}
	})
}
//달력 html
function calenderAppend(calendarList){
	var html = "";
	var ro_num = $('#roomReserveNo').val();
	var notThisMonthColor="#BDBDBD";
	var sundayColor="#FF0000";
	var weekdayColor="#000000";
	var saturdayColor="#0000FF";
	$.each(calendarList,function(key, item) {
        if(key%7==0){
			 html+= "<tr class='fc-week'>";
		}
		html+= "<td class='fc-day fc-widget-content'>";
		html+= "<div style='min-height: 80px;'>";
		html+= "<div class='fc-day-number' style='color:"
		//해당일수가 현재월에 포함되지않으면 색깔변경
        if(item.day > (key+1) || (key-item.day) > 27){
			html+=notThisMonthColor;
		}else{
            //요일에따른 색깔변경
			if(key%7==0){
				html+= sundayColor;
			}else if((key%7)>0 && (key%7)<6){
				html+= weekdayColor;
			}else if(key%7==6){
				html+= saturdayColor;
			}
		}
		html+=";font-weight:bold;'>"+item.day;
		html+="</div>";
		html+= "<div class='fc-day-content'>";
        //일수가 index+1보다 작거나같고 두 수의 차이가 27일보다 작으면..
		if(item.day <=(key+1) && (key-item.day)<27){
			if(item.reserveVo != null){
				html+="<h5 style='color:#FF0000;'>예약중</h5>";
			}else{
                //예약중이면 예약정보를 보여준다
				html+="<button type='button' class='btn btn-default'>예약</button>";
			}
		}
		html+= "<div style='position: relative; height: 25px;'></div>";
		html+= "</div>";
		html+= "</div>";
		html+= "</td>";
		if(key%7==6){
			 html+= "</tr>";
		}
	});
	return html;
}

</script>



</head>
<body>


	<div class="modal fade" id="roomReserveListModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="roomReserveNo" value=""> <input
						type="hidden" id="ddayYear" value="0"> <input
						type="hidden" id="ddayMonth" value="0">
					<div class="panel-body">
						<div class="calendar fc fc-ltr">

							<table class="fc-header" style="width: 100%">
								<tbody>
									<tr>
										<td class="fc-header-left">
											<div class="btn-group">
												<button type="button"
													class="fc-button-prev fc-corner-left btn btn-default btn-sm calendarMoveBtn"
													ddayOption="prev">
													<i class="fa fa-chevron-left"></i>

												</button>
												<button type="button"
													class="btn btn-default btn-sm calendarMoveBtn"
													ddayOption="next">
													<i class="fa fa-chevron-right"></i>

												</button>
											</div>
										</td>
										<td class="fc-header-center"><span
											class="fc-header-title">
												<h2 id="calendarTitle">January 2014</h2>
										</span></td>
										<td class="fc-header-right"></td>
									</tr>
								</tbody>
							</table>
							<div class="fc-content"
								style="position: relative; min-height: 1px;">
								<div class="fc-view fc-view-month fc-grid"
									style="position: relative; min-height: 1px;" unselectable="on">
									<table class="fc-border-separate" cellspacing="0">
										<thead>
											<tr class="fc-first fc-last">
												<th class="fc-day-header fc-sun fc-widget-header fc-first"
													style="width: 158px;">Sun</th>
												<th class="fc-day-header fc-mon fc-widget-header"
													style="width: 158px;">Mon</th>
												<th class="fc-day-header fc-tue fc-widget-header"
													style="width: 158px;">Tue</th>
												<th class="fc-day-header fc-wed fc-widget-header"
													style="width: 158px;">Wed</th>
												<th class="fc-day-header fc-thu fc-widget-header"
													style="width: 158px;">Thu</th>
												<th class="fc-day-header fc-fri fc-widget-header"
													style="width: 158px;">Fri</th>
												<th class="fc-day-header fc-sat fc-widget-header fc-last"
													style="width: 158px;">Sat</th>
											</tr>
										</thead>
										<tbody id="calendarListTbody">

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>