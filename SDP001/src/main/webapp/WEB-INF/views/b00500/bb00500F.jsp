<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>벽보(이곳보)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css" />
<style>
       #target {padding:0;margin:0;position:absolute;top:128px;left:128px;z-index:100;width:44px;height:44px;background:url("/files/map_target.png") no-repeat; } ;
       dl {margin:0;} ;
       dd {margin:0; display:inline} ;
</style>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript" src="/../js/common.js" ></script>
<script type="text/javascript">
	function go_Ins() {
		var frm = document.frm;
		
		if(frm.brand_nm.value == "") {
			alert('상호명이 입력되지 않았습니다.');
			frm.brand_nm.focus();
			return;
		} else if(frm.latitudel.value == "" || frm.latitudel.value == "") {
			alert('위치확인을 눌러주십시오.')
			return;
		} else if(frm.job_gubun.value == "") {
			alert('직종을 선택하여 주십시오.')
			frm.job_gubun.focus();
			return;
		}
		
		frm.action = "/BB005/BB00500FormI.do";
		frm.submit();
	}
</script>
<script language="javascript">
	var static_lat = "" ;
	var static_lng = "" ;
	var static_flag = "" ;     //L : 단일매장 , S : 다수매장
	var globalMap = "" ;
	var globalMarker = "" ;

	$(document).ready(function(){           

		$(".jMainMap").click(function() {
			var jLeft = parseInt($(this).offset().left / 2) ;
			var jtop = document.body.scrollTop + (document.body.clientHeight / 2) - 100;

			$('#googleMapLayer').css({   
				"zIndex" : 9999 ,
				"left" : jLeft,     
				"top" : jtop
			 }) ;                      

			var addr = document.frm.detail_address.value;

	       if(addr  == ""){
	             alert("주소를 입력하여 주십시오.") ;
	       } else {
	             iGetPoint(addr, 'L') ;
	       }
		}) ;

		$(".jDetailMap").click(function(){
			var jLeft = parseInt($(this).offset().left / 2) ;
			var jtop = document.body.scrollTop + (document.body.clientHeight / 2) - 100;

			$('#googleMapLayer').css({   
				"zIndex" : 9999 ,
				"left" : jLeft,     
				"top" : jtop
			 }) ;
	
			var addr = $(this).attr("addr") ;
			iGetPoint(addr, 'S') ;
		}) ; 

		$(".jCloseMap").click(function(){
			$("#googleMapLayer").hide() ;
		}) ; 


		$(".jSaveLocation").click(function(){
			if(static_flag == "L") {
				$("input[name='lat']:text").val(static_lat) ; 
				$("input[name='lon']:text").val(static_lng) ;
			} else {
				alert("위도및 경도를 적용시킬 수 없습니다.") ; 
			}
			
			$("#googleMapLayer").hide() ;
		}) ; 
	}) ;

	function iGetPoint(addr, flag) {            
		var geocoder = new google.maps.Geocoder();

		geocoder.geocode({ 'address': addr }, function (results, status) {
			var lat = "" ; //위도
			var lng = "" ; //경도

			alert(status);

			/* status 결과값
			OK : 제대로 검색해서 가지고 올경우. 상세주소가 없고 동까지만 있어도 OK 가 뜹니다.
			ZERO_RESULTS : 완전 잘못 된 주소를 입력해서 결과값이 없을 경우.
			
			아래는 아직 테스트를 안해봐서 정확하게는 모르겠어용.
			OVER_QUERY_LIMIT : indicates that you are over your quota.
			REQUEST_DENIED : indicates that your request was denied.
			INVALID_REQUEST : generally indicates that the query (address, components or latlng) is missing.
			UNKNOWN_ERROR : indicates that the request could not be processed due to a server error. The request may succeed if you try again.
			 */
			 
			 /* result 결과값
			 formatted_address : 좌표 결과값에 해당 하는 실제 주소. 제대로된 주소를 입력하였다면 입력시 값과 이 값이 같습니다.
			 그외 많은 겂이 있지만.....너무 많음....그래서 주소를 남김.
			 https://developers.google.com/maps/documentation/geocoding/#JSON
			 
			 */
			
			if (results != "") {
				var location = results[0].geometry.location;

				lat = location.lat();
				lng = location.lng();

				if(lat == "" || lng == "") {
					$("#googleMapLayer").hide() ;
					alert("위치를 지도에서 찾을수 없습니다.") ;
				} else {
					$("#googleMapLayer").show() ;
					var myLatlng = new google.maps.LatLng(lat, lng);
					var myOptions = {
						zoom: 16,
						center: myLatlng,
						mapTypeControl: false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
						scaleControl: false, // 지도 축적 보여줄 것인지.
						navigationControl: true, // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
						navigationControlOptions: { 
							position: google.maps.ControlPosition.TOP_RIGHT,
							style: google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
						},
						scrollwheel: true,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					}
					globalMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions) ;
					google.maps.event.addListener(globalMap, 'click',function(event){
						placeMarker(event.latLng) ;
					}) ;
					
					$(".jLat").val(lat) ; 
					$(".jLng").val(lng) ; 
					
					$("#latitudel").val(lat) ; 
					$("#longitude").val(lng) ; 
					
					var latLngCls = new google.maps.LatLng(lat,lng) ;
					
					placeMarker(latLngCls) ;
					static_lat = lat ; //전역 위도 
					static_lng = lng ; //전역 경도
					static_flag = flag ;
				}
			}
		});
	}

	//단일매장?
	function placeMarker(location) {

		var clickedLocation = new google.maps.LatLng(location);
		var marker = new google.maps.Marker({
			position: location, 
			map: globalMap
		});

		if(globalMarker != "" || globalMarker == null) {
			globalMarker.setOptions({
				map: null,
				visible: false
			}) ;
		}

		globalMarker = marker ; 
		globalMap.setCenter(location);
		
/* 		$(".jLat").val(location.lat()) ; 
		$(".jLng").val(location.lng()) ; */
		
		static_lat = location.lat() ; 
		static_lng = location.lng() ;
	}
