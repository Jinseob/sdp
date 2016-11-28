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
	var member_flag=false;
	var member_cnt=1;

	function go_ins() {
		var frm = document.frm;
		
		for(var i=0; i<frm.user_gender.length; i++) {
			if(frm.user_gender[i].checked) {
				frm.gender.value = frm.user_gender[i].value;
			}
		}
		
		var b1 = new String(frm.yyyy.value);
		var b2 = new String(frm.mm.value);
		var b3 = new String(frm.dd.value);
		
		if (b2.length < 2) {
			b2 = "0" + b2;
		}

		if (b3.length < 2) {
			b3 = "0" + b3;
		}

		frm.birthday.value = b1 + b2 + b3;
		
		if(!doFormValidate( frm )) {
			return;
		}

		if (frm.user_pw.value != frm.reuser_pw.value) {
			alert('비밀번호가 일치 하지 않습니다.');
			frm.reuser_pw.focus();
			return;
		} else if(frm.yyyy.value.length != 4) {
			alert('연도형식이 일치 하지 않습니다.(ex - 2000)');
			frm.yyyy.focus();
			return;
		}
		
		if(member_flag == false) {
			alert('아이디 중복확인을 해주시기 바랍니다.')
		} else if(member_cnt != 0) {
			alert('존재하는 아이디 입니다.')
		} else {
			$("#frm").attr({"action" : "user_Insert.do", "method" : "post"}).submit();
		}
	}
	
	function go_upt() {
		if(!doFormValidate( frm )) {
			return;
		}
		alert('1111');
		
		$("#frm").attr({"action" : "user_Update.do", "method" : "post"}).submit();
	}

	<%-- 윤년확인--%>
	function setDay() {
		var year = document.getElementById("yyyy").value;
		var month = document.getElementById("mm").value;
		var day = document.getElementById("dd");
		var endDay = 30;
		if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8
				|| month == 10 || month == 12) {
			endDay = 31;
		} else if (month == 4 || month == 6 || month == 9 || month == 11) {
			endDay = 30;
		} else if (month == 2) {
			if (year % 400 == 0) {
				endDay = 29;
			} else if (year % 100 != 0 && year % 4 == 0) {
				endDay = 29;
			} else {
				endDay = 28;
			}
		}
		for (var i =0; i<31; i++) {
			day.remove(0);
		}
		
 		for (var i = 1; i<=endDay; i++) {
  			var option = document.createElement("option");
			var optionDay = document.createTextNode(i);
			option.setAttribute("value", i);
			option.appendChild(optionDay);
			day.appendChild(option);
		}
	}
	
	function dup_chk() {
		var id = $("#user_id").val();
		
		if(id == '') {
			alert('아이디를 입력해주십시오.');
		}
		
		$.ajax({
			type: "post",
			url: "member_dup.json",
			data: { user_id : id  },
			dataType: "json",
			async: false,
		    error: function(e) { alert("정보전송에 실패하였습니다."); return false; },
			success: function(result){
				member_flag = true;
				member_cnt = result.Dcnt;
			}
		});
		
		if(member_cnt == 0) {
			alert('사용가능한 아이디입니다.');
		} else {
			alert('중복된 아이디입니다.');
		}
	}
	
	function id_keyup() {
		<%-- 중복확인 후 아이디를 변경할 수 있으므로 아이디 변경시 초기화 --%>
		member_flag = false;
		member_cnt = 1;
	}
</script>


<%-- 눈내림효과 --%>
<script type="text/javascript">

/******************************************
* Snow Effect Script- By Altan d.o.o. (http://www.altan.hr/snow/index.html)
* Visit Dynamic Drive DHTML code library (http://www.dynamicdrive.com/) for full source code
* Last updated Nov 9th, 05' by DD. This notice must stay intact for use
******************************************/
  
  //Configure below to change URL path to the snow image
  var snowsrc="http://www.paris.co.kr/images/@temp/snow2.png";
  // Configure below to change number of snow to render
  var no = 10;
  // Configure whether snow should disappear after x seconds (0=never):
  var hidesnowtime = 0;
  // Configure how much snow should drop down before fading ("windowheight" or "pageheight")
  var snowdistance = "pageheight";


