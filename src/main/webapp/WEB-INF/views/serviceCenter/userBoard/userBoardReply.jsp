<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원게시판 댓글</title>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
	
		
		
		
		/* 기본 댓글 목록 불러오기 */
		var userboard_number = "<c:out value='${userBoardDetail.userboard_number}'/>";
		listAll(userboard_number)
	
	
	/* 댓글 내용 저장 이벤트 */
	$("#userBoardReplyInsert").click(function () {
		//작성자 이름에 대한 입력여부 검사
		if(!chkSubmit($("#user_name"),"이름을")){
			return;
		}else if(!chkSubmit($("#userboardreply_content"),"내용을")){
			return;
		}else{
			var InsertUrl = "/serviceCenter/userBoard/userBoardReplyInsert.do";
			/* 글 저장을 위한 Post 방식의 Ajax 연동 처리 */
			$.ajax({
				url: InsertUrl, //전송url
				type: "post", //전송시 method방식
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				dataType:"text",
				data:JSON.stringify({
			
					userboard_number:userboard_number,
					user_name:$("#user_name").val(),
					userboardreply_content:$("#userboardreply_content").val()
				}),
				error:function(){	//실행시 오류가 발생하였을경우
					alert('시스템 오류 입니다. 관리자에게 문의 하세요');
				},
				success:function(resultData){
					if(resultData == "SUCCESS"){
						alert("댓글 등록이 완료되었습니다.");
						dataReset();
						listAll(userboard_number);
					}
				}
			});
		}
	});
		
		/* 수정 버튼 클릭시 수정폼 출력 */
		$(document).on("click",".update_form",function(){
			$(".reset_btn").click();
			var conText = $(this).parents("li").children().eq(1).html();
			console.log("conText : " + conText);
			$(this).parents("li").find("input[type='button']").hide();
			$(this).parents("li").children().eq(0).html();
			var conArea = $(this).parents("li").children().eq(1);
			
			conArea.html("");
			var data ="<textarea name='content' id='content'>"+conText+"</textarea>";
			data+="<input type='button' class='update_btn' value='수정완료'>";
			data+="<input type='button' class='reset_btn' value='수정취소'>";
			conArea.html(data);
		});
		
		/* 글 수정을 위한 Ajax 연동 처리 */
		$(document).on("click",".update_btn",function(){
			var userboardreply_number = $(this).parents("li").attr("data-num");
			var userboardreply_content = $("#content").val();
			if(!chkSubmit($("#content"),"댓글 내용을")){
				return;
			}else{
				$.ajax({
					url:'/serviceCenter/userBoard/'+userboardreply_number+".do",
					type:'put',
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"PUT"
						},
						
						data:JSON.stringify({
							userboardreply_content:userboardreply_content
						}),
						
						dataType:'text',
						success:function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("수정 되었습니다.");
								listAll(userboard_number);
							}
						}
					});
				}
			});
		/* 글 삭제를 위한 Ajax 연동 처리 */
		$(document).on("click",".delete_btn",function(){
		var userboardreply_number = $(this).parents("li").attr("data-num");
		console.log("userboardreply_number: " + userboardreply_number);
		if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
			$.ajax({
				url:'/serviceCenter/userBoard/'+userboardreply_number+".do",
				type:'delete',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"DELETE"
					},
					
					dataType:'text',
					success:function(result){
						console.log("result: " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							listAll(userboard_number);
						}
					}
				});
			}
		});
});
	
	//리스트 요청 함수
function listAll(userboard_number){
	var username = $('#user_name').val();
	$("#comment_list").html("");
	var url = "/serviceCenter/userBoard/userBoardReply/all/"+userboard_number+".do";
	
	$.getJSON(url,function(data){
		console.log(data.length);
		
		$(data).each(function(){
			var userboardreply_number = this.userboardreply_number;
			var user_name = this.user_name;
			var userboardreply_content = this.userboardreply_content;
			var userboardreply_writedate = this.userboardreply_writedate;
			addNewItem(userboardreply_number, user_name, userboardreply_content, userboardreply_writedate,username);
		});
		
	}).fail(function(){
		alert("댓글 목록을 불러오는데 실패 하였습니다. 잠시후에 다시 시도해 주세요.");
	})
}

/* 새로운 글을 화면에 추가하기 위한 함수 */
function addNewItem(userboardreply_number, user_name, userboardreply_content, userboardreply_writedate,username) {
	
	//새로운 글이 추가될 li태그 객체
	var new_li = $("<li>");
	new_li.attr("data-num",userboardreply_number);
	new_li.addClass("comment_item");
	
	//작성자 정보가 지정될 <p>태그
	var writer_p = $("<p>");
	writer_p.addClass("writer");
	
	//작성자 정보의 이름
	var name_span = $("<span>");
	name_span.addClass("name");
	name_span.html(user_name+"님");
	
	//작성일시
	var date_span =$("<span>");
	date_span.html("/" + userboardreply_writedate +"");
	if(username != user_name){
		
	}else{
	//수정하기 버튼
	var up_input = $("<input>");
	up_input.attr({"type":"button","value":"수정하기"});
	up_input.addClass("update_form");
	
	//삭제하기 버튼
	var del_input= $("<input>");
	del_input.attr({"type":"button","value":"삭제하기"});
	del_input.addClass("delete_btn");
	}
	//내용
	var content_p = $("<p>");
	content_p.addClass("con");
	content_p.html(userboardreply_content);
	
	//조립하기
	writer_p.append(name_span).append(date_span).append(up_input).append(del_input);
	new_li.append(writer_p).append(content_p);
	$("#comment_list").append(new_li);
}
function dataReset() {
	$("#user_name").val("");
	//$("#r_pwd").val("");
	$("#userboardreply_content").val("");
}

</script>
</head>
<body>
	<div id="replyContainer" align="center">
		<h1></h1>
		<div id="comment_writer">
			<form id="comment_form">
				<div>
					<label for="user_name">작성자</label> 
					<input type="text" name="user_name" id="user_name" value="${sessionScope.UVO.user_name}"/> 
					<input type="button" id="userBoardReplyInsert" name="userBoardReplyInsert" value="저장하기" />
				</div>
				<div>
					<label for="userboardreply_content">댓글 내용</label>
					<textarea name="userboardreply_content" id="userboardreply_content"></textarea>
				</div>
			</form>
		</div>
		
		<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
		</ul>
	</div>

</body>
</html>