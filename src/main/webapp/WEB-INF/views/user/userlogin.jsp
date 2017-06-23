<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<%@ include file="/header.jsp"%>
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





	<form id="login" name="login">
		<table>

			<tr>

				<td>아이디<input type="text" id="user_id" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호<input type="text" id="user_password"
					name="user_password"><br> <c:if test="${msg=='id'}">
						<span>아이디 틀렸습니다</span>
					</c:if> <c:if test="${msg1=='pass'}">
						<span>비밀번호가 틀렸습니다</span>
					</c:if>

				</td>
			</tr>
		</table>
		<div id="loginBtn" align="center">
		<input type="button" id="loginBtn" value="로그인"> <label>아이디
			저장 <input type="checkbox">
		</label>
		</div>
	</form>
<div id="loginSubBtn" align="center">
	<form action="userinsertForm.do">
		<label>회원가입을 하시려면 버튼을클릭해주세요<input type="submit" value="회원가입"></label>
	</form>

	<form action="idFind.do">
		<label>아아디를 찾으려면 버튼을클릭해주세요<input type="submit" value="아이디찾기"></label>
	</form>

	<form action="passFind.do">
		<label>비밀번호를 찾으려면 버튼을 클릭해주세요<input type="submit"
			value="비밀번호찾기"></label>
	</form>
	</div>





	<%@ include file="/footer.jsp"%>
</body>
</html>