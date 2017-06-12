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
	$(document).ready(function() {
		/* 저장 버튼 클릭시 처리 이벤트 */
		$("#loginBtn").click(function() {
			//입력값 체크

			$("#userlogin").attr({
				"method" : "POST",
				"action" : "/user/userlogin.do"
			});
			$("#userlogin").submit();
		});
	});
</script>
</head>
<body>

	
		<form id="userlogin">
			<table>
				<tr>
					<td>아이디<input type="text" id="user_id" name="user_id"></td>
				</tr>
				<tr>
					<td>비밀번호<input type="text" id="user_password"
						name="user_password"></td>
				</tr>
			</table>
		</form>
		<input type="button" id="loginBtn" value="로그인">
	

	
</body>
</html>