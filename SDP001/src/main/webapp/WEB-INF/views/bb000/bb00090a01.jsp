<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		fncComment();
	});
	
	var fncComment = function(){
		var id = $("#board_id").val();
		
		$.ajax({
			type: "post",
			url: "/common/comment.json",
			data: { 
					board_id : id
				  },
			dataType: "json",
			async: false,
		    error: function(e) { alert("정보전송에 실패하였습니다."); return false; },
			success: function(result){
				$.each(result, function(key){
					var list = result[key];
					var date;
					
					var html = "<table id='comment_table' border='1'>";
					if(list.length > 0){
						for(i = 0; i < list.length; i++){
							date = new Date(list[i].cre_dt);
							html += "<tr>";
							if(list[i].level > 1){
								html += "	<td>" + list[i].cre_id + "&nbsp;<a href='#' onclick='javascriipt:fncAddComment(this, \"" + list[i].comment_id + "\");'>댓글</a>" + "</td>";
								html += "	<td>[re:]" + list[i].comments + "</td>";
								html += "	<td>" + date.toFormatString('yyyy-mm-dd HH:mm:ss') + "</td>";
							}else{
								html += "	<td>" + list[i].cre_id + "&nbsp;<a href='#' onclick='javascriipt:fncAddComment(this, \"" + list[i].comment_id + "\");'>댓글</a>" + "</td>";
								html += "	<td>" + list[i].comments + "</td>";
								html += "	<td>" + date.toFormatString('yyyy-mm-dd HH:mm:ss') + "</td>";
							}
							html += "</tr>";
						}
					}else{
						html += "<tr>";
						html += "	<td colspan='3'>작성된 댓글이 없습니다.</td>";
						html += "</tr>";
					}
					html += "	<tr class='mainComment'>";
					html += "		<td><input type='text' name='user_id' value='아이디' /></td>";
					html += "		<td><textarea name='comments' onmousedown='javascript:fncNoComment(\"mc\");' onblur='javascript:fncNoComment(\"mb\");'>댓글을 입력해주세요.</textarea></td>";
					html += "		<td><input type='button' value='확인' onclick='javascript:fncCommentInsert(\"\");'/></td>";
					html += "	</tr>";
					
					html += "</table>";
					$("#comment_part").html(html);
				});
			}
		});
	}
	
	function fncCommentInsert(comment_id){
			var id = $("#board_id").val();
			var user_id = "";
			var comment = "";
			var parent_id = "";
		if(comment_id == ''){
			user_id = $(".mainComment td input[name=user_id]").val();
			comments = $(".mainComment td textarea[name=comments]").val();
			parent_id = "";
		}else{
			user_id = $(".addedComment td input[name=user_id]").val();
			comments = $(".addedComment td textarea[name=comments]").val();
			parent_id = comment_id;
		}
		
		$.ajax({
			type : "post",
			url : "/common/commentInsert.json",
			data : {
				cre_id : user_id,
				comments : comments,
				board_id : id,
				parent_id : parent_id
			},
			dataType : "json",
			async : false,
			error: function(e) { alert("댓글 등록에 실패하였습니다."); return false; },
			success: function(result){
				if(result){
					alert("댓글이 등록되었습니다.");
					fncComment();
				}
			}
		});
	}
	
	function fncNoComment(gubun){
		var comment = "";
		var idx = "";
		
		if(gubun.indexOf("m") < 0){
			idx = $(".addedComment");
			comment = $(".addedComment").find("textarea").val();
		}else{
			idx = $(".mainComment");
			comment = $(".mainComment").find("textarea").val();
		}
		
		if(gubun.indexOf("b") < 0){
			if(comment == "댓글을 입력해주세요."){
				idx.find("textarea").val("");
			}
		}else{
			if(comment == ""){
				idx.find("textarea").val("댓글을 입력해주세요.");
			}
		}
	}
	
	function fncAddComment(row, comment_id){
		$(".addedComment").prev().find("a").text("답변");
		$(".addedComment").prev().find("a").attr("onclick", "javascript:fncAddComment(this, \"" + comment_id + "\");");
		$(".addedComment").remove();
		$(row).text("답변취소");
		$(row).attr("onclick", "javascript:fncRemoveComment(this, \"" + comment_id + "\");");
		var html = "<tr class='addedComment'>";
		html += "	<td><input type='text' name='user_id' value='아이디' /></td>";
		html += "	<td><textarea name='comments' onmousedown='javascript:fncNoComment(\"ac\");' onblur='javascript:fncNoComment(\"ab\");'>댓글을 입력해주세요.</textarea></td>";
		html += "	<td><input type='button' value='확인' onclick='javascript:fncCommentInsert(\"" + comment_id + "\");'/></td>";
		html += "</tr>";
		$(row).parent().parent().after(html);
	}
	
	function fncRemoveComment(row, comment_id){
		$(".addedComment").prev().find("a").text("답변");
		$(".addedComment").attr("onclick", "javascript:fncAddComment(this, \"" + comment_id + "\");");
		$(".addedComment").remove();
	}
	
	// timestamp 를 원하는 Date 형식으로 바꾸는 prototype.
	Date.prototype.toFormatString = function(fmt){
		if(!this.valueOf()) return "";
		
		var dt = this;
		return fmt.replace(/(yyyy|yy|mm|dd|hh|hh24|mi|ss|am|pm)/gi,
			function($1){
				switch($1){
					case 'yyyy' : return dt.getFullYear();
					case 'yy' : return dt.getFullYear().toString().substr(2);
					case 'mm' : if(dt.getMonth() < 9){
									return "0" + (dt.getMonth() + 1);
								}else{
									return dt.getMonth() + 1;
								}
					case 'dd' : if(dt.getDate() < 10){
									return "0" + dt.getDate();
								}else{
									return dt.getDate();
								} 
					case 'hh' : return (h=dt.getHours() % 12) ? h : 12;
					case 'HH' : if(dt.getHours() < 10){
									return "0" + dt.getHours();
								}else{
									return dt.getHours();
								} 
					case 'mm' : if(dt.getMinutes < 10){
									return "0" + dt.getMinutes();
								}else{
									return dt.getMinutes();
								} 
						
					case 'ss' : if(dt.getSeconds() < 10){
									return "0" + dt.getSeconds();
								}else{
									return dt.getSeconds();
								}
					case 'am' : return dt.getHours() < 12 ? 'am' : 'pm';
					case 'pm' : return dt.getHours() < 12 ? 'am' : 'pm';
				}
			}
		);
	}
</script>
<div id="comment_part">
</div>