</script>
</head>

<body>
<form name="frm" id="frm" method="post">
<input type="hidden" name="latitudel" id="latitudel" value="" /> <%--위도 --%>
<input type="hidden" name="longitude" id="longitude" value="" /> <%--경도 --%>
<div id="header">
	<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
</div>
<div id="wrap" align="left">
	상호명 : <input type="text" name="brand_nm" id="brand_nm" value="" size="20" maxlength="20" /><br />
	주소 : <input type="text" value="서울 관악구 봉천동 1570-1" name="detail_address" id="detail_address" size="50" maxlength="50" /><br />
	직종 : <select id="job_gubun" name="job_gubun">
			<option value="">선택하세요</option>
 			<option value="사무" >사무</option>
 			<option value="기타" >기타</option>
		</select><br />
	소개 : <textarea name="introduction" id="introduction" rows="3" cols="30"></textarea>
	
	<br />
	<div align="right">
		<input type="button" class="jMainMap" value="위치확인" />
		<input type="button" value="등록하기" onclick="javascript:go_Ins();" />
	</div>
	
	<div id="googleMapLayer" style="width:300px;height:330px;display:none;position:absolute;background:#fff;border:1px #000000 solid;">
	<div id="map_canvas" style="width:300px;height:300px;"></div>
	<div id="description" style="height:30px" class="desc">
<!-- 	
		<dl>
			<dd style="width:50px">위도 : </dd>
			<dd style="width:90px"><input type="text" class="jLat" style="border:0px;margin:0;width:80px;"></dd>
			<dd style="width:50px">경도 : </dd>
			<dd style="width:90px"><input type="text" class="jLng" style="border:0px;margin:0;width:80px;"></dd>
		</dl>
-->
		<dl>
			<!-- <dd><input type="button" value="위치 저장" class="jSaveLocation"></dd> -->
			<dd><input type="button" value="닫기" class="jCloseMap"></dd>
		</dl>
	</div>
</div>
	
	<div id="right"></div>
</div>
<div id="footer">
	<!-- Footer Part -->
	<%-- <jsp:directive.include file="/WEB-INF/views/templates/footer.jsp" /> --%>
</div>
</form>
</body>
</html>