<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css" />
<script type="text/javascript" src="/../js/validator.js" ></script>
<script type="text/javascript" src="/../js/jquery-1.11.2.js"></script>
<script type="text/javascript">
	function go_Up() {
 		document.frm.action = "BB00310c01.do";
		document.frm.submit();
	}
	
	function go_List() {
 		document.frm.action = "BB00310a01.do";
		document.frm.submit();
	}
</script>

<title>벽보(찾아보-그때그사람) 상세보기</title>
</head>
<body id="body">
<form name="frm" id="frm" method="post">
	<input type="hidden" name="past_id" id="past_id" value="<c:out value="${find_past.past_id}" />" />
	<input type="hidden" name="board_id" id="board_id" value="<c:out value="${find_past.past_id }" />" />
	<div id="header">
		<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
	</div>
	<div id="wrap">
		<div id="left">
		<jsp:directive.include file="/WEB-INF/views/bb003/bb003_left.jsp" />
		</div>
		<div id="container">
			<div align="left">
				[<c:out value="${find_past.local3_nm}" />]&nbsp;<c:out value="${find_past.title}" />
				&nbsp;<font color="red">[<c:out value="${find_past.comment_cnt}" />]</font><br />
				홍길동 | <fmt:formatDate value="${find_past.cre_dt}" pattern="yyyy-MM-dd HH:mm:ss" /> | 조회수 <c:out value="${find_past.view_cnt}" /> | 평점 <c:out value="${find_past.grade}" /><br><br />
				
				<div style="width:500px; height:200px; background:white; overflow-x:hidden;overflow-y:scroll; border:1px solid black;">
				<c:out value="${find_past.content}" /><br /><br />
				</div>
				<br />
				장소 : <c:out value="${find_past.place}" /><br />
				연락처 : <c:out value="${find_past.tel}" />
			</div>
			<br />
			<br />
			<jsp:directive.include file="/WEB-INF/views/bb000/bb00080a01.jsp" />
			<br />
			<br />
			<jsp:directive.include file="/WEB-INF/views/bb000/bb00090a01.jsp" />
		</div>
		<div align="right">
			<br />
			<input type="button" name="update" id="update" value="수정하기" onclick="javascript:go_Up();" />&nbsp;
			<input type="button" name="List" id="List" value="목록보기" onclick="javascript:go_List();" />
		</div>
	</div>
</form>	
</body>
</html>