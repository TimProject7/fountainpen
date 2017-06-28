<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<%@ page session="true"%>

<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원게시판</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		/* /* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});
		//글쓰기폼으로이동
		$("#writerForm").click(function() {
			//입력값 체크

			$("#userBoardInsertForm").attr({
				"method" : "post",
				"action" : "/serviceCenter/userBoard/userBoardWriterForm.do"
			});
			$("#userBoardInsertForm").submit();
		});

	});

	//검색한페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page) {
		/* if ($("#search").val() == "all") {
			$("#keyword").val("");
		} */
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/myPage/question/question.do"
		});
		$("#f_search").submit();

	}
</script>

</head>
<body>

	<!-- 페이지 넘버 가져오는 폼 -->
	<form id="f_search" name="f_search">
		<input type="hidden" id="page" name="page" value="${data.page}" />
		
		<!--검색-->
		<!-- <table summary="검색">
			<tr>
				<td><label>검색조건</label><select name="search" id="search">
						<option value="all">전체</option>
						<option value="buy_product">상품명</option>
						<option value="buy_day">구매날짜</option>
				</select> <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
					<input type="button" value="검색" id="searchData"></td>
			</tr>
		</table> -->
	</form>
	<div align="center">
		<h2>회원게시판</h2>
		<form id="userBoardInsertForm" name="userBoardInsertForm">
			<select name="search">
				<option value="menu1" selected>작성자</option>
				<option value="menu2">작성자+글제목</option>
				<option value="menu3">이름</option>
			</select> <input type="button" id="writerForm" name="writerForm" value="글쓰기">

			<table border="1">
				<tr>
					<td>글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				<!-- 데이터 전체를 List로 불러와서 포이치문으로 출력 -->
				<c:choose>
					<c:when test="${not empty userBoardList}">
						<c:forEach var="userBoard" items="${userBoardList}">

							<tr>
								<td>${userBoard.userboard_number}</td>
								<td><a href="/serviceCenter/userBoard/userBoardDetail.do?userboard_number=${userBoard.userboard_number}">${userBoard.userboard_title}</a></td>
								<td>${userBoard.userboard_name}</td>
								<td>${userBoard.userboard_writedate}</td>
								<td>${userBoard.userboard_viewCnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td>등록된 게시물이 존재하지않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</form>
	</div>
	<!-- 페이지출력 -->
	<div id="questionPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>

</body>
</html>