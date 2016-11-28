<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp" />
<script type="text/javascript">
function content_grade(gbn) {
	
	var frm = document.frm;
	
	for(var i=1; i<=10; i++){
		if(i<=gbn) {
			$("#grade"+i).html("★");
		} else {
			$("#grade"+i).html("☆");
		}
	}
	$("#grade_num").val(gbn);
}

function go_grade() {
	
	var frm = document.frm;
	var board_id = $("#board_id").val();
	var grade = $("#grade_num").val();
	
	if(grade == 0) {
		alert('평점을 입력해주세요.');
		return;
	}
	
	$.ajax({
		type: "post",
		url: "grade_add.json",
		data: { grade : grade
				,board_id : board_id},
		dataType: "json",
		async: false,
	    error: function(e) { alert("정보전송에 실패하였습니다."); return false; },
		success: function(result){
			alert('평점참여완료');
			 $('#pop1').hide();
			 
			 $('#grade_open').hide();
			 $('#grade_end').show();
		}
	});
}

$(document).ready(function(){
      $('#grade_open').click(function() {
          $('#pop1').show();
        });
	
      $('#grade_ins').click(function() {
    	  go_grade();
        });
	
      $('#grade_close').click(function() {
          $('#pop1').hide();
        });
      
      $('#grade_end').hide();
      
});
</script>

<c:choose>
	<c:when test="${fn:length(bb_se_user_id) == 0}"> <%-- 조건 좀 생각해보기 --%> <%-- 로그인 안했을 경우 --%>
	<span id="grade_open" style="border:1px solid black;">평점참여</span>는 로그인 하시면 가능합니다.
	</c:when>
	<c:when test="${grade_cnt!='0'}"><%-- 로그인 했지만 평점을 작성한경우 --%>
	이미 <span id="grade_open" style="border:1px solid black;">평점참여</span>를 하셨습니다.
	</c:when>
	<c:otherwise> <%-- 평점 작성을 안한 경우 --%>
<span id="grade_open" style="border:1px solid black; cursor:pointer;">평점참여</span>
<span id="grade_end" style="border:1px solid black;">참여완료</span>
<div id="pop1" align="left" style="display:none;">
 	<div style="height:70px;">
<c:forEach var="cnt" begin="1" end="10" step="1">
		<span id="grade${cnt}" onclick="javascript:content_grade('${cnt}');" style="cursor:pointer;">☆</span>
</c:forEach>
		&nbsp;<input type="text" id="grade_num" name="grade_num" value="0" size="2" disabled />
	</div>
	  <div style="width:150px; margin: 0px 0px 0px 0px;">
		<input type="button" name="grade_ins" id="grade_ins" value="확인"  />
		<input type="button" name="grade_close" id="grade_close" value="닫기"  />
			</div>
</div>
	</c:otherwise>
</c:choose>
