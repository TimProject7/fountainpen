<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<c:choose>
	<c:when test="${empty sessionScope.UVO}">
		<h2>로그인성공</h2>
		이름: ${sessionScope.UVO.user_id}님 로그인 성공!
		<a href="logout.do">로그아웃</a>
	</c:when>
	
</c:choose>

</body>
</html>