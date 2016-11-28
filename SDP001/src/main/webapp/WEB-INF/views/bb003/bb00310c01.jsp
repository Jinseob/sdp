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
	function go_ins() {
		var frm = document.frm;
		
		if(!doFormValidate( frm )) {
			return;
		}

		frm.action = "BB00310c02.do";
		frm.submit();
	}
	
	function go_back() {
		frm.action = "BB00310a01.do";
		frm.submit();
	}
</script>

<title>벽보(찾아보-그때그사람)</title>
</head>
<body id="body">
	<div id="header">
		<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
	</div>
	<div id="wrap">
		<div id="left">
			<jsp:directive.include file="/WEB-INF/views/bb003/bb003_left.jsp" />
		</div>
		<form name="frm" id="frm" method="post">
			<div align="left">
				<input type="hidden" name="past_id" id="past_id" value="<c:out value="${find_past.past_id}" />" />
				<select id="local1" name="local1" title="서울, 광역시" req>
					<option value="">선택하세요</option>
					<option value="001">서울특별시</option>
				</select>
				<select id="local2" name="local2" title="시,군,구" req>
					<option value="">선택하세요</option>
					<option value="001">관악구</option>
				</select>
				<select id="local3" name="local3" title="동,읍,면" req>
					<option value="">선택하세요</option>
					<option value="0001">신림동</option>
					<option value="0002">청룡동</option>
					<option value="0003">봉천동</option>
				</select>
				<br /><br />
				제목 : <input type="text" id="title" name="title" title="제목" maxlength="50" size="50"  value="<c:out value="${find_past.title}" />" req /><br /><br />
				내용 : <br />
				<textarea name="content" id="content" title="내용" rows="3" cols="50" style="ime-mode:active;" req><c:out value="${find_past.content}" /></textarea><br /><br />
				장소 : <input type="text" id="place" name="place" title="장소" maxlength="50" size="50"  value="<c:out value="${find_past.place}" />" req /><br />
				연락처 : <input type="text" id="tel" name="tel" title="전화번호" maxlength="50" size="50"  value="<c:out value="${find_past.tel}" />" req />
			</div>
			
			<div align="right">
				<br />
				<input type="button" name="insert" id="insert" value="등록하기" onclick="javascript:go_ins();" />&nbsp;
				<input type="button" name="cancel" id="cancel" value="돌아가기" onclick="javascript:go_back();" />
			</div>
		</form>
	</div>
	
</body>
</html>