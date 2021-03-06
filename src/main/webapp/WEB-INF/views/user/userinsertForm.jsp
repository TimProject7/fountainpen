<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>
<%@ include file="/header.jsp"%>
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

	//정규식
	$(function() {
		var regId = /^[A-Za-z0-9+]{4,16}$/;	// 아이디 유효성 검사식 4자리이상 16자리이하, 영문과 숫자만 가능
		var regpwd = /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 비밀번호유효성검사 4자리이상 16자리이하 ,숫자혹은 특수문자를 반드시 포함
		var regemail=/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{3}$/; 	//이메일 유효성검사
		var regphone =/(\d{3}).*(\d{4}).*(\d{4})/; //핸드폰번호 유효성 검사
		var regname =/^[가-힣]{3}|[a-zA-Z]{3}\s[a-zA-Z]{3,15}$/; //이름검사

		
		$('#user_id').keyup(function(){
			if(regId.test($('#user_id').val())){
				$("#msgid").text("중복체크를 하세요").css("color","red");
				$("#chk").val('N');
				return false;
			}else{
				$("#msgid").text("아이디는4자리이상 16자리이하 영문과 숫자만 가능").css("color","red");
				$("#chk").val('N');
			}
		})
		
		/* keyup 텍스트에 커서가 올라가면 반응하는 명령어 */
		$('#user_password').keyup(function() {
			//var regpwd = /^(?=.*[a-zA-Z])((?=.*\d)|(?=*\W)).{4,16}$/;
			
				if(!regpwd.test($('#user_password').val())){
					$("#msgpwd").text("비밀번호는 4자리이상 16자리이하, 숫자혹은 특수문자를 반드시포함").css("color","red");
					$("#chk").val('N');
					return false;
				}else{
					$("#msgpwd").text("사용가능한 비밀번호입니다.").css("color","blue");
					$("#chk").val('N');
				}
		}); //user_password.keyup

		$('#user_passwordchk').keyup(function() {
			if ($('#user_password').val() == $('#user_passwordchk').val()) {
				$("#msgpwdchk").text("비밀번호 일치").css("color","blue");
				$("#chk").val('Y');
			}else{
				$("#msgpwdchk").text("비밀번호 불일치").css("color","red");
				$("#chk").val('N');
				return false;
			}
		}); //#user_passwordchk.keyup
		
		$('#user_name').keyup(function(){
			if(!regname.test($('#user_name').val())){
				$("#msgname").text("이름은 한글,영어").css("color","red");
				$("#chk").val('N');
				return false;
			}else{
				$("#msgname").text("사용가능").css("color","blue");
				$("#chk").val('Y');
			}
			
		});
		
		$('#user_email').keyup(function(){
			if(!regemail.test($('#user_email').val())){
				$("#msgemail").text("이메일형식에 맞게 입력해주세요").css("color","red");
				$("#chk").val('N');
				return false;
			}else{
				$("#msgemail").text("이메일인증 버튼클릭").css("color","blue");
			}
			
		});
		$('#user_phone').keyup(function(){
			if(!regphone.test($('#user_phone').val())){
				$("#msgphone").text("핸드폰번호 형식에 맞게 입력해주세요").css("color","red");
				$("#chk").val('N');
				return false;
			}else{
				$("#msgphone").text("").css("color","red");
				$("#chk").val('Y');
			}
		});
	});

	//저장버튼 클릭시 userinsert 페이지로 이동
	$(document).ready(function() {
		



		
						//아이디 중복 체크 ajax 비동기
						$("#user_idcheckBtn").click(function() {
							
											if (!chkSubmit($("#user_id"))) {
												return false;
											
											} else {
													//serialize() 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
													//serialize()를 이용하면 일일이 fname=값&femail=값&sex=값&job=값 이렇게 안해주어도 된다.
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
																	$("#msgid").text("사용가능한 아이디입니다").css("color","blue");
																	//패스워드텍스트필드선택
																	$("#user_password").select();
																	$("#chk").val('Y');
																	
																} else if (result == 1) {
																	$("#msgid").text("중복된 아이디입니다").css("color","red");
																	$("#user_id").select();
																	alert('이미사용한 아이디입니다');
																	$("#chk").val('N');
																}
															}
														});
											}
										});

						//메일소스
						$("#mailSubmit").click(function() {
							var regemail=/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{3}$/; 	//이메일 유효성검사
											if (!chkSubmit($("#user_email"))) {
												return false;
											}else if(!regemail.test($('#user_email').val())){
												alert('이메일 형식이 맞지않습니다.')
												$('#user_email').focus();
												return false;
											} else {
													$.ajax({
															url : "/mail/mailForm.do", //전송url
															type : "POST", //전송방식
															data : $("#user_email").serialize(),
															error : function(content) {
																alert('시스템오류')
															},
															success : function(content) {
																if(content == 1){
																//input태그 name=mailkey1에 .attr('value',content) 벨류에 콘텐츠값을넣는다
																$("#msgemail").text("사용중인 이메일입니다.").css("color","red");
																$("#chk").val('N');
																}else{
																	alert('인증메일 발송');
																	$('input[name=mailkey1]').attr('value',content);
																	$("#msgemail").text("인증번호를 입력하세요").css("color","blue");
																	$("#chk").val('N');
																	//인증텍스트로 포커스이동
																	$('#user_mailkey').focus();
																}
															}
														});
											}
										});

						//인증번호확인
						$("#mailBtn").click(function() {

							var result = 0;
							if ($("#mailkey").val() == null) {
								alert("인증번호를 입력하세요")
								return false;
							}

							if ($("#mailkey").val() != $("#mailkey1").val()) {
								alert("인증 실패");
								result = 0;
								$("#mailkey").val("");
								$("#chk").val('N');
								return false;
							} else {
								alert("인증 성공");
								result=1;
								$("#chk").val("Y");
								
							}

						});
						//회원가입버튼 클릭
						$("#singupBtn").click(function() {
											var chk_radio = document.getElementsBynName
											//각 텍스트의 값을 변수에 답는다
											var userid = $('#user_id').val();
											var userpw = $('#user_password').val();
											var userpwd = $('#user_passwordchk').val();
											var username =$('#user_name').val();
											var userbirthday =$('#user_birthday').val();
											var useremail = $('#user_email').val();
											var userzipcode =$('#zip_code').val();
											var useraddr =$('#user_address').val();
											var userdetailaddr =$('#detail_address').val();
											var usercell =$('#user_cell').val();
											var userphone =$('#user_phone').val();
											
										
											//메일체크 확인값
											var chk = $("#chk").val();
											
											//
											if(!userid){
												alert('아이디를 입력하세요')
												$("#chk").val('N');
												$('#user_id').focus();
												return false;
											}
											if(!userpw){
												alert('비밀번호를 입력해주세요')
												$("#chk").val('N');
												$('#user_password').focus();
												return false;
											}
											if(!userpwd){
												alert('비밀번호확인을 입력해주세요')
												$("#chk").val('N');
												$('#user_passwordchk').focus();
												return false;
											}
											//
											if(!username){
												alert('이름을 입력하세요')
												$("#chk").val('N');
												$('#user_name').focus();
												return false;
											}
											if(!userbirthday){
												alert('생년월일을 입력하세요')
												$("#chk").val('N');
												$('#user_birthday').focus();
												return false;
											}
											//
											if(!useremail){
												alert('이메일을 입력하세요')
												$("#chk").val('N');
												$('#user_email').focus();
												return false;
											}
											//메일인증키확인
											if(chk!='Y'){
												alert('메일인증번호를 확인하세요')
												$("#chk").val('N');
												$('#user_mailkey').focus();
												return false;
											}
											//
											if(!userzipcode){
												alert('주소를 입력하세요')
												$("#chk").val('N');
												return false;
											}
											//
											if(!useraddr){
												alert('주소를 입력하세요')
												$("#chk").val('N');
												return false;
											}
											//
											if(!userdetailaddr){
												alert('상세주소를 입력하세요')
												$("#chk").val('N');
												$('#detail_address').focus();
												return false;
											}
											//
											if(!userphone){
												alert('핸드폰번호를 입력하세요')
												$("#chk").val('N');
												$('#user_phone').focus();
												return false;
											}
											
											 if (!$(':input:radio[name=user_gender]:checked').val()) {
												alert("성별을 선택해주세요");
												$("#chk").val('N');
												return;
												
											} else if (!$(':input:checkbox[name=user_privacyconsignment]:checked').val()) {
												alert("약관1 선택해라");
												$("#chk").val('N');
												return;
												
											} else if (!$(':input:checkbox[name=user_termsofuse]:checked').val()) {
												alert("약관2 선택해라");
												$("#chk").val('N');
												return;
												
											}
											//입력값 체크
											if($("#chk").val('Y')){
											$("#singupform").attr({
																"method" : "POST",
																"action" : "/user/userinsert.do"
															});

											$("#singupform").submit();

									}else{
										alert('입력되지않은정보 혹은 잘못입력하신정보가있습니다')
									}
								});
						});

			$(function() {
				$('#searchBtn').click(function(e) {
							e.preventDefault();
							$.ajax({
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
													//a우편번호와 주소를 <a>태그로 감싸서 주소와 우편번호에 온클릭명령어를 정의하여 put함수를 호출해서 클릭시 회원가입 입력창으로 값이 전달된다.
													html += '<a href="#" onclick="javascript:put(\''+ list[i].address+ '\',\''+ zipcode+ '\')">'+ address+ '</a>';
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
					remove = tbladdr 테이블의 tr을 삭제함으로써 주소리스트를 초기화한다. 
					****************/
					$("#d_form").trigger("reset");
					$("#tbladdr tr:not(:first)").remove();
					}
				});
		//다이얼 로그 팝업창 오픈-!
		$("#zipcodesearch").click(function() {
			$("#dialog_form").dialog("open");
			//eKey(e)
		});
		
		
		
	});

		/* function eKey(e){
		   if(e.keyCode == 13 && e.srcElement.type != 'textarea'){
		      if(!changePw()){
		         return false;
		      }
		   }
		} */
		
	//put 함수 매개변수로  주소와 우편번호의 값을 전달한다.
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
<input type="hidden" id="chk" name="chk" value="N"/>
<input type="text" name="mailkey1" id="mailkey1" value=""></td>
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
					<th id="column">아이디</th>
					<td id="column2"><input type="text" id="user_id"
						name="user_id" autofocus="autofocus"> <input type="button"
						id="user_idcheckBtn" name="user_idcheckBtn" value="중복확인">
						
						<span id="msgid"></span>
					</td>
				</tr>
				<tr>
					<th id="column">비밀번호</th>
					<td id="column2"><input type="password" id="user_password"
						name="user_password"><span id="msgpwd"></span></td>
				</tr>
				<tr>
					<th id="column">비밀번호확인</th>
					<td id="column2"><input type="password" id="user_passwordchk"
						name="user_passwordchk"><span id="msgpwdchk"></span></td>
				</tr>
				<tr>
					<th style="width: 20%;" id="column">이름</th>
					<td id="column2"><input type="text" id="user_name"
						name="user_name"><span id="msgname"></span></td>
				</tr>
				<tr>
					<th id="column">생년월일</th>
					<td id="column2"><input type="text" id="user_birthday"
						name="user_birthday" placeholder="예:19900524" maxlength="8"></td>
				</tr>
				<tr id="mail">
					<th id="column">이메일</th>
					<td id="column2">
					<input type="email" id="user_email" name="user_email" size="120" style="width: 30%" placeholder="이메일을입력하세요" class="form-control" value="${user_email}">
					<input type="button" value="메일 인증" class="btn btn-warning" id="mailSubmit">
					<br><span id="msgemail"></span>
				</tr>
				<tr id="mailcheck">
					<th id="column">인증번호</th>
					<td id="column2">
					<input type="text" name="mailkey" id="mailkey" placeholder="인증키를 입력하세요"> 
					<input type="button" name="mailBtn" id="mailBtn" value="확인">
					
				</tr>
				<tr>
					<th id="column">우편번호</th>
					<td id="column2"><input type="text" id="zip_code"
						name="zip_code" readonly="readonly">
						<button type="button" id="zipcodesearch">주소검색</button></td>
				</tr>
				<tr>
					<th id="column">주소</th>
					<td id="column2"><input type="text" id="user_address"
						name="user_address" readonly="readonly"> <input type="text"
						id="detail_address" name="detail_address" placeholder="상세주소">

					</td>
				</tr>

				<tr>
					<th id="column">전화번호</th>
					<td id="column2"><input type="text" id="user_cell"
						name="user_cell"></td>
				</tr>
				<tr>
					<th id="column">핸드폰번호</th>
					<td id="column2"><input type="text" id="user_phone"
						name="user_phone" placeholder="예:01031238928"><span id="msgphone"></span></td>
				</tr>
				<tr>
					<th id="column">성별</th>
					<td id="column2"><label id="user_gender" name="user_gender">남
							<input type="radio" id="user_gender" name="user_gender"
							value="man" required="required">
					</label> <label id="user_gender" name="user_gender">여 <input
							type="radio" id="user_gender" name="user_gender" value="girl"
							required="required">
					</label></td>
				</tr>
				<tr>
					<th id="column">PARKER 이용약관</th>
					<td id="column2"><input type="checkbox"
						id="user_privacyconsignment" name="user_privacyconsignment"
						value="동의">
						<p id="right_font">PARKER 이용약관에 동의합니다. (필수)</p> <br> <textarea
							rows="5" cols="40" id="user_privacyconsignment_content">
							제 1 조 (목적)
이 약관은 파카 주식회사 ("회사" 또는 "파카")가 제공하는 파카 및 파카 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 파카 및 파카 관련 제반 서비스를 의미합니다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
제 3 조 (약관의 게시와 개정)
①"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
②"회사"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
③"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
④회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
⑤회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.
제 4 조 (약관의 해석)
①"회사"는 "유료서비스" 및 개별 서비스에 대해서는 별도의 이용약관 및 정책(이하 "유료서비스약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "유료서비스약관 등"이 우선하여 적용됩니다.
②이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "유료서비스약관 등" 및 관계법령 또는 상관례에 따릅니다.
제 5 조 (이용계약 체결)
①이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
②"회사"는 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.
2.실명이 아니거나 타인의 명의를 이용한 경우
3.허위의 정보를 기재하거나, "회사"가 제시하는 내용을 기재하지 않은 경우
4.14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
5.이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
③제1항에 따른 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
④"회사"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
⑤제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
⑥이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
⑦"회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
⑧"회사"는 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.
제 6 조 (회원정보의 변경)
①"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.
②"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.
③제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.
제 7 조 (개인정보보호 의무)
"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다.
제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)
①"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
②"회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "회사" 및 "회사"의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.
③"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.
④제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.
제 9 조 ("회원"에 대한 통지)
①"회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있습니다.
②"회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.
제 10 조 ("회사"의 의무)
①"회사"는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
②"회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.
③"회사"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.
제 11 조 ("회원"의 의무)
①"회원"은 다음 행위를 하여서는 안 됩니다.
1.신청 또는 변경 시 허위내용의 등록
2.타인의 정보도용
3."회사"가 게시한 정보의 변경
4."회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5."회사"와 기타 제3자의 저작권 등 지적재산권에 대한 침해
6."회사" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7.외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위
8.회사의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위
9.기타 불법적이거나 부당한 행위
②"회원"은 관계법, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "회사"가 통지하는 사항 등을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 하여서는 안 됩니다.
③"회원"이 카페, 블로그 서비스를 이용하여 통신판매 또는 통신판매중개를 업으로 하는 경우 전자상거래 등에서의 소비자보호에 관한 법률에 따른 의무를 준수하여야 하며, 회사는 개별 서비스 이용약관 및 정책에서 관련 내용을 규정할 수 있습니다.
제 12 조 ("서비스"의 제공 등)
①회사는 회원에게 아래와 같은 서비스를 제공합니다.
1.검색 서비스
2.개방형 서비스(블로그, 카페 등)
3.게시판형 서비스(지식iN, 뉴스 등)
4.메일서비스
5.보안패치, 백신서비스
6.기타 "회사"가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 "회원"에게 제공하는 일체의 서비스
②회사는 "서비스"를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.
③"서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
④"회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "회사"는 제9조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
⑤"회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.
제 13 조 ("서비스"의 변경)
①"회사"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 변경할 수 있습니다.
②"서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 서비스 초기화면에 게시하여야 합니다.
③"회사"는 무료로 제공되는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.
제 14 조 (정보의 제공 및 광고의 게재)
①"회사"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다.
②제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 제외됩니다.
③"회사"는 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "회사"에게 할 수 있습니다.
④"이용자(회원, 비회원 포함)"는 회사가 제공하는 서비스와 관련하여 게시물 또는 기타 정보를 변경, 수정, 제한하는 등의 조치를 취하지 않습니다.
제 15 조 ("게시물"의 저작권)
①"회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당 게시물의 저작자에게 귀속됩니다.
②"회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 회사는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
③"회사"는 제2항 이외의 방법으로 "회원"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"의 동의를 얻어야 합니다.
제 16 조 ("게시물"의 관리)
①"회원"의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, "회사"는 관련법에 따라 조치를 취하여야 합니다.
②"회사"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다.
③본 조에 따른 세부절차는 "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 "회사"가 정한 "게시중단요청서비스"에 따릅니다.
- 게시중단요청서비스 : http://help.parker.com/claim_main.asp
제 17 조 (권리의 귀속)
①"서비스"에 대한 저작권 및 지적재산권은 "회사"에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.
②"회사"는 서비스와 관련하여 "회원"에게 "회사"가 정한 이용조건에 따라 계정, "아이디", 콘텐츠, "포인트" 등을 이용할 수 있는 이용권만을 부여하며, "회원"은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.
제 18 조 (포인트)
"회사"는 서비스의 효율적 이용 및 운영을 위해 사전 공지 후 "포인트"의 일부 또는 전부를 조정할 수 있으며, "포인트"는 회사가 정한 기간에 따라 주기적으로 소멸할 수 있습니다.
제 19 조 (계약해제, 해지 등)
①"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
②"회원"이 계약을 해지할 경우, 관련법 및 개인정보처리방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다.
③"회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 메일, 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이 되어 재게시되거나, 공용게시판에 등록된 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.
제 20 조 (이용제한 등)
①"회사"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.
②"회사"는 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 "포인트" 및 기타 혜택 등도 모두 소멸되며, "회사"는 이에 대해 별도로 보상하지 않습니다.
③"회사"는 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.
④"회사"는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 및 개별 서비스상의 운영정책에서 정하는 바에 의합니다.
⑤본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에는 "회사"는 제9조["회원"에 대한 통지]에 따라 통지합니다.
⑥"회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "회사"가 인정하는 경우 "회사"는 즉시 "서비스"의 이용을 재개합니다.
제 21 조 (책임제한)
①"회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.
②"회사"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.
③"회사"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
④"회사"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
⑤"회사"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
제 22 조 (준거법 및 재판관할)
①"회사"와 "회원"간 제기된 소송은 대한민국법을 준거법으로 합니다.
②"회사"와 "회원"간 발생한 분쟁에 관한 소송은 제소 당시의 "회원"의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 "회원"의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다.
③해외에 주소나 거소가 있는 '회원' 의 경우 '회사'와 '회원'간 발생한 분쟁에 관한 소송은 전항에도 불구하고 대한민국 서울중앙지방법원을 관할 법원으로 합니다.
							
							</textarea></td>
				</tr>
				<tr>
					<th id="column">PARKER 개인정보</th>
					<td id="column2"><input type="checkbox" id="user_termsofuse"
						name="user_termsofuse" value="동의">
						<p id="right_font">PARKER 개인정보 정보수집에 동의합니다. (필수)</p> <br> <textarea
							rows="5" cols="40" id="user_termsofuse_content">
							
							정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 가입인증 휴대폰번호를 필수항목으로 수집합니다. 그리고 단체 대표자명, 비밀번호 발급용 멤버 이름 및 이메일주소를 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
NAVER 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
서비스 이용 과정에서 IP 주소, 쿠키, 방문일시·불량 이용 기록 등의 서비스 이용 기록, 기기정보가 생성되어 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.
2. 수집한 개인정보의 이용
네이버는 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 파기
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우는 아래와 같습니다.
부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.
결제도용, 불법할인대출(일명 '카드깡') 등 관련 법령 및 이용약관을 위반하는 네이버페이의 부정거래기록(아이디, 이름, 휴대폰번호, 배송지 주소, IP주소, 쿠키, 기기정보)은 부정거래 방지 및 다른 선량한 이용자의 보호, 안전한 거래 환경 보장을 위하여 수집 시점으로부터 3년간 보관하고 파기합니다.
전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률 
계약 또는 청약철회 등에 관한 기록: 5년 보관 
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자금융거래법 
전자금융에 관한 기록: 5년 보관
- 통신비밀보호법 
로그인 기록: 3개월

							</textarea></td>
				</tr>
				<tr>
					<th id="column">광고 수신 동의</th>
					<td id="column2"><input type="checkbox"
						id="user_receiveadvertising" name="user_receiveadvertising"
						value="Y">

						<p id="right_font">PARKER 광고 수신에 동의합니다. (선택)</p></td>
				</tr>
			</table>
		</form>
		<input type="button" value="가입완료" id="singupBtn">

	</div>



</body>
</html>
<%@ include file="/footer.jsp"%>