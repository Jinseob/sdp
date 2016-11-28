<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/../css/common.css" />
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<script type="text/javascript" src="/../js/calendar.js" ></script>
<script type="text/javascript" src="/../js/validation.js" ></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
	<div id="header">
		<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
	</div>
	<div id="main">
		<div id="left"></div>
		<div id="container">
			<table style="width: 50%; border: 1px solid red;">
				<colgroup>
					<col width="5%" />
					<col width="60%" />
					<col width="10%" />
					<col width="10%" />
					<col width="15%" />
				</colgroup>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>정원</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(bb001List) == 0 }" >
						<tr>
							<td colspan="5">작성된 글이 없습니다.</td>
						</tr>				
					</c:when>
					<c:otherwise>
						<c:forEach items="${bb001List }" var="list" varStatus="status">
							<tr>
								<td><c:out value="${status.index }" /></td>
								<td><c:out value="${list.title }" /></td>
								<td><c:out value="${list.allow_cnt }" /></td>
								<td><c:out value="${list.reg_id }" /></td>
								<td><c:out value="${list.reg_dt }" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			
			<table style="width: 50%; border: 1px solid red;">
				<colgroup>
					<col width="5%" />
					<col width="60%" />
					<col width="10%" />
					<col width="10%" />
					<col width="15%" />
				</colgroup>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>정원</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(bb008List) == 0 }" >
						<tr>
							<td colspan="5">작성된 글이 없습니다.</td>
						</tr>				
					</c:when>
					<c:otherwise>
						<c:forEach items="${bb008List }" var="list" varStatus="status">
							<tr>
								<td><c:out value="${status.index }" /></td>
								<td><c:out value="${list.title }" /></td>
								<td><c:out value="${list.user_cnt }" /></td>
								<td><c:out value="${list.reg_id }" /></td>
								<td><c:out value="${list.reg_dt }" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div id="right"></div>
	</div>
	<div id="footer"></div>
</div>

</body>
</html>