///////////Stop Config//////////////////////////////////

	var ie4up = (document.all) ? 1 : 0;
	var ns6up = (document.getElementById&&!document.all) ? 1 : 0;

	function iecompattest() {
		return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement
				: document.body
	}

	var dx, xp, yp; // coordinate and position variables
	var am, stx, sty; // amplitude and step variables
	var i, doc_width = 800, doc_height = 600;

	if (ns6up) {
		doc_width = self.innerWidth;
		doc_height = self.innerHeight;
	} else if (ie4up) {
		doc_width = iecompattest().clientWidth;
		doc_height = iecompattest().clientHeight;
	}

	dx = new Array();
	xp = new Array();
	yp = new Array();
	am = new Array();
	stx = new Array();
	sty = new Array();
	snowsrc = (snowsrc.indexOf("dynamicdrive.com") != -1) ? "snow.gif"
			: snowsrc
	for (i = 0; i < no; ++i) {
		dx[i] = 0; // set coordinate variables
		xp[i] = Math.random() * (doc_width - 50); // set position variables
		yp[i] = Math.random() * doc_height;
		am[i] = Math.random() * 20; // set amplitude variables
		stx[i] = 0.02 + Math.random() / 10; // set step variables
		sty[i] = 0.7 + Math.random(); // set step variables
		if (ie4up || ns6up) {
			if (i == 0) {
				//document.write("<div id=\"dot"+ i +"\" style=\"POSITION: absolute; Z-INDEX: "+ i +"; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><a href=\"http://dynamicdrive.com\"><img src='"+snowsrc+"' border=\"0\"><\/a><\/div>");
				document
						.write("<div id=\"dot"+ i +"\" style=\"POSITION: absolute; Z-INDEX: "+ i +"; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><a href=\"http://www.naver.com\"><img src='"+snowsrc+"' border=\"0\"><\/a><\/div>");
			} else {
				document
						.write("<div id=\"dot"+ i +"\" style=\"POSITION: absolute; Z-INDEX: "+ i +"; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><img src='"+snowsrc+"' border=\"0\"><\/div>");
			}
		}
	}

	function snowIE_NS6() { // IE and NS6 main animation function
		doc_width = ns6up ? window.innerWidth - 10
				: iecompattest().clientWidth - 10;
		doc_height = (window.innerHeight && snowdistance == "windowheight") ? window.innerHeight
				: (ie4up && snowdistance == "windowheight") ? iecompattest().clientHeight
						: (ie4up && !window.opera && snowdistance == "pageheight") ? iecompattest().scrollHeight
								: iecompattest().offsetHeight;
		for (i = 0; i < no; ++i) { // iterate for every dot
			yp[i] += sty[i];
			if (yp[i] > doc_height - 50) {
				xp[i] = Math.random() * (doc_width - am[i] - 30);
				yp[i] = 0;
				stx[i] = 0.02 + Math.random() / 10;
				sty[i] = 0.7 + Math.random();
			}
			dx[i] += stx[i];
			document.getElementById("dot" + i).style.top = yp[i] + "px";
			document.getElementById("dot" + i).style.left = xp[i] + am[i]
					* Math.sin(dx[i]) + "px";
		}
		snowtimer = setTimeout("snowIE_NS6()", 10);
	}

	function hidesnow() {
		if (window.snowtimer)
			clearTimeout(snowtimer)
		for (i = 0; i < no; i++) {
			document.getElementById("dot" + i).style.visibility = "hidden"
		}
	}

	function snow_init() {
		if (ie4up || ns6up) {
			snowIE_NS6();
			if (hidesnowtime > 0) {
				setTimeout("hidesnow()", hidesnowtime * 1000)
			}
		}
	}
	
	$(document).ready(function(){
		//snow_init();
	});

</script>

<title>회원가입</title>
</head>
<body id="body">
	<div id="header">
		<jsp:directive.include file="/WEB-INF/views/templates/header.jsp" />
	</div>
	<form name="frm" id="frm" method="post">
		<div align="left">
