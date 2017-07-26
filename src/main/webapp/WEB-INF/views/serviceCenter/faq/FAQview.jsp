<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%> 	
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 게시물 보기</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script>
	$(document).ready(function() {

		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "FAQdelete";
				document.form1.submit();
			}
		});

		$("#btnlist").click(function() {
			document.form1.action = "FAQlist.do";
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

<style type="text/css">
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

a {
	text-decoration: none;
}

a:HOVER {
	font-size: 1.1em;
	color: teal;
}

h2 {
	text-align: center;
}

#faq_tb th {
	text-align: left;
	background-color: black;
	color: white;
		margin-bottom: 1%;
	margin-top: 1%;
}

td {
	padding-left: 2%;
}
</style>
</head>
<body>
	

	<h2>FAQ 글 목록</h2>
	
	<form name="form1" method="post">
		
		<table id="faq_tb">
			<tr>
					<th>작성일자</th>
					<td><fmt:formatDate value="${dto.faq_regdate}"
				pattern="yyyy-MM-dd a HH:mm:ss" /></td>
				</tr>
	
				<tr>
					<th>제목</th>
					<td> <input name="faq_title" id="faq_title" size="80"
				value="${dto.faq_title}" placeholder="제목을 입력해주세요" readonly="readonly"></td>
				</tr>
	
				<tr>
					<th>내용</th>
					<td><textarea name="faq_content" id="faq_content" rows="4" cols="80"
				placeholder="내용을 입력해주세요" readonly="readonly">${dto.faq_content}</textarea></td>
				</tr>
	
				<tr>
					<th>작성자</th>
					<td> <input name="faq_writer" id="faq_writer" size="80"
				value="${dto.faq_writer}" readonly="readonly"></td>
				</tr>
		
		</table>
		
		<div style="width: 650px; text-align: center;">
			<!-- 게시물번호를 hidden으로 처리 -->
			<input type="hidden" name="faq_no" value="${dto.faq_no}">
			<button type="button" id="btnlist">목록보기</button>
		</div>
		
	</form>
<%@ include file="/footer.jsp"%>
</body>
</html>