<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<script type="text/javascript">
	$(document).ready(function(){
		/* chkUser(); */
		
		if('<c:out value="${bb_se_user_nm }" />' != '') {
			setTimeout(function auto_logout() {alert('동작이 없어 로그아웃합니다.');fncLogout();},10*60*1000);
		}
	});
	
	function chkUser(){
		var user_id = '<c:out value="${user_id}" />';
		if(user_id.length > 0){
			
		}else{
			location.href = "/loginForm.do";
		}
	}
	
	function fncLogout(){
		location.href = "/logout.do";
	}
	
	function userForm() {
		location.href = "/userForm.do";
	}
	
	function fncLogin() {
		location.href = "/loginForm.do";
	}
	
	function userInfo() {
		location.href = "/userInfo_chk.do";
	}
</script>
<div id="top">
	<table width="100%">
		<colgroup>
			<col width="15%" />
			<col width="40%" />
			<col width="35%" />
		</colgroup>
		<tr>
			<td>
				<a href="/main.do"><img alt="logo" src="/../img/logo.jpg"></a>
			</td>
			<td align="left">
				<input type="text" id="searchText" name="searchText" value="" />
			</td>
			<td align="right">
				<c:choose>
					<c:when test="${fn:length(bb_se_user_id) == 0}"> <%-- 좀 생각해보기 --%>
						<input type="button" value="회원가입" onclick="javascript:userForm();">&nbsp;
						<input type="button" value="로그인" onclick="javascript:fncLogin();">&nbsp;
					</c:when>
					<c:otherwise>
						<strong><c:out value="${bb_se_user_nm }" /></strong>&nbsp;님&nbsp;환영합니다.
						<input type="button" value="정보수정" onclick="javascript:userInfo();">&nbsp;
						<input type="button" value="로그아웃" onclick="javascript:fncLogout();">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</div>
<div id="bottom">
	<a href="/BB001/BB00100FormL.do"><img alt="소식보" src="/../img/btn_01.gif" /></a>
	<a href="javascript:alert('기사');"><img alt="기사" src="/../img/btn_02.gif" /></a>
	<a href="javascript:alert('모임');"><img alt="모임" src="/../img/btn_03.gif" /></a>
	<a href="javascript:alert('핫핑크');"><img alt="핫핑크" src="/../img/btn_04.gif" /></a>
	<a href="javascript:alert('알림');"><img alt="알림" src="/../img/btn_05.gif" /></a>
	<a href="/BB00310a01.do">찾아보</a>
	<a href="javascript:alert('아껴보');">아껴보</a>
	<a href="/BB005/BB00500FormL.do">이곳보</a>
	<a href="javascript:alert('자유보');">자유보</a>
	<a href="/BB001/test.do">test</a>
</div>
