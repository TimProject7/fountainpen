<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 qna</title>
<script type="text/javascript" src="../../../js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function () {
	/* 기본 댓글 목록 불러오기 */
	var productId = "<c:out value='${detail.productId}'/>";
	listAll1(productId)


/* 댓글 내용 저장 이벤트 */
$("#reviewReplyInsert").click(function () {
	//작성자 이름에 대한 입력여부 검사
	if(!chkSubmit($("#user_id"),"아이디을")){
		return;
	}else if(!chkSubmit($("#reviewReply_content"),"내용을")){
		return;
	}else{
		var InsertUrl = "/product/productReviewReplyInsert.do";
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
			
				productId:productId,
				user_id:$("#user_id").val(),
				//r_pwd:$("#r_pwd").val(),
				reviewReply_content:$("#reviewReply_content").val()
			}),
			error:function(){	//실행시 오류가 발생하였을경우
				alert('시스템 오류 입니다. 관리자에게 문의 하세요');
			},
			success:function(resultData){
				if(resultData == "SUCCESS"){
					alert("댓글 등록이 완료되었습니다.");
					dataReset();
					alert(productId)
					listAll1(productId);
				}
			}
		});
	}
});

/* 수정 버튼 클릭시 수정폼 출력 */
$(document).on("click",".reviewupdate_form",function(){
	$(".reset_btn").click();
	var reviewconText = $(this).parents("li").children().eq(1).html();
	console.log("reviewconText : " + reviewconText);
	$(this).parents("li").find("input[type='button']").hide();
	//$(this).parents("li").children().eq(0).html();
	var reviewconArea = $(this).parents("li").children().eq(1);
	
	reviewconArea.html("");
	var data ="<textarea name='reviewcontent' id='reviewcontent'>"+reviewconText+"</textarea>";
	data+="<input type='button' class='reviewupdate_btn' value='수정완료'>";
	data+="<input type='button' class='reset_btn' value='수정취소'>";
	reviewconArea.html(data);
});

/* 초기화 버튼 */
$(document).on("click",".reset_btn",function(){
	var conTxt=$(this).parents("li").find("textarea").html();
	$(this).parents("li").find("input[type='button']").show();
	var reviewconArea=$(this).parents("li").children().eq(1);
	reviewconArea.html(reviewconText);
});

/* 글 수정을 위한 Ajax 연동 처리 */
$(document).on("click",".reviewupdate_btn",function(){
	var reviewReply_number = $(this).parents("li").attr("data-num");
	var reviewReply_content = $("#reviewcontent").val();
	if(!chkSubmit($("#reviewcontent"),"댓글 내용을")){
		return;
	}else{
		$.ajax({
			url:'/product/productReviewReplyUpdate/'+reviewReply_number+".do",
			type:'put',
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"
				},
				
				data:JSON.stringify({
					reviewReply_content:reviewReply_content
				}),
				
				dataType:'text',
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						listAll1(productId);
					}
				}
			});
		}
	});
	
	/* 글 삭제를 위한 Ajax 연동 처리 */
	$(document).on("click",".reviewdelete_btn",function(){
	var reviewReply_number = $(this).parents("li").attr("data-num");
	console.log("reviewReply_number: " + reviewReply_number);
	if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
		$.ajax({
			url:'/product/productReviewReplyDelete/'+reviewReply_number+".do",
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
						listAll1(productId);
					}
				}
			});
		}
	});
});

//리스트 요청 함수
function listAll1(productId){
	$("#reviewcomment_list").html("");
	var url = "/product/productReviewReply/all/"+productId+".do";
	
	$.getJSON(url,function(data){
		console.log(data.length);
		
		$(data).each(function(){
			var reviewReply_number = this.reviewReply_number;
			var user_id = this.user_id;
			var reviewReply_content = this.reviewReply_content;
			var reviewReply_writedate = this.reviewReply_writedate;
			addNewItem1(reviewReply_number, user_id, reviewReply_content, reviewReply_writedate);
		});
		
	}).fail(function(){
		alert("댓글 목록을 불러오는데 실패 하였습니다. 잠시후에 다시 시도해 주세요.");
	})
}

/* 새로운 글을 화면에 추가하기 위한 함수 */
function addNewItem1(reviewReply_number, user_id, reviewReply_content, reviewReply_writedate) {
	//새로운 글이 추가될 li태그 객체
	var reviewnew_li = $("<li>");
	reviewnew_li.attr("data-num",reviewReply_number);
	reviewnew_li.addClass("reviewcomment_item");
	
	//작성자 정보가 지정될 <p>태그
	var reviewwriter_p = $("<p>");
	reviewwriter_p.addClass("reviewwriter");
	
	//작성자 정보의 이름
	var reviewname_span = $("<span>");
	reviewname_span.addClass("reviewname");
	reviewname_span.html(user_id+"님");
	
	//작성일시
	var reviewdate_span =$("<span>");
	reviewdate_span.html("/" + reviewReply_writedate +"");
	
	//수정하기 버튼
	var reviewup_input = $("<input>");
	reviewup_input.attr({"type":"button","value":"수정하기"});
	reviewup_input.addClass("reviewupdate_form");
	
	//삭제하기 버튼
	var reviewdel_input= $("<input>");
	reviewdel_input.attr({"type":"button","value":"삭제하기"});
	reviewdel_input.addClass("reviewdelete_btn");
	
	//내용
	var reviewcontent_p = $("<p>");
	reviewcontent_p.addClass("reviewcon");
	reviewcontent_p.html(reviewReply_content);
	
	//조립하기
	reviewwriter_p.append(reviewname_span).append(reviewdate_span).append(reviewup_input).append(reviewdel_input);
	reviewnew_li.append(reviewwriter_p).append(reviewcontent_p);
	$("#reviewcomment_list").append(reviewnew_li);
}
function dataReset() {
	
	//$("#r_pwd").val("");
	$("#reviewReply_content").val("");
}

</script>
</head>
<body>
<div id="replyContainer">
		<h1></h1>
		<div id="comment_writer">
			<form id="comment_form">
				<div>
					<h2>후기</h2>
					<label for="user_id">작성자</label>
					<input type="text" name="user_id" id="user_id" value="${sessionScope.UVO.user_id}"/>
					<input type="button" id="reviewReplyInsert" value="저장하기" />
				</div>
				<div>
					<label for="reviewReply_content">댓글 내용</label>
					<textarea name="reviewReply_content" id="reviewReply_content"></textarea>
				</div>
			</form>
		</div>
		
		<ul id="reviewcomment_list">
			<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
		</ul>
	</div>
</body>
</html>