<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css" />
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript" src="/../js/common.js" ></script>
<!-- start script tag -->
<c:out value="${tag2 }" escapeXml="false"/>
<!-- end script tag -->
<script type="text/javascript">
	function goSearch(){
		$("#frm").attr({"action" : "/BB001/BB00100GwanakGumin.do", "method" : "post", "target" : "_self"}).submit();
	}
	
</script>

<title>서울지역</title>
</head>
<body>
<!-- Header Part -->
<!-- Body Part -->
<form name="frm" id="frm">
	<div id="header">
		<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
	</div>
	<div id="wrap">
		<div id="left">
			<jsp:directive.include file="/WEB-INF/views/templates/left.jsp" />
		</div>
		
		<div id="Gumin">
			<table border="0" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="45%">
					<col width="20%">
					<col width="20%">
					<col width="15%">
				</colgroup>
				<c:forEach items="${list}" var="list" varStatus="status">
					<tr onclick="javascript:new_screen('<c:out value="${list.detail_url}" />');" style="cursor: pointer;">
						<td align="left">
							<font color="black" style="font-weight: bold; font-size: 17px;">▣<c:out value="${list.title }" /></font>
						</td>
						<td align="left">
							<font color="black"><c:out value="${list.day }" /></font>
						</td>
						<td align="left">
							<font color="black"><c:out value="${list.method }" /></font>
						</td>
						<td align="left">
							<font color="black"><c:out value="${list.status }" /></font>
						</td>
					</tr>
					<tr onclick="javascript:new_screen('<c:out value="${list.detail_url}" />');">
						<td colspan="4" align="left">
							<font color="black"><c:out value="${list.content }" /></font>
						</td>
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
</form>
<div id="footer">
	<!-- Footer Part -->
	<jsp:directive.include file="/WEB-INF/views/templates/footer.jsp" />
</div>

</body>
</html>