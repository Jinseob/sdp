<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css" />
<link rel="stylesheet" type="text/css" href="/../css/jquery-datepicker.css" />
<link rel="stylesheet" type="text/css" href="/../css/jquery-datepicker-ko.css" />
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript" src="/../js/jquery-datepicker.js"></script>
<script type="text/javascript" src="/../js/jquery-datepicker-ko.js"></script>
<script type="text/javascript" src="/../js/common.js" ></script>
<script type="text/javascript">
	$(document).ready(function (){
			$("#datepicker").datepicker();
	});
<%-- 
	<c:out value="${script_tag1}" escapeXml="false"/>
	
	var fwBoard = new th.board("actionfrm");
	function goDetail(board_id){
		$("#board_id").val(board_id);
		$("#frm").attr({"action" : "/BB001/BB00100FormD.do", "method" : "post", "target" : "_self"}).submit();
	}
	
	function goInsertForm(gubun){
		$("#gubun").val(gubun);
		$("#frm").attr({"action" : "/BB001/BB00100FormI.do", "method" : "post", "target" : "_self"}).submit();
	}
--%>
</script>

<title>서울지역</title>
</head>
<body>
<!-- Header Part -->
<!-- Body Part -->
<form name="frm" id="frm">
	<input type="hidden" name="board_id" id="board_id" value="<c:out value='${bb008.board_id }' />" />
	<input type="hidden" name="gubun" id="gubun" value="<c:out value="${bb008.gubun }" />" />
	<input type="hidden" name="writingNo" id="writingNo" value="" />
	<input type="hidden" name="mode" id="mode" value="" />
</form>
<div id="header">
	<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
</div>
<div id="wrap">
	<div id="left">
		<jsp:directive.include file="/WEB-INF/views/templates/left.jsp" />
	</div>
	<div id="Seoul_news">
		<input type="text" id="datepicker">
		<table border="0" cellpadding="0" cellspacing="0">
			<colgroup>
				<col width="15%">
				<col width="85%">
			</colgroup>
			<c:forEach items="${seoul_news}" var="seoul_news" varStatus="status">
				<tr>
					<td colspan="2" align="left" title='▣<c:out value="${seoul_news.title }" />' onclick="javascript:new_screen('${seoul_news.detail_url}');" style="cursor:pointer;" >
				<c:choose>
					<c:when test="${fn:length(seoul_news.title) > 42}">
						<font color="black" style="font-weight: bold; font-size: 17px;">▣<c:out value="${fn:substring(seoul_news.title,0,42)}" />...</font>
						&nbsp;<c:out value="${seoul_news.write_dt }" />
					</c:when>
					<c:otherwise>
						<font color="black" style="font-weight: bold; font-size: 17px;">▣<c:out value="${seoul_news.title }" /></font>
						&nbsp;<c:out value="${seoul_news.write_dt }" />
					</c:otherwise>
				</c:choose>
					</td>
				</tr>
				<tr>
			<c:choose>
				<%-- <c:when test="${seoul_news.list_img ne '' != false }"> --%>
				<c:when test="${'1' == '0'}">
					<td align="left"><img src='<c:out value="${seoul_news.list_img }" />' width="150px" height="150px" /></td>
					<td align="left" valign="top" style="padding:10px 0px 0px 10px;"><font color="black"><c:out value="${seoul_news.content }" /></font></td>
				</c:when>
				<c:otherwise>
					<td align="left" valign="top" style="padding:10px 0px 0px 10px;" colspan="2"><font color="black"><c:out value="${seoul_news.content }" /></font></td>
				</c:otherwise>
			</c:choose>
				</tr>
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
	<div id="right"></div>
</div>
<div id="footer">
	<!-- Footer Part -->
	<%-- <jsp:directive.include file="/WEB-INF/views/templates/footer.jsp" /> --%>
</div>

</body>
</html>