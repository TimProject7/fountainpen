<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>

<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#passFind_email_Btn")
								.click(
										function() {
											if (!chkSubmit($("#user_email"),
													"이메일을")) {
												return;
											} else {
												$
														.ajax({
															url : "/mail/passchkmail.do", //전송url
															type : "POST", //전송방식
															data : $('#passfindForm')
																	.serialize(),
															error : function(
																	content) {
																alert('시스템오류')
															},
															success : function(
																	content) {
																var content = content;
																if (content != null) {
																	//input태그 name=mailkey1에 .attr('value',content) 벨류에 콘텐츠값을넣는다
																	$(
																			'input[name=mailkey1]').attr(
																					'value',
																					content);

																	var mailkeychk = '<input type="button" value="인증확인" id="mailkeychk" name="mailkeychk" />';
																	$('#mailkeytd').append(mailkeychk);

																	/* var mailkeychk= '<input type="button" id="mailkeychk" value="확인"/>';
																	$("body").html(mailkeychk); */
																}else{
																	alert('일치하는 정보가 없습니다.')
																}
															}
														});
											}
										});

						$("#mailkeytd").on("click", function() {

							var result = 0;
							if ($("#mailkey").val() == null) {
								alert("인증번호를 입력하세요")
								return false;
							}

							if ($("#mailkey").val() != $("#mailkey1").val()) {
								alert("인증 실패");
								result = 0;
								return false;
							} else {
								alert("인증 성공");
								result = 1;
							}

						});

						$("#passFind_Btn").click(function() {

							if (!chkSubmit($("#user_name"), "이름을을")) {
								return;
							} else if (!chkSubmit($("#user_id"), "아이디를")) {
								return;
							} else if (!chkSubmit($("#user_email"), "이메일을")) {
								return;
							} else if (!chkSubmit($("#mailkey"), "인증번호를")) {
								return;
							} else {
								$("#passfindForm").attr({
									"method" : "POST",
									"action" : "/user/passFindCheck.do"
								});

								$("#passfindForm").submit();
							}
						})

					});
</script>

<style type="text/css">
#mailkey1 {
	display: none;
}

*{
	margin: 0 auto;
	padding: 0;
}

h2{
	text-align: center;
}

table{
	border: 3px;
	border-style: solid;
	padding: 1%;
}

#minired{
	font-size: 0.7em;
	color: red;
	text-align: center;
}

#passFind_Btn{
	
}
</style>
</head>
<body>
	<form id="passfindForm" name="passfindForm">
		<div id="passfind_email">
			<br><h2>비밀번호 찾기</h2><br>
			<table id="passfind_ul_label">
				<tr>
					<td>이름</td>
					<td><input type="text" id="user_name" name="user_name" /></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="user_id" name="user_id" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" id="user_email" name="user_email" />
						<button type="button" id="passFind_email_Btn">인증메일 발송</button></td>
				</tr>
				<tr>
					<td>인증번호</td>
					<td><input type="text" id="mailkey" name="mailkey"><span
						id="mailkeytd"></span></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" id="mailkey1" name="mailkey1"></td>
				</tr>
				
				<tr>
					<td id="minired" colspan="3"><b>가입시 작성하신 이름, 이메일, 아이디를 입력하시면<br>비밀번호를 찾으실수 있습니다.</b></td>
				</tr>
				
				<tr>
					<td colspan="3"><center><button type="submit" id="passFind_Btn">비밀번호 찾기</button></center></td>
				</tr>
				
			</table>
		</div>
	</form>
	

	<!-- 	<form id="passfind2">
		<div id="passfind_email">
			<ul id="passfind_ul_label">
				<li>이름</li>
				<li>아이디</li>
				<li>질문</li>
				<li>답변</li>
			</ul>
			<ul id="passfind_ul_input">
				<li><input type="text" id="user_name" name="user_name"></li>
				<li><input type="text" id="user_id" name="user_id"/></li>
				<li><input type="email" id="user_email" name="user_email" /></li>
				<li><input type="text" /></li>
			</ul>
			<p>
				<label>가입시 작성하신 이름, 아이디, 질문/답변을 입력하시면 비밀번호를 찾을수있습니다.</label>
			</p>
			<input type="button" id="passFind_quiz_Btn" value="비밀번호찾기" />

		</div>
	</form> -->


</body>
</html>