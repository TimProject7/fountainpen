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
<link rel="stylesheet" type="text/css" href="../../css/userBoard.css" />
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
			"action" : "/serviceCenter/userBoard/userBoard.do"
		});
		$("#f_search").submit();

	}
</script>

</head>
<body>
	
	<div id="myPageForm" align="center">
      <ul id="myPageForm_nav_ul">
         <c:choose >
			<c:when test="${not empty sessionScope.UVO}">
         		<li id="nav_menu"><a href="/serviceCenter/userBoard/userBoard.do"><b>회원게시판</b></a></li>
         		<li id="nav_menu"><a href="/serviceCenter/notice/noticelist.do">공지사항</a></li>
         		<li id="nav_menu"><a href="/serviceCenter/faq/FAQlist.do">FAQ</a></li>
         	</c:when>
         	<c:when test="${empty sessionScope.UVO}">
         		<li id="nav_menu"><a href="/serviceCenter/notice/noticelist.do">공지사항</a></li>
         		<li id="nav_menu"><a href="/serviceCenter/faq/FAQlist.do">FAQ</a></li>
         	</c:when>
         </c:choose>
      </ul>
   </div>
	
	<br><br>
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
	<div class="all" align="center">
		<h2>회원게시판</h2>
		<br>
		<form id="userBoardInsertForm" name="userBoardInsertForm">

			<table id="userBoardTb">
				<tr>
					<th width="5%">글번호</th>
					<th width="60%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th width="5%">조회수</th>
				</tr>
				<!-- 데이터 전체를 List로 불러와서 포이치문으로 출력 -->
				<c:choose>
					<c:when test="${not empty userBoardList}">
						<c:forEach var="userBoard" items="${userBoardList}">

							<tr>
								<td id="center">${userBoard.userboard_number}</td>
								<td id="title"><a href="/serviceCenter/userBoard/userBoardDetail.do?userboard_number=${userBoard.userboard_number}">${userBoard.userboard_title}</a></td>
								<td id="writer">${userBoard.userboard_name}</td>
								<td id="center">${userBoard.userboard_writedate}</td>
								<td id="center">${userBoard.userboard_viewCnt}</td>
							</tr>
							<tr>
								<td colspan="5"><hr></td>
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
			<p id="right">
				<input type="button" id="writerForm" name="writerForm" value="글쓰기">
			</p>
			
			<br><br>
			<p id="center">
				<select name="search">
				<option value="menu1" selected>작성자</option>
				<option value="menu2">작성자+글제목</option>
				<option value="menu3">이름</option>
				</select> 
			</p>
		</form>
	</div>
	<!-- 페이지출력 -->
	<div id="questionPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>