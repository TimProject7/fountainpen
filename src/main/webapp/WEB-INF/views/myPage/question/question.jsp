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
<title>회원 1:1문의 게시판</title>
<link rel="stylesheet" href="/css/question.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script type="text/javascript" src="../../js/common.js"></script>
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
      $("#insertForm").click(function() {
         //입력값 체크

         $("#question_writer").attr({
            "method" : "post",
            "action" : "/myPage/question/writer.do"
         });
         $("#question_writer").submit();
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
   <div id="myPageForm" align="center">
      <ul id="myPageForm_nav_ul">
         <li><a href="/myPage/userInfo/userInfoPassword.do">회원정보변경</a></li>
         <li><a href="/myPage/buyList/buyList.do">구매내역</a></li>
         <li><a href="/myPage/question/question.do"><b>1:1문의</b></a></li>
         <li><a href="/cart/cartList.do">장바구니</a></li>
         <li><a href="/myPage/delivery/delivery.do">배송정보</a></li>
      </ul>
   </div>

   <c:choose>
      <c:when test="${not empty sessionScope.UVO}">
         <input type="hidden" id="user_number" name="user_number"
            value="${sessionScope.UVO.user_number}" />
         <input type="hidden" id="user_name" name="user_name"
            value="${sessionScope.UVO.user_name}" />

      </c:when>
   </c:choose>

   <form id="f_search" name="f_search">
      <input type="hidden" id="page" name="page" value="${data.page}" />
   </form>
   <form id="question_writer" name="question_writer">
      <div align="center">
         <select name="search">
            <option value="menu1" selected>작성자</option>
            <option value="menu2">작성자+글제목</option>
            <option value="menu3">이름</option>
         </select> <input type="button" id="insertForm" name="insertForm" value="글쓰기">

         <table border="1" width="500">
            <tr>
               <td>글번호</td>
               <td>제목</td>
               <td>작성일</td>
               <td>답변상태</td>
            </tr>

            <c:choose>
               <c:when test="${not empty questionList}">
                  <!-- varStatus 순서대로 나오게 루프 돌리는애 -->
                  <!-- 컨트롤러에서 가져옴 -->
                  <c:forEach var="question" items="${questionList}">

                     <tr>
                        <td>${question.question_number}</td>
                        <td><a
                           href="/myPage/question/Detail.do?question_number=${question.question_number}">
                              ${question.question_title}</a></td>
                        <td>${question.question_writedate}</td>
                        <td>${question.question_status}</td>
                     </tr>

                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <tr align="center">
                     <td colspan="4">등록된 게시물이 존재하지않습니다.</td>
                  </tr>
               </c:otherwise>
            </c:choose>
         </table>

      </div>
   </form>
   <!-- 페이지출력 -->
   <div id="questionPage" align="center">
      <tag:paging page="${param.page}" total="${total}"
         list_size="${data.pageSize}" />
   </div>


   <%@ include file="/footer.jsp"%>
</body>
</html>