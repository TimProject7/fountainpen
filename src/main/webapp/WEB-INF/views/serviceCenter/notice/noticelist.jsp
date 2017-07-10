<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../css/notice.css" />
<meta http-equiv="Content_Type" content="text/html; charset=UTF-8">
<title>Notice 글 리스트</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		/* 검색후 검색 대상과 검색단어 출력 */
		if ("<c:out value='${data.keyword}'/>" != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
		}
		/* /* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});
		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("글 목록 전체");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
			;
		});

		//검색버튼
		$("#searchData").click(function() {
			//검색조건이 전체가 아닐시 키워드로 검색
			if ($("#search").val() == "all") {
				$("#keyword").val("");
			} else {
				if (!chkSubmit($('#keyword'), "검색어를")) {
					return;
				}
			}
			goPage(1);
		});

	});
	//검색한페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/notice/noticelist"
		});
		$("#f_search").submit();

	}
</script>


</head>
<body>
	<div id="myPageForm" align="center">
		<ul id="myPageForm_nav_ul">
			<li id="nav_menu"><a href="/serviceCenter/userBoard/userBoard.do">회원게시판</a></li>
			<li id="nav_menu"><a href="/serviceCenter/notice/noticelist.do"><b>공지사항</b></a></li>
			<li id="nav_menu"><a href="/serviceCenter/faq/FAQlist.do">1:1문의</a></li>
		</ul>
	</div>

	<div class="all">


		<br> <br>

		<h2>Notice 게시글 목록</h2>

		<br>


		<!-- 페이지 넘버 -->
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <input
				type="hidden" id="pageSize" name="pageSize" value="${data.pageSize}" />
		</form>

		<table id="noticeTb">
			<tr>
				<th width="5%">번호</th>
				<th width="60%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th width="5%">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${empty Notice_list}">

					<tr>
						<td colspan="5">등록된 Notice가 없다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="row" items="${Notice_list}">
						<tr>
							<td class="no">${row.notice_no}</td>
							<td style="width: 50%;"><a
								href="noticeview?notice_no=${row.notice_no}">${row.notice_title}</a></td>
							<td style="width: 9%;">${row.notice_writer}</td>
							<td style="width: 25%;">
								<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
									value="${row.notice_regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td class="no" style="width: 8%;">${row.notice_viewcnt}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</table>

	
	<!-- 페이지출력 -->
	<div id="buyListPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>
</div>
</body>
</html>
<%@ include file="/footer.jsp"%>