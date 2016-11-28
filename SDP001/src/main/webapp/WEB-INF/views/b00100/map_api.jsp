<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 구글맵 scope -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css" />
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript" src="/../js/common.js" ></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<!-- 구글맵 scope -->

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

                           //var addr = "서울 관악구 봉천동 979-1";
                           //var addr = "경기 구리시 교문동 390-1";
                           var addr = document.frm.address.value;

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
                    //============ NEW SCOPE ==========//
             }) ;
             
             //<!-- 구글맵 생성 및 위도경도 가져오기 scope -->

             //주소로 GEOCODE가져오는 방식이 바뀌었습니다...아마도 구글에서 자체 FRAMEWORK만 쓰라는

             //뜻인것 같습니다. EDIT BY DEV.LEE 2011-11-16

             function iGetPoint(addr, flag) {            
				 var geocoder = new google.maps.Geocoder();

            		geocoder.geocode({ 'address': addr },
		     			function (results, status) {
							var lat = "" ; //위도
							var lng = "" ; //경도

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
 
                    $(".jLat").val(location.lat()) ; 
                    $(".jLng").val(location.lng()) ; 

                    static_lat = location.lat() ; 
                    static_lng = location.lng() ;
             }
             //<!-- 구글맵 scope -->
       </script>
<style>
       #target {padding:0;margin:0;position:absolute;top:128px;left:128px;z-index:100;width:44px;height:44px;background:url("/files/map_target.png") no-repeat; } ;
       dl {margin:0;} ;
       dd {margin:0; display:inline} ;
</style>

</head>
<body>
<form id="frm" name="frm" method="post">
	<input type="text" name="address" id="address" value="" />
</form>
       <!-- 구글맵 scope -->
<div class="jMainMap">11</div>
<div class="jDetailMap">22</div>
<div class="jCloseMap">33</div>
<div class="jSaveLocation">44</div>

<div id="googleMapLayer" style="width:300px;height:360px;display:none;position:absolute;background:#fff;border:1px #000000 solid;">
	<div id="map_canvas" style="width:300px;height:300px;"></div>
	<div id="description" style="height:30px" class="desc">
		<dl>
			<dd style="width:50px">위도 : </dd>
			<dd style="width:90px"><input type="text" class="jLat" style="border:0px;margin:0;width:80px;"></dd>
			<dd style="width:50px">경도 : </dd>
			<dd style="width:90px"><input type="text" class="jLng" style="border:0px;margin:0;width:80px;"></dd>
		</dl>
		<dl>
			<dd><input type="button" value="위치 저장" class="jSaveLocation"></dd>
			<dd><input type="button" value="닫기" class="jCloseMap"></dd>
		</dl>
	</div>
</div>
</body>
</html>

