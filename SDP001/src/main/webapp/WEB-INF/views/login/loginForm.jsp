<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../css/common.css"/>
<script type="text/javascript" src="/../js/jquery-1.11.2.js" ></script>
<!-- <script type="text/javascript" src="/../js/jquery.cookie.js" ></script> -->
<script type="text/javascript" src="/../js/common.js" ></script>
<script type="text/javascript" src="/../js/facebook.js" ></script>  <%-- facebook --%>
<script type="text/javascript" src="/../js/kakao.min.js"></script>	<%-- kakao --%>
<!--     <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<script type="text/javascript">

	$(document).ready(function(){
		document.frm.user_id.focus();
	});
</script>


<script type="text/javascript">
	function goLoginByDB(){
		var frm = document.frm;
		
		if($("#user_id").val() == "") {
			$("#err_empty_id").attr({"style" : "display:block"});
			$("#err_empty_pw").attr({"style" : "display:none"});
		} else if($("#user_pw").val() == "") {
			$("#err_empty_id").attr({"style" : "display:none"});
			$("#err_empty_pw").attr({"style" : "display:block"});
		} else {
			$("#frm").attr({"action" : "loginByDB.do", "method" : "post"}).submit();
		}
	}
</script>



<title>로그인 화면</title>
</head>
<body>
<form name="frm" id="frm" method="post">
<div id="header">
	<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
</div>
	<br />
<div id="wrap">
	<div id="container">
		<strong>아 이 디 : </strong><input type="text" name="user_id" id="user_id" value="" size="30" maxlength="20" /> <br /><br />
		<strong>비밀번호 : </strong><input type="password" name="user_pw" id="user_pw" value="" size="30" maxlength="20"  /><br /><br />
		
		<input type="button" value="로그인" onclick="javascript:goLoginByDB();"><br /> <br />
		
		<div id="err_empty_id" style="display:none;"><font color="red">아이디를 입력해주세요.</font></div>
		<div id="err_empty_pw" style="display:none;"><font color="red">비밀번호를 입력해주세요.</font></div>
		<div id="right"></div>
	</div>
	<div id="naver_test">
		<a class="btn btn-block btn-social btn-naver" href="<c:out value='${naverOAuthLink}' />" >
			<i class="fa">N</i> 네이버 아이디로 로그인
		</a>
	</div>
	<div id="facebook_test">
		<!-- <button type="button" onClick="facebooklogin();" value="facebook"></button> -->
		<input type="hidden" name="Facebook_res" id="Facebook_res" value="" />
		<input type="button"  id="facebook_login" name="facebook_login" value="페이스북 로그인" onclick="javascript:facebooklogin();" />
		<br /><br />
		<div class="fb-like" data-share="true" data-width="450" data-show-faces="true"></div>
		<div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="false"></div>
		<div id="fb-root"></div>
	</div>
	<div id="kakao_test">
		<a id="kakao-login-btn" ></a>
		<input type="hidden" name="Kakao_res" id="Kakao_res" value="" />
		<!-- <img src="/../img/login/kakao_login_btn.png" /> -->
		
		<script type="text/javascript">
	      // 사용할 앱의 Javascript 키를 설정해 주세요.
	      Kakao.init('7db8534eaf3fc13645b0bd0875ec3c36');
	      
	      // 카카오 로그인 버튼을 생성합니다.
	      Kakao.Auth.createLoginButton({
	        container: '#kakao-login-btn',
	        success: function(authObj) {
	            // 로그인 성공시, API를 호출합니다.
	            Kakao.API.request({
	              url: '/v1/user/me',
	              success: function(res) {
					//alert(JSON.stringify(res));
					$("#Kakao_res").val(JSON.stringify(res));
					$("#frm").attr({"action" : "callback2.do", "method" : "post"}).submit();
	              },
	              fail: function(error) {
	                alert(JSON.stringify(error))
	              }
	            });
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err))
	        }
	      });
		</script>
	</div>
</div>
<div id="footer">
	<!-- Footer Part -->
	<%-- <jsp:directive.include file="/WEB-INF/views/templates/footer.jsp" /> --%>
</div>
</form>
</body>
</html>