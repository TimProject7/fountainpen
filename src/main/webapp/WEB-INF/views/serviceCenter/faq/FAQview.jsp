<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%> 	
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 게시물 보기</title>

<script>
	$(document).ready(function() {

		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "FAQdelete";
				document.form1.submit();
			}
		});

		$("#btnlist").click(function() {
			document.form1.action = "FAQlist";
			document.form1.submit();

		});
		
		$("#btnUpdete").click(function() {
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			//var writer = document.form1.writer.value;
			var title = $("#faq_title").val();
			var content = $("#faq_content").val();
			if (title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			document.form1.action = "FAQupdate"
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
		
	});

	
</script>

</head>
<body>
	

	<h2>게시글 보기</h2>
	
	<form name="form1" method="post">
		<div>
			<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
			작성일자 :
			<fmt:formatDate value="${dto.faq_regdate}"
				pattern="yyyy-MM-dd a HH:mm:ss" />
			<!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
		</div>
		<div>조회수 : ${dto.faq_viewcnt}</div>
		<div>
			제목 <input name="faq_title" id="faq_title" size="80"
				value="${dto.faq_title}" placeholder="제목을 입력해주세요">
		</div>
		<div>
			내용
			<textarea name="faq_content" id="faq_content" rows="4" cols="80"
				placeholder="내용을 입력해주세요">${dto.faq_content}</textarea>
		</div>
		<div>
			이름 <input name="faq_writer" id="faq_writer" size="80"
				value="${dto.faq_writer}" readonly="readonly">
		</div>
		<div style="width: 650px; text-align: center;">
			<!-- 게시물번호를 hidden으로 처리 -->
			<input type="hidden" name="faq_no" value="${dto.faq_no}">
			<button type="button" id="btnUpdete">수정</button>
			<button type="button" id="btnDelete">삭제</button>
			<button type="button" id="btnlist">목록보기</button>
		</div>
	</form>

</body>
</html>