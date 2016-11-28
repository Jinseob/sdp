<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript">
	function goDetail(board_id){
		$("#board_id").val(board_id);
		$("#frm").attr({"action" : "/BB008/BB00800FormD.do", "method" : "post", "target" : "_self"}).submit();
	}
	
	function goInsertForm(gubun){
		$("#gubun").val(gubun);
		$("#frm").attr({"action" : "/BB008/BB00800FormI.do", "method" : "post", "target" : "_self"}).submit();
	}
	
	function goLayoutTest(){
		$("#frm").attr({"action" : "/BB001/BB00100FormL.do", "method" : "post"}).submit();
	}
</script>
<title>게시판</title>
</head>
<body>
<!-- Header Part -->
<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
<!-- Body Part -->
<form name="frm" id="frm">
	<input type="hidden" name="board_id" id="board_id" value="<c:out value='${bb008.board_id }' />" />
	<input type="hidden" name="gubun" id="gubun" value="<c:out value="${bb008.gubun }" />" />
</form>
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
<input type="button" value="등록" onclick="javascript:goInsertForm('Insert');" />
<input type="button" value="layout_test" onclick="javascript:goLayoutTest();" />
<!-- Footer Part -->
<jsp:directive.include file="/WEB-INF/views/templates/footer.jsp" />
</body>
</html>