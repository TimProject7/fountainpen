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
	/* $(document).ready(function() {

	$("#loginBtn").click(function() {
		//입력값 체크

		$("#userlogin").attr({
			"method" : "POST",
			"action" : "/user/login.do"
		});
		$("#login").submit();
	});
	});  */
</script>
</head>
<body>

	<c:choose>
		<c:when test="${not empty sessionScope.UVO}">
			<h2>로그인성공</h2>
	이름: ${UVO.user_id}<br>
		이름: ${UVO.user_name}<br>
			<br>
			<a href="logout.do">로그아웃</a>
			<br>
			<br>
			<a href="page1.do">페이지1</a>
		</c:when>
		


		<c:otherwise>

			<form id="login" name="login" method="POST" action="login.do">
				<table>
					<tr>
						<td>아이디<input type="text" id="user_id" name="user_id"></td>
					</tr>
					<tr>
						<td>비밀번호<input type="text" id="user_password"
							name="user_password"></td>
					</tr>
				</table>
				<input type="submit" id="loginBtn" value="로그인">
			</form>
		</c:otherwise>
	</c:choose>




</body>
</html>