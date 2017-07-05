<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content_Type" content="text/html; charset=UTF-8">
<title>FAQ 글 리스트</title>
<script>
	$(document).ready(function() {
		
	});
</script>

<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

h2 {
	text-align: left;
}

.div1 {
	width: 43%;
}

.logout_table {
	width: 55%;
}

a {
	text-decoration: none;
	color: black;
}

a:HOVER {
	font-size: 1.1em;
	color: teal;
}

label {
	padding-left: 3%;
	padding-right: 3%;
}

th {
	color: white;
	background-color: black;
}

.no {
	text-align: center;
}
</style>

</head>
<body>
	<div id="myPageForm" align="center">
		<ul id="myPageForm_nav_ul">
			<li><a href="/serviceCenter/userBoard/userBoard.do">회원게시판</a></li>
			<li><a href="/serviceCenter/notice/noticelist.do">공지사항</a></li>
			<li><a href="/serviceCenter/faq/FAQlist.do"><b>1:1문의</b></a></li>
		</ul>
	</div>

	<div class="div1">


		<br> <br>

		<h2>FAQ 게시글 목록</h2>

		<br>




		<table border="1" width="660px">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test="${empty faq_list}">

					<tr>
						<td colspan="5">등록된 FAQ가 없다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="row" items="${faq_list}">
						<tr>
							<td class="no">${row.faq_no}</td>
							<td style="width: 50%;"><a
								href="FAQview?faq_no=${row.faq_no}">${row.faq_title}</a></td>
							<td style="width: 9%;">${row.faq_writer}</td>
							<td style="width: 25;%;">
								<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
									value="${row.faq_regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td class="no" style="width: 8%;">${row.faq_viewcnt}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>
<%@ include file="/footer.jsp"%>