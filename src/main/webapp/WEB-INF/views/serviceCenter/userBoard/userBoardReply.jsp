<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원게시판 댓글</title>
<style type="text/css">

</style>
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
		if(!chkSubmit($("#user_id"),"아이디를")){
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
					user_id:$("#user_id").val(),
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
			
			//updateForm의 부모인 -> tr의 형제요소 -> tr의자식 -> td의 자식 ->textarea 안의 html내용
			var conText =$(this).parents().next("tr").children().children().val();
			console.log("conText : " + conText);
			$(this).parents("tr").find("input[type='button']").hide();
			//$(this).parents("tr").children().eq(0).html();
			var conArea = $(this).parents("tr").next().children();
			//var conArea = $(this).parents("tr").eq(1).children().eq(0);
			
			//conArea.remove();
			conArea.html("");
			var data ="<textarea name='content' id='content'>"+conText+"</textarea>";
			data+="<input type='button' class='update_btn' value='수정완료'>";
			data+="<input type='button' class='reset_btn' value='수정취소'>";
			conArea.html(data);
		});
		
		/* 글 수정을 위한 Ajax 연동 처리 */
		$(document).on("click",".update_btn",function(){
			
			/*********************
			@수정시 데이터넘버 가져오는 식
			
			$(this) = 업데이트버튼 -> .parent() = 수정폼 td= id:two_td -> .parent() =commend_item_two = 수정폼tr -> 
			prev() = 이전형제요소 수정폼tr 위에 tr 의 .attr("data-num") 데이터넘버를 가져온다   
			
			******************/
			var userboardreply_number = $(this).parent().parent().prev().attr("data-num");
			
			var userboardreply_content = $("#content").val();
			console.log("userboardreply_number : "+userboardreply_number)
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
		var userboardreply_number = $(this).parents("tr").attr("data-num");
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
	var userid = $('#user_id').val();
	var url = "/serviceCenter/userBoard/userBoardReply/all/"+userboard_number+".do";
	//댓글입력후 기존데이터 삭제
	$("#new_table tbody tr").remove();
	
	//새로운 데이터를 추가한다.
	$.getJSON(url,function(data){
		console.log(data.length);

		
		$(data).each(function(){
			var userboardreply_number = this.userboardreply_number;
			var user_id = this.user_id;
			var userboardreply_content = this.userboardreply_content;
			var userboardreply_writedate = this.userboardreply_writedate;
			addNewItem(userboardreply_number, user_id, userboardreply_content, userboardreply_writedate,userid);
		});
		
	}).fail(function(){
		alert("댓글 목록을 불러오는데 실패 하였습니다. 잠시후에 다시 시도해 주세요.");
	})
}

/* 새로운 글을 화면에 추가하기 위한 함수 */
function addNewItem(userboardreply_number, user_id, userboardreply_content, userboardreply_writedate,userid) {
	//작성자=td, 아이디=td-text, 저장버튼=td-button
	var first_tr =$("<tr>");
	first_tr.attr("data-num",userboardreply_number);
	first_tr.addClass("comment_item_first");
	
	//작성자  td태그
	var writer_td =$("<td>");
	writer_td.addClass("writer_td");
	
	//작성자id = input
	var writer_id_input = $("<input>");
	writer_id_input.attr({"type":"text","size":"10","value":user_id+"님"});
	
	
	//댓글 text
	var two_textarea =$("<input>");
	two_textarea.attr({"type":"text","size":"30","value":userboardreply_content});
	two_textarea.addClass("two_textarea");
	//two_textarea.html(userboardreply_content);
	
	//작성날짜 = input
	var writer_date_inpit = $("<input>");
	writer_date_inpit.attr({"type":"text","size":"10","value":"/" + userboardreply_writedate +""});
	
	//두번째 tr 댓글 내용  tr - td - textarea		
	var two_tr =$("<tr>");
	two_tr.addClass("comment_item_two");
	
	//댓글 td
	var two_td =$("<td>");
	two_td.addClass("two_td");
	if(userid != user_id){
		
	}else{
	//수정버튼 = button
	var input_update_button =$("<input>")
	input_update_button.attr({"type":"button","value":"수정"});
	input_update_button.addClass("update_form");
	
	//삭제버튼 = button
	var input_delete_button =$("<input>")
	input_delete_button.attr({"type":"button","value":"삭제"});
	input_delete_button.addClass("delete_btn");
	}
	//br
	var br =$("<br>");
	var hr =$("<hr>");
	var br =$("<br>");
	
	//수정폼 조립
	first_tr.append().append(writer_td);////첫번째 tr -td
	writer_td.append(writer_id_input).append(writer_date_inpit).append(input_update_button).append(input_delete_button);		//텍스트
	
	two_tr.append().append(two_td);//두번째 tr - td
	two_td.append(two_textarea).append(hr);//td안에 에어리어
	$("#new_table").append(first_tr).append(two_tr)
}

//댓글등록후 댓글 내용 textarea 초기화
function dataReset() {
	$("#userboardreply_content").val("");
}

</script>
</head>
<body>
	<br><br>
	<div id="replyContainer" align="center">
		<h1>댓글입력</h1>
		<div id="comment_writer">
			<form id="comment_form">
				<div>
					<label for="user_id">작성자</label> 
					<input type="text" name="user_id" id="user_id" value="${sessionScope.UVO.user_id}" readonly="readonly" size="6"/>
					<!-- <textarea name="userboardreply_content" id="userboardreply_content" rows="2"></textarea> -->
					<input type="text"  name="userboardreply_content" id="userboardreply_content" placeholder="댓글내용입력" size="50">
					<input type="button" id="userBoardReplyInsert" name="userBoardReplyInsert" value="저장하기" />
				</div>
				<div>
					
				</div>
			</form>
		</div>
		
		<!-- 생성폼 -->
	<hr>
	<table id="new_table">
	<!-- 동적 댓글생성 -->
	
	
	</table>
	</div>

</body>
</html>