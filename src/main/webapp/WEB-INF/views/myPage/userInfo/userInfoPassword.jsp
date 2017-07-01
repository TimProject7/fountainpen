<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보변경 비밀번호입력 페이지</title>
<link rel="stylesheet" href="/css/buyList.css" />
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<script type="text/javascript" src="../../js/common.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.UVO}">
			<h2 align="center">마이페이지 접속을 위해 비밀번호를 입력하세요</h2><br>
			<form action="/myPage/userInfo/userInfoForm.do" method="POST">
				<table>
					<!-- 비밀번호확인 아이디 -->
					<tr>
						<td><input type="hidden" id="user_number" name="user_number"
							value="${sessionScope.UVO.user_number}">
					</tr>
					<tr>
						<td><label>비밀번호 입력<input type="password"
								id="user_password" name="user_password"></label><br><br>
								<c:if test="${result == false}">
								<span>비밀번호가틀렸습니다.</span>
								</c:if>
								</td>
					</tr>
				</table>
				<div id="passChangeBtn" align="center">
					<input type="submit" id="passChange" value="비밀번호확인" />
				</div>
			</form>
		</c:when>
	</c:choose>
	<%@ include file="/footer.jsp"%>
</body>
</html>