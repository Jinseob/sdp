<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css" />
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<!-- start script tag -->
<c:out value="${tag2 }" escapeXml="false"/>
<!-- end script tag -->
<style type="text/css">
.form_box {clear:both;position:relative;width:100%;padding:5px 0px;background-color:#f6fbff;border:1px solid #e3edf8;display:inline-block;word-wrap:break-word;}

.form_line {clear:both;position:relative;padding:2px 40px 0px 10px;}
.form_line:after {display:block;clear:both;visibility:hidden;height:0px;content:" ";}
.form_type01 {float:left;display:inline-block;width:50%;}
.form_type02 {display:inline-block;}
.form_type03 {display:inline-block;margin-right:10px;#float:left;}

.form_type01 dt, .form_type02 dt, .form_type03 dt {float:left;background:url("../../htdocs/images/icon/icon_arrow01.gif") no-repeat left center;font-family:'NanumGothicBold';color:#458acf;padding:0px 5px 0px 7px;height:22px;line-height:22px;width:48px;}
.form_type01 dd, .form_type02 dd, .form_type03 dd {float:left;margin:0px 0px 0px 0px;#margin:0px 0px 0px 0px;}
.form_type01 dd input.text_l, .form_type02 dd input.text_l, .form_type03 dd input.text_l {float:left;}

.letter_2 {width:25px !important;}
.letter_3 {width:38px !important;}
.letter_4 {width:48px !important;}
.letter_5 {width:60px !important;}
.letter_6 {width:70px !important;}
.letter_7 {width:82px !important;}
.letter_8 {width:92px !important;}

#left_layout {float:left;position:relative;width:170px;padding:25px 0px 30px 0px;}
#right_layout {float:left;position:relative;width:800px;padding:25px 15px;}

#left_layout dd, #left_layout dl {width:170px; background:#f5f5f5;}

#container {position:relative;width:100%;background:#f5f5f5}
#contents {width:1000px;margin:0px auto;}


#wrapper {position:relative;width:100%;background:url("../../htdocs/images/com/head_bg.gif") repeat-x left top;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
	  var code = $('#search_code').val();
	  $('#s' + code).attr( 'style', 'font-weight:bold' );
	});

	function goSearch( code ){
		$("#search_code").val(code);
		$("#frm").attr({"action" : "/BB001/BB00100Parsing.do", "method" : "post", "target" : "_self"}).submit();
	}
	
</script>

<title>서울지역</title>
</head>
<body>
<!-- Header Part -->
<!-- Body Part -->
<div id="wrapper">
	<div id="container">
		<div id="contents">
			<form name="frm" id="frm">
				<input type="hidden" id="search_code" name="search_code" value="${search_code}">
 				<div id="header">
					<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
				</div> 
				<div id="wrap">
					<div id="#left_layout" style="float:left;position:relative;width:170px;padding:25px 0px 30px 0px;">
						<jsp:directive.include file="/WEB-INF/views/templates/left.jsp" />
					</div>
					
					<div id="right_layout">
			 		<div id="searchFrm" class="form_box" >
						<div class="form_line">
							<div class="form_type02">
								<dl>
									<dt class="letter_7"><span id="s15" ><a href="#" onclick="goSearch('15');">건강</a></span></dt>
									<dt class="letter_7"><span id="s21" ><a href="#" onclick="goSearch('21');">교통</a></span></dt>
									<dt class="letter_7"><span id="s22" ><a href="#" onclick="goSearch('22');">안전</a></span></dt>
									<dt class="letter_7"><span id="s23" ><a href="#" onclick="goSearch('23');">주택</a></span></dt>
								</dl>
							</div>
						</div>
						<div class="form_line">
							<div class="form_type02">
								<dl>
									<dt class="letter_7"><span id="s24"><a href="#" onclick="goSearch('24');">경제</a></span></dt>
									<dt class="letter_7"><span id="s25"><a href="#" onclick="goSearch('25');">환경</a></span></dt>
									<dt class="letter_7"><span id="s27"><a href="#" onclick="goSearch('27');">복지</a></span></dt>
									<dt class="letter_7"><span id="s28"><a href="#" onclick="goSearch('28');">건설</a></span></dt>
								</dl>
							</div>
						</div>
						<div class="form_line">
							<div class="form_type02">
								<dl>
									<dt class="letter_7"><span id="s30" ><a href="#" onclick="goSearch('30');">행정</a></span></dt>
									<dt class="letter_7"><span id="s29" ><a href="#" onclick="goSearch('29');">세금재정</a></span></dt>
									<dt class="letter_7"><span id="s26" ><a href="#" onclick="goSearch('26');">문화/관광</a></span></dt>
									<dt class="letter_7"><span id="s34" ><a href="#" onclick="goSearch('34');">여성가족</a></span></dt>
								</dl>
							</div>
						</div>
					</div> 
					
					<div id="Seoul_news">
					
						<table border="0" cellpadding="0" cellspacing="0">
							<colgroup>
								<col width="15%">
								<col width="12%">
								<col width="">
							</colgroup>
							<c:forEach items="${info}" var="gwanak_news" varStatus="status">
								<tr>
									<td rowspan="2" align="left">
										<c:set var="img_arr" value="${fn:split(gwanak_news.THUMB_URI,'|')}"/>
										<c:forEach var="x" items="${img_arr}" >
											<img width="50px" height="50px" alt="" src="${x}">
										</c:forEach> 
									</td>
									<td align="left">
										<font color="black" style="font-weight: bold; font-size: 17px;">▣<c:out value="${gwanak_news.BLOG_NAME }" /></font>
									</td>
									<td align="left">
										<font color="black"><c:out value="${gwanak_news.POST_TITLE }" /></font>
									</td>
								</tr>
								<tr>
									<td colspan="3" align="left">
										<font color="black"><c:out value="${gwanak_news.POST_EXCERPT }" /></font>
									</td>
								</tr>
							<%-- 	<tr>
									<td colspan="3" align="left">
										<font color="black">${gwanak_news.POST_CONTENT }</font>
									</td>
								</tr> --%>
								<tr>
									<td height="20"></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<%-- <div id="container">
						<table border="1">
							<colgroup>
								<col width="5%">
								<col width="50%">
								<col width="20%">
								<col width="15%">
								<col width="10%">
							</colgroup>
							<thead>
							<tr>
								<th>No.</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>인원</th>
							</tr>
							</thead>
						<c:forEach items="${boardList }" var="boardList" varStatus="status">
							<tr onclick="javascript:goDetail('<c:out value="${boardList.board_id}" />');">
								<td><c:out value="${status.index + 1 }" /></td>
								<td><c:out value="${boardList.title }" /></td>
								<td><c:out value="${boardList.reg_id }" /></td>
								<td><c:out value="${boardList.reg_dt }" /></td>
								<td><c:out value="${boardList.tot_cnt }" />/<c:out value="${boardList.user_cnt }" /></td>
							</tr>
						</c:forEach>
						</table>
						<table border="1">
							<tr>
								<td>
									<c:out value="${html}" escapeXml="false" />
								</td>
							</tr>
							<tr>
								<td>
									<c:out value="${html2}" escapeXml="false" />
								</td>
							</tr>
						</table>
						<!-- start data tag -->
						<c:out value="${tag1 }"/>
						<!-- end data tag -->
						<input type="button" value="등록" onclick="javascript:goInsertForm('Insert');" />
					</div> --%>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<div id="footer">
	<!-- Footer Part -->
	<jsp:directive.include file="/WEB-INF/views/templates/footer.jsp" />
</div>

</body>
</html>