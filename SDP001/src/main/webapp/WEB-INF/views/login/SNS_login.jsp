<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css"/>
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript" src="/../js/jquery.cookie.js" ></script>
<script type="text/javascript" src="/../js/common.js" ></script>
<script type="text/javascript">

	$(document).ready(function(){
	});
	
</script>

<title>state token</title>
</head>
<body>
<div id="header">
	<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
</div>
<div id="wrap">

<%-- 	<c:out value='${mv}' /> <br /><br /> --%>

	<font size="20"><c:out value='${snsName}' /></font> <br /><br />  
	
	<c:forEach items="${mv_split}" var="mv_split" varStatus="status">
		<c:out value='${mv_split}' /> <br />
	</c:forEach>
</div>

<form id="frm" name="frm" method="post">
	<input type="hidden" id="state" name="state" value="<c:out value='${state}' />" />
	<input type="hidden" id="code" name="code" value="<c:out value='${code}' />" />
</form>
</body>
</html>