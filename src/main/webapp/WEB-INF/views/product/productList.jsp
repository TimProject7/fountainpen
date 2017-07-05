<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ include file="/header.jsp"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
      /* 검색후 검색 대상과 검색단어 출력 */
      if ("<c:out value='${data.keyword}'/>" != "") {
         $("#keyword").val("<c:out value='${data.keyword}'/>");
         $("#search").val("<c:out value='${data.search}'/>");
      }

      /* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
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

   function goProductDetail(productId) {
      location.href = "/product/productDetail.do?productId=" + productId;
   }

   /* 상세 페이지 이동 함수(location 객체로 이동 url은 한라인으로 작성한다.) */
   function goDetail(productId, page, pageSize) {
      location.href = "/product/productDetail.do?productId=" + productId
            + "&page = " + page + "&pageSize =" + pageSize;
   }
   //검색한페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
   function goPage(page) {
      if ($("#search").val() == "all") {
         $("#keyword").val("");
      }
      $("#page").val(page);
      $("#f_search").attr({
         "method" : "get",
         "action" : "/product/productList.do"
      });
      $("#f_search").submit();

   }
</script>
<link rel="stylesheet" href="/css/productList.css">
</head>
<body>
   <%--    <h2>상품목록</h2>
   <table border="1">
      <tr>
         <th>상품ID</th>
         <th>이미지</th>
         <th>상품명</th>
         <th>가격</th>
      </tr>
      <c:forEach var="row" items="${list }">
         <tr>
            <td>
               ${row.productId }
            </td>
            <td>
               <a href="/product/detail/${row.productId }.do">
                  <img src="/images/${row.productImage }" width="120px" height="110px">
               </a>
            </td>
            <td>
               <a href="/product/detail/${row.productId }.do">${row.productName }</a>
            </td>
            
            <td>
               <fmt:formatNumber value="${row.productPrice }" pattern="###,###,###"/>
            </td>
         </tr>
      </c:forEach>
   </table> --%>


   <h2>상품 목록</h2>
   <br>
   
   <form id="f_search" name="f_search">
      <input type="hidden" id="page" name="page" value="${data.page}" /> <input
         type="hidden" id="pageSize" name="pageSize" value="${data.pageSize}" />
      <!--검색-->
      <table summary="검색">
         <tr>
            <td width="300px"><select name="search" id="search">

                  <option value="all">전체</option>
                  <option value="product_name">상품명</option>

            </select> <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" value="" />

            
            <input type="button" value="검색" id="searchData"></td>
         </tr>
      </table>
   </form>
      <br>
   <div id="width80" align="center">
      <div id="width100" >
         <c:choose>
            <c:when test="${not empty productList }">
               <c:forEach var="product" items="${productList }" varStatus="status">
                  <ul>
                     <li>
                        <div>
                           <a
                              href="javascript:goProductDetail(${product.productId },${data.page },${data.pageSize })">
                              <img src="/admin/resources/images/${product.productImage }" width="100%"
                              height="200px">
                              <div>
                                 <div>${product.productCompany }</div>
                                 <div>${product.productName }</div>
                                 <div><fmt:formatNumber value="${product.productPrice }" pattern="###,###,###" /> 원</div>
                              </div>
                           </a>
                        </div>
                     </li>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <label>등록된 상품이 없습니다</label>
            </c:otherwise>
         </c:choose>
         </ul>

      </div>
   </div>
   
  	
   
   <!-- 페이지 네비 -->
   <div id="productPage" align="center">
      <tag:paging page="${param.page }" total="${total }"
         list_size="${data.pageSize }" />
   </div>



   <%@ include file="/footer.jsp"%>
</body>
</html>