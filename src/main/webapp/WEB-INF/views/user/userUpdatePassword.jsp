<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보변경 비밀번호입력 페이지</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.UVO}">
			<h2>개인정보변경 비밀번호를 입력하세요</h2>
			<form action="/user/userUpdateForm.do" method="POST">
				<table>
					<tr>
						<td><input type="text" id="user_id" name="user_id"
							value="${sccionScope.UVO.user_id}">
					</tr>
					<tr>
						<td><label>비밀번호 입력<input type="password"
								id="user_password" name="user_password"></label></td>
					</tr>
				</table>
				<input type="submit" id="passChange" value="비밀번호확인" />
			</form>
		</c:when>
	</c:choose>
	<%@ include file="/footer.jsp"%>
</body>
</html>