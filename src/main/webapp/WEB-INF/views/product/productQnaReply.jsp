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
	listAll(productId)


/* 댓글 내용 저장 이벤트 */
$("#replyInsert").click(function () {
	//작성자 이름에 대한 입력여부 검사
	if(!chkSubmit($("#productqna_content"),"내용을")){
		return;
	}else{
		var InsertUrl = "/product/productQnaReplyInsert.do";
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
				productqna_content:$("#productqna_content").val()
			}),
			error:function(){	//실행시 오류가 발생하였을경우
				alert('시스템 오류 입니다. 관리자에게 문의 하세요');
			},
			success:function(resultData){
				if(resultData == "SUCCESS"){
					alert("댓글 등록이 완료되었습니다.");
					dataReset();
					listAll(productId);
				}else{
					alert("구매한상품만 작성가능합니다")
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
	//$(this).parents("li").children().eq(0).html();
	var conArea = $(this).parents("li").children().eq(1);
	
	conArea.html("");
	var data ="<textarea name='content' id='content'>"+conText+"</textarea>";
	data+="<input type='button' class='update_btn' value='수정완료'>";
	data+="<input type='button' class='reset_btn' value='수정취소'>";
	conArea.html(data);
});

/* 초기화 버튼 */
$(document).on("click",".reset_btn",function(){
	var conTxt=$(this).parents("li").find("textarea").html();
	$(this).parents("li").find("input[type='button']").show();
	var conArea=$(this).parents("li").children().eq(1);
	conArea.html(conText);
});

/* 글 수정을 위한 Ajax 연동 처리 */
$(document).on("click",".update_btn",function(){
	var productqna_number = $(this).parents("li").attr("data-num");
	var productqna_content = $("#content").val();
	if(!chkSubmit($("#content"),"댓글 내용을")){
		return;
	}else{
		$.ajax({
			url:'/product/productQnaReply/'+productqna_number+".do",
			type:'put',
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"
				},
				
				data:JSON.stringify({
					productqna_content:productqna_content
				}),
				
				dataType:'text',
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						listAll(productId);
					}
				}
			});
		}
	});
	
	/* 글 삭제를 위한 Ajax 연동 처리 */
	$(document).on("click",".delete_btn",function(){
	var productqna_number = $(this).parents("li").attr("data-num");
	console.log("productqna_number: " + productqna_number);
	if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
		$.ajax({
			url:'/product/productQnaReply/'+productqna_number+".do",
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
						listAll(productId);
					}
				}
			});
		}
	});
});

//리스트 요청 함수
function listAll(productId){
	var userid = $('#user_id').text();
	$("#comment_list").html("");
	var url = "/product/productQnaReply/all/"+productId+".do";
	
	$.getJSON(url,function(data){
		console.log(data.length);
		
		$(data).each(function(){
			var productqna_number = this.productqna_number;
			var user_id = this.user_id;
			var productqna_content = this.productqna_content;
			var productqna_writedate = this.productqna_writedate;
			addNewItem(productqna_number, user_id, productqna_content, productqna_writedate, userid);
		});
		
	}).fail(function(){
		alert("댓글 목록을 불러오는데 실패 하였습니다. 잠시후에 다시 시도해 주세요.");
	})
}

/* 새로운 글을 화면에 추가하기 위한 함수 */
function addNewItem(productqna_number, user_id, productqna_content, productqna_writedate, userid) {
	//새로운 글이 추가될 li태그 객체
	var new_li = $("<li>");
	new_li.attr("data-num",productqna_number);
	new_li.addClass("comment_item");
	
	//작성자 정보가 지정될 <p>태그
	var writer_p = $("<p>");
	writer_p.addClass("writer");
	
	//작성자 정보의 이름
	var name_span = $("<span>");
	name_span.addClass("name");
	name_span.html(user_id+"님");
	
	//작성일시
	var date_span =$("<span>");
	date_span.html("/" + productqna_writedate +"");
	
	//자신의 댓글만 수정삭제가능
	if(userid!= user_id){
		
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
	content_p.html(productqna_content);
	
	//조립하기
	writer_p.append(name_span).append(date_span).append(up_input).append(del_input);
	new_li.append(writer_p).append(content_p);
	$("#comment_list").append(new_li);
}
function dataReset() {
	$("#user_id").val("");
	//$("#r_pwd").val("");
	$("#productqna_content").val("");
}

</script>
</head>
<body>
<input type="text" name="productId" id="productId"
         value="${detail.productId}" />
<div id="replyContainer">
		<h1></h1>
		<div id="comment_writer">
			<form id="comment_form">
				<div>
					<h2>Q&A</h2>
					<label id="user_id" for="user_id">${sessionScope.UVO.user_id}</label>
					<input type="text"  name="productqna_content" id="productqna_content" />
					<input type="button" id="replyInsert" value="저장하기" />
				</div>
			</form>
		</div>
		<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
		</ul>
	</div>
</body>
</html>