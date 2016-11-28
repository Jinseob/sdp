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
		document.frm.past_id.value="";
 		document.frm.action = "BB00310c01.do";
		document.frm.submit();
	}
	
	function go_Detail(key) {
		document.frm.past_id.value=key;
		
 		document.frm.action = "BB00310b01.do";
		document.frm.submit();
	}
</script>

<title>벽보(찾아보-그때그사람)</title>
</head>
<body>
<!-- Header Part -->
<!-- Body Part -->
<form name="frm" id="frm" method="post">
<input type="hidden" name="past_id" value="">
<div id="header">
	<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
</div>
	<br />
<div id="wrap">
	<div id="left">
		<jsp:directive.include file="/WEB-INF/views/bb003/bb003_left.jsp" />
	</div>
	<div id="container">
	<table width="90%" border="1" cellpadding="0" cellspacing="0">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="22%">
			<col width="8%">
			<col width="5%">
			<col width="15%">
		</colgroup>
		<tr>
			<td>지역</td>
			<td>제목</td>
			<td>장소</td>
			<td>조회수</td>
			<td>평점</td>
			<td>작성일자</td>
		</tr>
	<c:forEach items="${find_past}" var="find_past" varStatus="status">
		<tr style="cursor:pointer;" title="<c:out value='${find_past.title}' />" onclick="javascript:go_Detail('<c:out value='${find_past.past_id}' />');" >
			<td><c:out value="${find_past.local3_nm}" /></td>
	<c:choose>
		<c:when test="${fn:length(find_past.date_diff) < 1}">
			<td align="left"><c:out value="${find_past.title}" />&nbsp;<font color="red">[<c:out value="${find_past.comment_cnt}" />]</font></td>
		</c:when>
		<c:otherwise>
			<td align="left"><font color="red">[<c:out value="${find_past.date_diff}" />]</font>&nbsp;<c:out value="${find_past.title}" />&nbsp;<font color="red">[<c:out value="${find_past.comment_cnt}" />]</font></td>
		</c:otherwise>
	</c:choose>
			<td><c:out value="${find_past.place}" /></td>
			<td><c:out value="${find_past.view_cnt}" /></td>
			<td><c:out value="${find_past.grade}" /></td>
			<td><fmt:formatDate value="${find_past.cre_dt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</c:forEach>
	</table>
	<br />
	<table align="right">
		<tr>
			<td>
				<input type="button" value="등록하기" onclick="javascript:go_Ins();" />
			</td>
		</tr>
	</table>
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