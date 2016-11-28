<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	
});

var goUpdateForm = function(gubun){
	$("#gubun").val(gubun);
	$("#frm").attr({"action":"/BB008/BB00800FormU.do", "method" : "post", "target" : "_self"}).submit();
}

var goList = function(){
	$("#frm").attr({"action":"/BB008/BB00800FormL.do", "method" : "post", "target" : "_self"}).submit();
}
var goApply = function(){
	if(confirm("신청 하시겠습니까?")){
		$("#frm").attr({"action" : "/BB008/BB00800FormA.do", "method" : "post", "target" : "_self"}).submit();
	}else{
		return;
	}
}
var goApplyCancel = function(){
	
}
</script>
</head>
<body>
<!-- Header Part -->
<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
<!-- Body Part -->
<form name="frm" id="frm">
	<input type="hidden" name="board_id" id="board_id" value="<c:out value='${detail.board_id }' />" />
	<input type="hidden" name="gubun" id="gubun" value="" />
</form>
<table border="1">
	<colgroup>
		<col width="20%">
		<col width="30%">
		<col width="20%">
		<col width="30%">
	</colgroup>
	<tr>
		<th>제목</th>
		<td colspan="3"><c:out value="${detail.title }" /></td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3"><c:out value="${detail.content }" /></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td colspan="3"><c:out value="${detail.reg_id }" /></td>
	</tr>
	<tr>
		<th>신청인원 수</th>
		<td><c:out value="${detail.tot_cnt }" />/<c:out value="${detail.user_cnt}" /></td>
		<th>작성일</th>
		<td><c:out value="${detail.reg_dt }" /></td>
	</tr>
</table>
<input type="button" value="신청" onclick="javascript:goApply();" />
<input type="button" value="신청취소" onclick="javascript:goApplyCancel();" />
<input type="button" value="수정" onclick="javascript:goUpdateForm('Update');" />
<input type="button" value="목록" onclick="javascript:goList();" />
<!-- Footer Part -->
<jsp:directive.include file="/WEB-INF/views/templates/footer.jsp" />
</body>
</html>