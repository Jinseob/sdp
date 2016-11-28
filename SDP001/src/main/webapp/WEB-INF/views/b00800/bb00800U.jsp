<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<title>게시판</title>
<script type="text/javascript">
	function goSave(){
		$("#frm").attr({"action" : "/BB008/BB00800Processing.do", "method" : "post", "target" : "_self"}).submit();
	}
</script>
</head>
<body>
<!-- Header Part -->
<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
<!-- Body Part -->
<form name="frm" id="frm">
	<input type="hidden" name="board_id" id="board_id" value="<c:out value="${bb008VO.board_id }" />" />
	<input type="hidden" name="gubun" id="gubun" value="<c:out value="${bb008VO.gubun }" />" />
	<table border="1">
		<colgroup>
			<col width="20%">
			<col width="30%">
			<col width="20%">
			<col width="30%">
		</colgroup>
		<tr>
			<th>제목</th>
			<td colspan="3"><input type="text" name="title" id="title" value="<c:out value="${detail.title }" />" title="제목" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3"><textarea name="content" id="content" title="내용"><c:out value="${detail.content }" /></textarea></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3"><input type="text" name="reg_id" id="reg_id" value="<c:out value="${detail.reg_id }" />" title="작성자" /></td>
		</tr>
		<tr>
			<th>신청인원 수</th>
			<td><input type="text" name="user_cnt" id="user_cnt" value="<c:out value="${detail.user_cnt }" />" /></td>
			<th>작성일</th>
			<td><c:out value="${detail.reg_dt }" /></td>
		</tr>
	</table>
</form>
<input type="button" value="저장" onclick="javascript:goSave();" />
<input type="button" value="취소" onclick="javascript:history.back();" />
<!-- Footer Part -->
<jsp:directive.include file="/WEB-INF/views/templates/footer.jsp" />
</body>
</html>