<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<!-- 제이쿼리 (부트스트랩보다 위로) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9pb7eu6jme"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/roomcontent.css">

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">


<style>
th, td {
	text-align: center;
}

.form-inline .form-control {
	width: 40vw;
}

.main_slide {
	position: relative;
	left: 50px;
}

#title_style {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 40px;
}

.right_menu {
	position: relative;
	left: 650px;
	bottom: 350px;
}
</style>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<script type="text/javascript">
   
	var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date();//today의 Date를 세어주는 역할
	function prevCalendar() {//이전 달
		// 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate());
		buildCalendar(); //달력 cell 만들어 출력 
	}

	function nextCalendar() {//다음 달
		// 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		buildCalendar();//달력 cell 만들어 출력
	}
	function buildCalendar() {//현재 달 달력 만들기
		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		//이번 달의 첫째 날,
		//new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
		//new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
		//왜냐면 getMonth()는 0~11을 반환하기 때문
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		//이번 달의 마지막 날
		//new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
		//day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
		//대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
		var tbCalendar = document.getElementById("calendar");
		//날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
		var tbCalendarYM = document.getElementById("tbCalendarYM");
		//테이블에 정확한 날짜 찍는 변수
		//innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
		//new를 찍지 않아서 month는 +1을 더해줘야 한다. 
		tbCalendarYM.innerHTML = today.getFullYear() + "년 "
				+ (today.getMonth() + 1) + "월";

		/*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
		while (tbCalendar.rows.length > 2) {
			//열을 지워줌
			//기본 열 크기는 body 부분에서 2로 고정되어 있다.
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
			//테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
			//30일 이후로 담을달에 순서대로 열이 계속 이어진다.
		}
		var row = null;
		row = tbCalendar.insertRow();
		//테이블에 새로운 열 삽입//즉, 초기화
		var cnt = 0;// count, 셀의 갯수를 세어주는 역할
		// 1일이 시작되는 칸을 맞추어 줌
		for (i = 0; i < doMonth.getDay(); i++) {
			/*이번달의 day만큼 돌림*/
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
		}
		/*달력 출력*/
		for (i = 1; i <= lastDate.getDate(); i++) {
			//1일부터 마지막 일까지 돌림
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cell.innerHTML = "<input type='button' id=date"+i+" value="+i+"  onclick='kkk("+i+")' class='button' style='color:white;'>"//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌

			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
			if (cnt % 7 == 1) {/*일요일 계산*/
				//1주일이 7일 이므로 일요일 구하기
				//월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
			cell.innerHTML = "<input type='button' id=date"+i+" value="+i+"  onclick='kkk("+i+")' class='button' style='color:red;'>"//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
				//1번째의 cell에만 색칠
			}
			if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
				//월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
			cell.innerHTML = "<input type='button' id=date"+i+" value="+i+"  onclick='kkk("+i+")' class='button' style='color:skyblue;'>"//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
				//7번째의 cell에만 색칠
				row = calendar.insertRow();
				//토요일 다음에 올 셀을 추가
			}
			/*오늘의 날짜에 노란색 칠하기*/
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) {
				//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
				cell.bgColor = "#A43BE6";//셀의 배경색을 노랑으로 
			}
			

		}

	}


   function kkk(vday) {
	     var tRe_morning = document.getElementById('tRe_morning');
	     var tRe_afternoon = document.getElementById('tRe_afternoon');
	     var tRe_night = document.getElementById('tRe_night');


		var toMon = today.getMonth()+1;
        var calDay = today.getFullYear()+"."+toMon+"."+vday;
        var vro_num =1;//나중에 파라미터로 전환
 	    alert("vday->"+vday);
 	    alert("선택하신 예약일시:"+calDay);
	    $('#select_date').html(calDay);         /* span  id Tag */
		$.ajax({
			url:"<%=context%>/resv/reservation.do",
			data:{ro_num   : vro_num,
				  re_rvdate : calDay
			     },
			dataType:'json',
			success:function(data){
				/*  alert(".ajax getDept Data"+data);  */
				str   = data.re_morning + " " + data.re_afternoon + " " + data.re_night;
/* 				$('#RestDept1').val(str);       input Tag 
				$('#RestDept2').val(str);      input Tag  
 */				alert(".ajax getDept str"+str); 
                $('#select_date').html(calDay);         /* span  id Tag */

                if (data.re_morning == 0) {
        	               tRe_morning.innerHTML = "<li>아침<input type='radio' name='re_morning'     value='0'><br></li>";
 			    } else {
 	       	           tRe_morning.innerHTML = "<li>아침</li>";
 			    }
                if (data.re_afternoon == 0) {
        	               tRe_afternoon.innerHTML = "<li>점심<input type='radio' name='re_afternoon'     value='0'><br></li>";
 			    } else {
 	       	           tRe_afternoon.innerHTML = "<li>점심</li>";
 			    }
                if (data.re_night == 0) {
        	               tRe_night.innerHTML = "<li>저녁<input type='radio' name='re_night'     value='0'><br></li>";
 			    } else {
 	       	           tRe_night.innerHTML = "<li>저녁</li>";
 			    }


 			}
		});
	}  
  