<c:choose>
	<c:when test="${course_confirm == 1}"> <%--정보수정 --%>
			아이디 : <input type="text" name="user_id" id="user_id" value="<c:out value="${userInfo.user_id}" />" maxlength="20" size="20"  title="아이디" disabled /><br />
			비밀번호 : <input type="password" name="user_pw" id="user_pw" value="" maxlength="20" size="20"  title="비밀번호" req/> <br />
			이름 : <input type="text"	name="user_nm" id="user_nm" value="<c:out value="${userInfo.user_nm}" />" maxlength="10" size="20" title="이름"  req/><br />
			연락처 : <select id="na" title="연락처" onChange="" req>
					<option value="+82">+82</option>
				</select>
				<input type="text" name="cellphone1" id="cellphone1" maxlength="3" size="3" value="<c:out value="${userInfo.cellphone1}" />" req/>&nbsp;
				<input type="text" name="cellphone2" id="cellphone2" maxlength="4" size="4" value="<c:out value="${userInfo.cellphone2}" />" req/>&nbsp;
				<input type="text" name="cellphone3" id="cellphone3" maxlength="4" size="4" value="<c:out value="${userInfo.cellphone3}" />" req/><br />
			<br />
			<input type="button" name="insert" id="insert" value="정보변경" onclick="javascript:go_upt();" />&nbsp;
			<input type="button" name="cancel" id="cancel" value="돌아가기" onclick="javascript:history.back(-1);" />
			<br />
	</c:when>
	<c:otherwise> <%--회원가입 --%>
			<input type="hidden" name="birthday" id="birthday" value=""  title="생년월일" req/>
			<input type="hidden" name="gender" id="gender" value="" title="성별" />
	
			아이디 : <input type="text" name="user_id" id="user_id" value="" maxlength="20" size="20"  title="아이디" onkeyup="javascript:id_keyup();" req/>&nbsp;&nbsp;
			<input type="button" name="dup" id="dup" value="중복확인" onclick="javascript:dup_chk();" /><br />
			비밀번호 : <input type="password" name="user_pw" id="user_pw" value="" maxlength="20" size="20"  title="비밀번호" req/> <br />
			비밀번호 확인 : <input type="password" name="reuser_pw" id="reuser_pw" value="" maxlength="20" size="20"  title="비밀번호 확인" req/><br />
			이름 : <input type="text"	name="user_nm" id="user_nm" value="" maxlength="10" size="20" title="이름"  req/><br />
			성별 : 남자<input type="radio" name="user_gender" id="user_gender" value="male" />&nbsp;
				여자<input type="radio" name="user_gender" id="user_gender" value="female" /> <br />
			생년월일 : <input type="text" title="생년월일" name="yyyy" id="yyyy" maxlength="4" size="4" onChange="javascript:setDay();" req/>년&nbsp; 
					<select id="mm" name="mm" onChange="javascript:setDay();">
						<c:forEach begin="1" end="12" varStatus="stat">
							<option value="${stat.count}">${stat.count}</option>
						</c:forEach>
					</select> 월&nbsp;
					<select id="dd" name="dd">
						<c:forEach begin="1" end="31" varStatus="stat">
							<option value="${stat.count}">${stat.count}</option>
						</c:forEach>
					</select>일<br />
			연락처 : <select id="na" title="연락처" onChange="" req>
					<option value="+82">+82</option>
				</select>
				<input type="text" name="cellphone1" id="cellphone1" maxlength="3" size="3" req/>&nbsp;
				<input type="text" name="cellphone2" id="cellphone2" maxlength="4" size="4" req/>&nbsp;
				<input type="text" name="cellphone3" id="cellphone3" maxlength="4" size="4" req/><br />
			<br />
			<input type="button" name="insert" id="insert" value="회원가입" onclick="javascript:go_ins();" />&nbsp;
			<input type="button" name="cancel" id="cancel" value="돌아가기" onclick="javascript:history.back(-1);" />
	</c:otherwise>
</c:choose>
		</div>
	</form>
	
</body>
</html>