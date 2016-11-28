<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<html>
<head>
<<<<<<< .mine
<script type="text/javascript">
	function goLoginForm(){
		var f = document.frm;
		f.action = "loginForm.do";
		f.submit();
	}
</script>
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript" src="/../js/validation.js" ></script>
<script type="text/javascript">
	function goLoginForm(){
		$("#frm").attr({"action" : "loginForm.do", "method" : "post"}).submit();
	}
	
	function goBB00800L(){
		$("#frm").attr({"action" : "BB008/BB00800FormL.do", "method" : "post"}).submit();
	}
</script>
	<title>Home</title>
</head>
<body onload="browser_chk();">
<h1>
	Hello world!  
</h1>

<P> Hello. world </P>
<form name="frm" id="frm">

</form>
<table>
<c:forEach items="${rsltList }" var="rsltList">
	<tr>
		<td>
			<c:out value="${rsltList.title }" />
		</td>
		<td>
			<c:out value="${rsltList.content }" />
		</td>
		<td>
			<c:out value="${rsltList.reg_id }" />
		</td>
		<td>
			<c:out value="${rsltList.reg_dt }" />
		</td>
	</tr>
</c:forEach>
</table>
<<<<<<< .mine
<input type="button" value="login" onclick="javascript:goLoginForm();" />
||||||| .r9
=======
<input type="button" value="login" onclick="javascript:goLoginForm();" />
<input type="button" value="게시판" onclick="javascript:goBB00800L();" />
>>>>>>> .r93
</body>
</html>
