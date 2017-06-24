<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<%@ include file="/header.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/userloginForm.css">
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#loginBtn").click(function() {
			//입력값 체크
			/* if (!chkSubmit($('#user_id'), "아이디를")) {
				return;
			} else if (!chkSubmit($('#user_password'), "비밀번호를")) {
				return; */

			$("#login").attr({
				"method" : "POST",
				"action" : "/user/login.do"
			});
			$("#login").submit();

		});
	});
</script>
</head>
<body>


	<br><br>
	<h2>로그인</h2>
	<div id="div1">
		<form id="login" name="login">
			<table id="loginTb">

				<tr>

					<td>아이디</td>
					<td><input type="text" id="user_id" name="user_id"></td>
					<td rowspan="4" class="rgiht"><input type="button" id="loginBtn" value="로그인"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" id="user_password" name="user_password"></td>
				</tr>
				<tr>
					<td colspan="2"><c:if test="${msg=='id'}">
							<span>아이디 틀렸습니다</span>
						</c:if> <c:if test="${msg1=='pass'}">
							<span>비밀번호가 틀렸습니다</span>
						</c:if></td>
				</tr>
				<tr>
					<td colspan="3"><label>아이디저장 <input type="checkbox"></label></td>
				</tr>
				
			</table>
		</form>
		
			<form class="btn3" action="userinsertForm.do">
				<input id="btns" type="submit" value="회원가입">
			</form>
			<form action="idFind.do">
				<input id="btns" type="submit" value="ID 찾기">
			</form>

			<form action="passFind.do">
				<input id="btns" type="submit" value="PW 찾기">
			</form>
	</div>




	<%-- 	<%@ include file="/footer.jsp"%> --%>
</body>
</html>