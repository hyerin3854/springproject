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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<style>
th, td {
	text-align: center;
}

.form-inline .form-control {
width: 40vw;
}
.btn_location .txt_location {
padding: 10px 0 8px;
margin-left: 6px;
position: relative;
bottom: 30px;
left: 800px;
}
</style>
<!-- <script>
	$(function() {
		$("#pw1, #pw2").keyup(function() {
			var pw1Value = $("#pw1").val();
			var pw2Value = $("#pw2").val();

			if (pw1Value != pw2Value) {
				$("#message").text("패스워드가 일치하지 않습니다.");
			} else {
				$("#message").text("패스워드가 일치합니다.");
			}
		})
	});
</script> -->
<title>관리자 사이트</title>
</head>
<body> 
	<%-- <%
		Object userID = null;
		if (session.getAttribute("loginUser") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='../login/login'");
			script.println("</script>");
		} else if (session.getAttribute("loginUser") != null) {
			userID = session.getAttribute("loginUser");
		}
	%> --%>
	<!-- 네비게이션 -->
	

	<div class="container">
		<div>
			<!-- 점보트론 -->
			<div class="jumbotron" style="min-width: 100%;">
				<div class="btn_area">
				<a role="button" class="btn_location" href="map.do">
					<span class="txt_location"><img alt="map" src="resources/Image/map.png"> 지도</span>
				</a>
				<a role="button" class="btn_reservation" href="calendar.do">
					<span class="txt_reservation"><img alt="reservation" src="resources/Image/calendar.png">달력</span>
				</a>
				<div class="row">
						<c:forEach items="${list }" var="room" >
					<div class="col-sm-6 col-md-3  ">
					<div class="thumbnail">
							<a href="roomContent2.do?ro_num=${room.ro_num }" class="thumbnail"> <img
								src="${pageContext.request.contextPath}/upload/${room.ro_img}"
								width="100px" height="100px" alt="..."></a>
							<p>${room.ro_title }</p>
					</div>
					</div>
						</c:forEach>


				</div>
	<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-3 ">
				<div class="thumbnail">
					<img src="resources/Image/1.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="resources/Image/2.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="resources/Image/3.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="resources/Image/4.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-3 ">
				<div class="thumbnail">
					<img src="resources/Image/1.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="resources/Image/2.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="resources/Image/3.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="resources/Image/4.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
		</div>

				<div class="room_box">
					<div class="room_item"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



