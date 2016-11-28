<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css" />
<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript" src="/../js/common.js" ></script>
<script type="text/javascript">
	function go_Ins() {
		document.frm.action = "/BB005/BB00500FormF.do";
		document.frm.submit();
	}
	
</script>

<script type="text/javascript">
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
	  
<%--
			image[i] = {
				url: "/../img/map/map_0"+(i+1)+".gif", //마커이미지 
				size: new google.maps.Size(18, 27),  //마커사이즈
				origin: new google.maps.Point(0, 0),  
				anchor: new google.maps.Point(9, 27)
			}; //마커로 사용할 이미지 정의  
--%>
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

		map_focus('');
	}));
	
	function map_focus(map_view) {
<%--
		var map_view = "37.478321,126.9512138"; // 지도 지정위치 
		var map_marker = "37.478321,126.9512138,관악구청|37.4602626,126.95359789999997,서울대학교"; //마커위치 구분자 "|" 로 구분 (좌표1,좌표2,마커이름)
--%>
		var map_marker = document.frm.map_marker.value;
		var zoom = 15; //지도 확대,축소 , 숫자가 낮을수록 축소 1~21 , 기본 9설정
		var map_id = "map";
		
		if(map_view == '') {
			map_view = document.frm.map_view.value;
		}

		googleMap(map_view,map_marker,zoom,map_id);
	}
</script>

<title>벽보(이곳보)</title>
</head>
<body>
<!-- Header Part -->
<!-- Body Part -->
<form name="frm" id="frm" method="post">
<input type="hidden" name="map_view" id="map_view" value="<c:out value="${map_view}" />" />
<input type="hidden" name="map_marker" id="map_marker" value="<c:out value="${map_marker}" />" />
<div id="header">
	<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
</div>
<div id="wrap">
<%--
	<div id="left">
		<jsp:directive.include file="/WEB-INF/views/templates/left.jsp" />
	</div> 
--%>
	<br />
	<div id="brand_address" style="width:700px; overflow:hidden; width_space:nowrap; text-overflow:ellipsis;">
	
	<div id="map" style="width:728px; height:420px;margin:0 auto;"></div>

		<table border="1" cellpadding="0" cellspacing="0">
			<colgroup>
				<col width="20%">
				<col width="50%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<tr>
				<td>상호명</td>
				<td>주소</td>
				<td>위도</td>
				<td>경도</td>
			</tr>
		<c:forEach items="${brand_address}" var="brand_address" varStatus="status">
			<tr onclick="javascript:map_focus('<c:out value='${brand_address.latitudel}' />,<c:out value='${brand_address.longitude}' />');" style="cursor:pointer;" title='<c:out value="${brand_address.brand_nm}" />'>
				<td><c:out value="${brand_address.brand_nm}" /></td>
				<td>
					<c:out value="${brand_address.local1_nm}" />&nbsp;
					<c:out value="${brand_address.local2_nm}" />&nbsp;
					<c:out value="${brand_address.local3_nm}" />&nbsp;
					<c:out value="${brand_address.detail_address}" />
				</td>
				<td><c:out value="${brand_address.latitudel}" /></td>
				<td><c:out value="${brand_address.longitude}" /></td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<br />
	<div align="right">
		<input type="button" value="등록하기" onclick="javascript:go_Ins();" />
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