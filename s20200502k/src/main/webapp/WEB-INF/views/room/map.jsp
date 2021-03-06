<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>기초 : 그냥 지도만 생성해 보기</title>
</head>
<body>
	<header>
	<div id="map"width:1000px; margin-top:40px; height:500px;"></div>
</body>

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9pb7eu6jme"></script>
<style type="text/css">
#map {
	height: 830px;
	width: 1820px;
}

.c {
	position: relative;
	bottom: 30px;
	left: 500px;
}
</style>

<script type="text/javascript">
	var HOME_PATH = window.HOME_PATH || '.';

	var map = new naver.maps.Map(document.getElementById('map'), {
		zoom : 16,
		center : new naver.maps.LatLng(37.498294, 127.028861)
	});

	var latlngs = [ new naver.maps.LatLng(37.497646, 127.028789),
			new naver.maps.LatLng(37.498123, 127.025339),
			new naver.maps.LatLng(37.499721, 127.029997),
			new naver.maps.LatLng(37.498114, 127.023910), ];

	var markerList = [];

	for (var i = 0, ii = latlngs.length; i < ii; i++) {
		var icon = {
			url : HOME_PATH + '--',
			size : new naver.maps.Size(24, 37),
			anchor : new naver.maps.Point(12, 37),
			origin : new naver.maps.Point(i * 29, 0)
		}, marker = new naver.maps.Marker({
			position : latlngs[i],
			map : map,
			icon : icon
		});

		marker.set('seq', i);

		markerList.push(marker);

		marker.addListener('mouseover', onMouseOver);
		marker.addListener('mouseout', onMouseOut);

		icon = null;
		marker = null;
	}

	function onMouseOver(e) {
		var marker = e.overlay, seq = marker.get('seq');

		marker.setIcon({
			url : HOME_PATH + '--',
			size : new naver.maps.Size(24, 37),
			anchor : new naver.maps.Point(12, 37),
			origin : new naver.maps.Point(seq * 29, 50)
		});
	}

	function onMouseOut(e) {
		var marker = e.overlay, seq = marker.get('seq');

		marker.setIcon({
			url : HOME_PATH + '--',
			size : new naver.maps.Size(24, 37),
			anchor : new naver.maps.Point(12, 37),
			origin : new naver.maps.Point(seq * 29, 0)
		});
	}
</script>


</html>