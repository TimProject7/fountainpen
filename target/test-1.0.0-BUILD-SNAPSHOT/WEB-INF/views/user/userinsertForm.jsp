<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/css/user.css">
<script type="text/javascript" src="../js/common.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	//비밀번호가맞는지 확인
	$(function() {
		/* keyup 텍스트에 커서가 올라가면 반응하는 명령어 */
		$('#user_password').keyup(function() {
			$('font[name=check]').text('');
		}); //user_password.keyup

		$('#user_passwordchk').keyup(function() {
			if ($('#user_password').val() != $('#user_passwordchk').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호틀림");

			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호맞음");
			}
		}); //#user_passwordchk.keyup
	});

	//저장버튼 클릭시 userinsert 페이지로 이동
	$(document).ready(
			function() {
				//아이디 중복 체크 ajax 비동기
				$("#user_idcheckBtn").click(
						function() {
							if (!chkSubmit($("#user_id"))) {
								return;
							} else {
								$.ajax({
									url : "/user/useridcheck.do", //전송url
									type : "POST", //전송방식
									data : $("#user_id").serialize(),
									error : function(result) {
										alert('시스템오류')
									},
									success : function(result) {
										if (result == 0) {
											alert('사용가능한 아이디입니다')
											$("#msg").text("사용가능한 아이디입니다").css(
													"color", "blue");
											$("#user_password").select();
										} else if (result == 1) {
											$("#msg").text("중복된 아이디입니다").css(
													"color", "red");
											$("#user_id").select();
											alert('이미사용한 아이디입니다');
										}
									}
								});
							}
						});

				//메일소스

				$("#mailSubmit").click(
						function() {
							if (!chkSubmit($("#user_email"))) {
								return;
							} else {
								$.ajax({
									url : "/mail/mailForm.do", //전송url
									type : "POST", //전송방식
									data : $("#user_email").serialize(),
									error : function(content) {
										alert('시스템오류')
									},
									success : function(content) {
										var content = content;
										//input태그 name=mailkey1에 .attr('value',content) 벨류에 콘텐츠값을넣는다
										$('input[name=mailkey1]').attr('value',
												content);
									}
								});
							}
						});

				$("#mailBtn").click(function() {

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
				/* 저장 버튼 클릭시 처리 이벤트 */
				$("#singupBtn").click(function() {
					var chk_radio = document.getElementsBynName

					if (!chkSubmit($('#user_name'), "이름을")) {
						return;
					} else if (!chkSubmit($('#user_id'), "아이디를")) {
						return;
					} else if (!chkSubmit($('#user_password'), "비밀번호를")) {
						return;
					} else if (!chkSubmit($('#user_email'), "메일을")) {
						return;
					} else if (!chkSubmit($('#zip_code'), "주소를")) {
						return;
					} else if (!chkSubmit($('#detail_address'), "상세주소를 ")) {
						return;
					} else if (!chkSubmit($('#user_birthday'), "생년월일을")) {
						return;
					} else if (!chkSubmit($('#user_cell'), "전화번호를")) {
						return;
					} else if (!chkSubmit($('#user_phone'), "핸드폰번호를")) {
						return;
					}else if (!$(':input:radio[name=user_gender]:checked').val()) {
						alert("성별을 선택해주세요");
						return;
					}else if (!$(':input:checkbox[name=user_privacyconsignment]:checked').val()) {
						alert("약관1 선택해라");
						return;
					}else if (!$(':input:checkbox[name=user_termsofuse]:checked').val()) {
						alert("약관2 선택해라");
						return;
					}else if (!$(':input:checkbox[name=user_receiveadvertising]:checked').val()) {
						alert("약관3 선택해라");
						return;
					} else {

						//입력값 체크

						$("#singupform").attr({
							"method" : "POST",
							"action" : "/user/userinsert.do"
						});

						$("#singupform").submit();

					}
				});

			});

	$(function() {

		$('#searchBtn')
				.click(
						function(e) {
							e.preventDefault();

							$
									.ajax({
										url : '/zipcode/list.do', //url요청
										data : $('#d_form').serialize(), //form에  데이터요청
										type : 'POST', //POST방식
										dataType : 'json', //json 
										success : function(result) {

											$("#zipcodeList").empty();

											var html = '';

											if (result.errorCode != null
													&& result.errorCode != '') {
												html += '<tr>';
												html += '   <td colspan="2">';
												html += result.errorMessage;
												html += '   <td>';
												html += '</tr>';

											} else {
												// 검색결과를 list에 담는다.
												var list = result.list;

												for (var i = 0; i < list.length; i++) {
													html += "<tr>";
													html += "    <td>";
													// 우편번호
													var zipcode = list[i].zipcode;
													// 주소
													var address = list[i].address;

													html += list[i].zipcode;
													html += "    </td>";
													html += "    <td>";
													html += '<a href="#" onclick="javascript:put(\''
															+ list[i].address
															+ '\',\''
															+ zipcode
															+ '\')">'
															+ address
															+ '</a>';
													html += "    </td>";
													html += "</tr>";
												}
											}

											$("#zipcodeList").append(html);
										}
									});
						});

		//다이얼로그 팝업창을 연다 !
		$("#dialog_form").dialog({
			autoOpen : false,
			height : 400,
			width : 700,
			modal : true,
			buttons : {

				Cancel : function() {
					dialog.dialog("close");
				}
			},
			close : function() {
				/*************				
				close 될떄
				trigger("reset") 입력창의 내용 리셋  
				remove = tbladdr 테이블의 tr을 삭제함으로써 주소리스트를 없앤다 
				 */
				$("#d_form").trigger("reset");
				$("#tbladdr tr:not(:first)").remove();
			}
		});

		//다이얼 로그 팝업창 오픈-!
		$("#zipcodesearch").click(function() {
			$("#dialog_form").dialog("open");
		});
	});

	//put 함수 주소와 코드번호의 값을 전달한다.
	//dialog('close')로 다이얼로그창 종료
	function put(address, zipcode) {
		var address = address;
		var zipcode = zipcode;
		// 모달창 닫기
		$("#dialog_form").dialog('close');
		$("#zip_code").val(zipcode);
		$("#user_address").val(address);
	}
</script>
</head>
<body>
	<div id="content" align="center">
		<!--다이얼로그창 폼  -->
		<div id="dialog_form">
			<form id="d_form">

				<br> <input type="radio" name="target" value="postNew">
				지번 우편번호(2015년 8월 1일 시행되는 5자리 구역번호)<br> <input type="radio"
					name="target" value="postNew"> 도로명 우편번호(2015년 8월 1일 시행되는
				5자리 구역번호) <br> <br> <input type="text" name="query"
					id="query"> <input type="button" value="검색" id="searchBtn">



				<p></p>

				<div>
					<table border="1" id="tbladdr">
						<thead>
							<tr>

								<th style="width: 150px;">우편번호</th>
								<th style="width: 600px;">내용</th>
							</tr>
						</thead>
						<!-- 주소 리스트 -->
						<tbody id="zipcodeList"></tbody>
					</table>
				</div>
			</form>
		</div>
		<form id="singupform" name="singupform">

			<table id=content_table border="1">

				<tr>
					<td>이름</td>
					<td><input type="text" id="user_name" name="user_name"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="user_id" name="user_id"> <input
						type="button" id="user_idcheckBtn" name="user_idcheckBtn"
						value="중복확인"><br> <span id="msg"></span></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="user_password"
						name="user_password"><span id="password_msg"></span></td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" id="user_passwordchk"
						name="user_passwordchk"> <font name="check" size="2"
						color="red"></font></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="user_email" name="user_email"
						size="120" style="width: 30%" placeholder="상대의 이메일"
						class="form-control" value="${user_email}"> <input
						type="button" value="메일 인증" class="btn btn-warning"
						id="mailSubmit"><br>
				</tr>
				<tr>
					<td>인증번호</td>
					<td><input type="text" name="mailkey" id="mailkey"
						placeholder="인증키를 입력하세요"> <input type="button"
						name="mailBtn" id="mailBtn" value="확인"><br> <input
						type="text" name="mailkey1" id="mailkey1" value=""></td>
				</tr>
				<tr>
					<td><span>우편번호</span></td>
					<td><input type="text" id="zip_code" name="zip_code">
				</tr>
				<tr>
					<td>
						<button type="button" id="zipcodesearch">주소검색</button> <br> <span>주소</span>
					</td>


					<td><input type="text" id="user_address" name="user_address">
						<br> <span>상세주소</span></td>
					<td><input type="text" id="detail_address"
						name="detail_address"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" id="user_birthday" name="user_birthday"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" id="user_cell" name="user_cell"></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text" id="user_phone" name="user_phone"></td>
				</tr>
				<tr>
					<td>성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><label>남 <input type="radio" id="user_gender"
							name="user_gender" value="man" required="required"></label> <label>여
							<input type="radio" id="user_gender" name="user_gender"
							value="girl" required="required">
					</label></td>
				</tr>
				<tr>
					<td>약관동의</td>
					<td><input type="checkbox" id="user_privacyconsignment"
						name="user_privacyconsignment" value="1"> <br> <textarea
							rows="5" cols="40"></textarea></td>
				</tr>
				<tr>
					<td>이용약관</td>
					<td><input type="checkbox" id="user_termsofuse"
						name="user_termsofuse" value="1"> <br> <textarea
							rows="5" cols="40"></textarea></td>
				</tr>
				<tr>
					<td>광고동의</td>
					<td><input type="checkbox" id="user_receiveadvertising"
						name="user_receiveadvertising" value="1"> <br> <textarea
							rows="5" cols="40"></textarea></td>
				</tr>
			</table>
		</form>
		<input type="button" value="가입완료" id="singupBtn">

	</div>



</body>
</html>
<%@ include file="/footer.jsp" %>