</script>
<title>스터디룸 상세페이지</title>
</head>
<body>
	<div class="container">
		<div>
			<!-- 점보트론 -->
			<div class="jumbotron" style="min-width: 100%;">
				<div class="row">
					<div class="col-lg-6">
						<!-- 왼쪽 -->
						<p id="title_style">${room.ro_title }</p>
						<div id="demo" class="carousel slide" data-ride="carousel">
							<div class="main_slide" style="width: 400px;">
								<div class="carousel-inner">
									<a class="carousel-control-prev" href="#demo" data-slide="prev">
										<span class="carousel-control-prev-icon"></span>
									</a>
									<ul class="carousel-indicators">
										<li data-target="#demo" data-slide-to="0" class="active"></li>
										<li data-target="#demo" data-slide-to="1"></li>
										<li data-target="#demo" data-slide-to="2"></li>
									</ul>
									<div class="carousel-item active">
										<c:forEach items="#{roomImg }" var="img">
											<c:if test="${img.i_seq == 1}">
												<img
													src="${pageContext.request.contextPath }/upload/${img.i_contentImg}"
													alt="Place" width="500px" height="400px">
											</c:if>
										</c:forEach>
									</div>
									<div class="carousel-item ">
										<c:forEach items="#{roomImg }" var="img">
											<c:if test="${img.i_seq == 2}">
												<img
													src="${pageContext.request.contextPath }/upload/${img.i_contentImg}"
													alt="Place" width="500px" height="400px">
											</c:if>
										</c:forEach>
									</div>
									<div class="carousel-item">
										<c:forEach items="#{roomImg }" var="img">
											<c:if test="${img.i_seq == 3}">
												<img
													src="${pageContext.request.contextPath }/upload/${img.i_contentImg}"
													alt="Place" width="500px" height="400px">
											</c:if>
										</c:forEach>
									</div>
									<a class="carousel-control-next" href="#demo" data-slide="next">
										<span class="carousel-control-next-icon"></span>
									</a>
								</div>
							</div>


						</div>

						<div class="right_menu">




						</div>


						${room.ro_loc }<br> 방번호 : ${room.ro_num }<br> 멤버번호 :
						${room.m_num }<br> 방내용 : ${room.ro_content }<br> 조회수 :
						${room.ro_hit }<br> 이용료(오전) : ${room.ro_mReservation }<br>
						이용료(오후) : ${room.ro_aftReservation }<br> 이용료(저녁) :
						${room.ro_nitReservation }<br>

						<div id="map" style="width: 450px; height: 500px;"></div>
					</div> <!-- 왼쪽닫기 -->

						<div class="col-lg-6">
								<!-- 달력+예약리스트 -->
								<div class="mini-calendar">
<table id="calendar" border="3" align="center"
		style="border-color: #020202">
		<tr>
			<!-- label은 마우스로 클릭을 편하게 해줌 -->
			<td><label onclick="prevCalendar()">< </label></td>
			<td align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</td>
			<td><label onclick="nextCalendar()">> </label></td>
		</tr>
		<tr class="aa">
			<td align="center" onclick="kkk(2)"><font color="red">일</td>
			<td align="center">월</td>
			<td align="center">화</td>
			<td align="center">수</td>
			<td align="center">목</td>
			<td align="center">금</td>
			<td align="center"><font color="skyblue">토</td>
		</tr>
	</table>
		<script language="javascript" type="text/javascript">
		buildCalendar();//
	</script>
</div>
	
	<div class="reserve-container">

		
		<div class="time-part">
			<div class="reserve-title">시간</div>
			<div class="time_select">
	예약일시:<div id="select_date"></div>
	<script language="javascript" type="text/javascript">
		buildCalendar();//
	</script>
        <br>
        <br>          
     시간을 골라보십쇼!    
     <form action="reservationGo">
     <input type="hidden" name="m_num" value="${room.m_num }">
     <input type="hidden" name="ro_num" value="${room.ro_num }">
       <ul id="tRe_morning">
       </ul>
       <ul id="tRe_afternoon">
       </ul>
       <ul id="tRe_night">
       </ul>
	</div>

		</div>
		<input type="submit" value="예약하기">
     </form>      
	</div> 
								
								
								
							<!-- 오른쪽 -->

						</div>

				</div>
			</div>
		</div>
		<!-- row 태그 -->
	</div>

</body>
<script type="text/javascript">
	var mapDiv = document.getElementById('map');
	
	var map = new naver.maps.Map('map', {center : new naver.maps.LatLng(${room.ro_spot1},${room.ro_spot2}), zoom : 17,minZoom : 7,
		
		zoomControl: true, //컨트롤 표시 여부
		zoomControlOptions: {
			position: naver.maps.Position.TOP_RIGHT 
			}
		});
	
	
	var marker = new naver.maps.Marker({position : new naver.maps.LatLng(${room.ro_spot1},${room.ro_spot2}), map : map});
	var $window = $(window);
	
	function getMapSize() {
		var size = new naver.maps.Size($window.width() - 15,
					$window.height() - 15);
	
			return size;
	};
	
	$window.on('resize', function() {
			map.setSize(getMapSize());
	});
	</script>

</html>



