<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css"/>
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript" src="/../js/common.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		document.frm.user_pw.focus();
	});

	function goChkByDB(){
		if($("#user_pw").val() == "") {
			$("#err_empty_pw").attr({"style" : "display:block"});
		} else {
			$("#frm").attr({"action" : "userInfo_confirm.do", "method" : "post"}).submit();
		}
		
	}
</script>
<title>회원정보 수정 전 확인 화면</title>
</head>
<body>
<form name="frm" id="frm" method="post">
<div id="header">
	<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
</div>
	<br />
<div id="wrap">
	<div id="container">
		<%-- <strong>아 이 디 : </strong><c:out value="${bb_se_user_id }" /> <br /><br /> --%>
		<strong>비밀번호 : </strong><input type="password" name="user_pw" id="user_pw" value="" size="30" maxlength="20"  /><br /><br />
		
		<input type="button" value="확인" onclick="javascript:goChkByDB();"><br /> <br />
		
		<div id="err_empty_pw" style="display:none;"><font color="red">비밀번호를 입력해주세요.</font></div>
		<div id="right"></div>
	</div>
</div>
<div id="footer">
	<!-- Footer Part -->
	<%-- <jsp:directive.include file="/WEB-INF/views/templates/footer.jsp" /> --%>
</div>
</form>
</body>
</html>