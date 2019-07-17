<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf53c230e2a339588bcf86d790112fd4"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(35.273099, 128.419783),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(35.257898, 128.423638); 
		var markerPosition2 = new daum.maps.LatLng(35.273099, 128.419783);
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});
		var marker2 = new daum.maps.Marker({
		    position: markerPosition2
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		marker2.setMap(map);
		
		var iwContent = '<div style="padding:2px;">시작점</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    	iwPosition = new daum.maps.LatLng(35.257898, 128.423638); //인포윈도우 표시 위치입니다
	    
		var iwContent2 = '<div style="padding:2px;">도착점</div>', 
    		iwPosition2 = new daum.maps.LatLng(35.273099, 128.419783);
    	
		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		
		var infowindow2 = new daum.maps.InfoWindow({
		    position : iwPosition2, 
		    content : iwContent2 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		infowindow2.open(map, marker2);
	</script>

</body>
</html>

