<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
<script>
function googleMap(map1,map2,map3,id){
 var tmp_map1 = map1.split(",");
 var tmp_map2 = map2.split("|");
 var mymap=document.getElementById(id);
 var gcenter = [[tmp_map1[0],tmp_map1[1],4]]; //지도의 중앙
 var latlng = new Array(); //마커를 위해 위치 객체 생성(배열가능)

 var tmp_map3 = new Array();
 var image = new Array();

 for(var i=0;i < tmp_map2.length;i++){
  tmp_map3[i] = tmp_map2[i].split(",");
  latlng[i] = [tmp_map3[i][0],tmp_map3[i][1],tmp_map3[i][2]];
  
  image[i] = {  
    url: "./image/mark34_pin_"+(i+1)+".png", //마커이미지 
   size: new google.maps.Size(18, 27),  //마커사이즈
   origin: new google.maps.Point(0, 0),  
   anchor: new google.maps.Point(9, 27)
  }; //마커로 사용할 이미지 정의
 }

 var gmap=new google.maps.Map(
 mymap,{
  zoom:map3,  //줌
  left:new google.maps.LatLng(latlng[0][0], latlng[0][1]),
  center:new google.maps.LatLng(gcenter[0][0], gcenter[0][1]),
  icon:image,
  mapTypeId:google.maps.MapTypeId.ROADMAP} //맵타입
 );

 var marker, i;
 for (i = 0; i < latlng.length; i++) { //미커를 여러개 찍을때 사용
  marker=new google.maps.Marker({
   position:new google.maps.LatLng(latlng[i][0], latlng[i][1]),
   icon: image[i],
   map:gmap, title:latlng[i][2]
  });
 }
}

$(document).ready((function(){
 var map_view = "37.554531,126.970663"; // 지도 지정위치 
 var map_marker = "37.554531,126.970663,서울역|37.554400,126.972263,서울역 1호선 1번출구"; //마커위치 구분자 "|" 로 구분 (좌표1,좌표2,마커이름)
 var zoom = 17; //지도 확대,축소 , 숫자가 낮을수록 축소 1~21 , 기본 9설정
 var map_id = "map2";
 googleMap(map_view,map_marker,zoom,map_id);
})); 
</script>


</head>
<body>
<div id="map2" style="width:728px; height:420px;margin:0 auto;"></div>

</body>
</html>

