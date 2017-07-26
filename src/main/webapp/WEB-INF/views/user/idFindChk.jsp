<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 확인</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//목록버튼
	$("#idFindForm").on("click", function() {
	
		$("#homeGO").attr({
			"method" : "POST",
			"action" : "/"
		});
		$("#idFindForm").submit();
	});
});
</script>
</head>
<body>
	<form action="/" id="idFindForm">
	<p align="center">
	
	<label>요청하신 ID : </label>
	<input type="text" id="user_id" name="user_id" value="${userid}" /><br><br>
	<input type="button" value="홈으로 가기" id="homeGO">
	</p>
</form>

</body>
</html>
<%@ include file="/footer.jsp"%>