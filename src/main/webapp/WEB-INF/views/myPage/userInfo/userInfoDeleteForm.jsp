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
<meta charset="UTF-8">
<title>회원탈퇴 폼</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../css/userDelete.css" />
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//회원탈퇴버튼액션
		$("#userDeleteBtn").click(function() {
			var userpass = $("#user_password").val();
			//탈퇴이유 라디오버튼 선택조건
			if (!$(':input:radio[name=user_deleteCondition]:checked').val()) {
				alert("탈퇴이유를 선택해주세요");
				return;

			} else if (!userpass) {
				alert('비밀번호를 입력하세요')
				return;
			} else {


				$("#userDeleteForm").attr({
					"method" : "POST",
					"action" : "/myPage/userInfo/userDeleteAction.do"
				});
				$("#userDeleteForm").submit();
			}
		});

		//취소버튼 홈으로
		$("#usercalcelBtn").click(function() {

			window.location = "/";
		});
	});
</script>
</head>
<body>
	<div class="all">
		<h2 class="center">회원탈퇴</h2>
		<br>
		<p class="center">회원탈퇴를 결심하게된 이유를 선택해 주세요.</p>
		<form id="userDeleteForm" name="userDeleteForm">
			<table>
				<tr>
					<td><input type="radio" id="deleteCondition1"
						name="user_deleteCondition" value="1번" /></td>
					<td><label for="deleteCondition1">1. 날이 좋아서</label></td>
				</tr>
				<tr>
					<td><input type="radio" id="deleteCondition2"
						name="user_deleteCondition" value="2번" /></td>
					<td><label for="deleteCondition2">2. 날이 좋지 않아서</label></td>
				</tr>
				<tr>
					<td><input type="radio" id="deleteCondition3"
						name="user_deleteCondition" value="3번" /></td>
					<td><label for="deleteCondition3">3. 날이 적당해서</label></td>
				</tr>

				<tr>

					<td colspan="2"><br>비밀번호 학인: <input type="password"
						id="user_password" name="user_password" /></td>
				</tr>
			</table>
		</form>
		<p class="center">
			<input type="button" id="userDeleteBtn" name="userDeleteBtn"
				value="회원탈퇴" /> <input type="button" id="usercalcelBtn"
				name="usercalcelBtn" value="취소" />
		</p>
	</div>
</body>
</html>
<%@ include file="/footer.jsp"%>