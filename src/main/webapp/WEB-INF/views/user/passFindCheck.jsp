<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/header.jsp"%>



<h2>새로운 비밀번호를 입력하세요</h2>
<form action="/user/passFindChange.do" method="POST">
	<table>
		<tr>
			<td><input type="text" id="user_id" name="user_id"
				value="${userid}" readonly="readonly">
		</tr>
		<tr>
			<td><label>새 비밀번호 입력<input type="password"
					id="user_password" name="user_password"></label></td>
		</tr>
		<tr>
			<td><label>비밀번호 확인<input type="password"></label></td>
		</tr>
	</table>
	<input type="submit" id="passChange" value="변경완료" />
</form>
<%@ include file="/footer.jsp"%>