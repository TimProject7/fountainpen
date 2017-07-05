<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#idfindchk").click(function() {

			if (!chkSubmit($("#user_name"), "이름을을")) {
				return;
			} else if (!chkSubmit($("#user_email"), "이메일을")) {
				return;
			} else {

				$("#idFind").attr({
					"method" : "POST",
					"action" : "/user/idFindchk.do"
				});

				$("#idFind").submit();
			}
		});
	});
</script>

<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

h2 {
	text-align: center;
}

#idFindTable {
	border: 3px;
	border-style: solid;
	padding: 1%;
}

#minired {
	font-size: 0.7em;
	color: red;
}

#idfindchk {
	height: 50px;
}
</style>
</head>
<body>
	<br>
	<h2>아이디찾기</h2>
	<br>
	<form id="idFind" name="idFind">
		<table id="idFindTable">
			<tr>
				<td>이름</td>
				<td><input type="text" id="user_name" name="user_name" /></td>
				<td rowspan="2"><input type="button" id="idfindchk"
					value="아이디찾기"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" id="user_email" name="user_email" /></td>
			</tr>
			<tr>
				<td id="minired" colspan="3"><b>가입시 작성하신 이름과 이메일을 입력하시면
						아이디를 찾으실수있습니다.</b></td>
			</tr>
		</table>
	</form>
	<c:if test="${msg =='success'}">
	<script>alert('입력하신정보가 없습니다');</script>

	</c:if>

	<%@ include file="/footer.jsp"%>
</body>
</html>
