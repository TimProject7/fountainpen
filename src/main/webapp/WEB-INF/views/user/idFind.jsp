<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			/* var userid=$('#user_id').val()
			var useremail=$('#user_email').val()
			
			var alldata ={"userid":userid,"useremail":useremail}
			
			alert(alldata) */
			if (!chkSubmit($("#user_name"),"이름을")) {
				return;
			}
			if (!chkSubmit($("#user_email"),"이메일을")) {
				return;
			} else {
				$.ajax({
					url : "/user/idFindchk.do", //전송url
					type : "POST", //전송방식
					data : $('form').serialize(),
					error : function(userid) {
						alert('시스템오류')
					},
					success : function(userid) {
						
						alert(userid);
						
					}
				});
			}
		});
	});
</script>
</head>
<body>

	<h2>아이디찾기</h2>
	<form>
		<table>
			<tr>
				<td><label>이름 <input type="text" id="user_name"
						name="user_name" /></label></td>
			</tr>
			<tr>
				<td><label>이메일 <input type="email" id="user_email"
						name="user_email" /></label></td>
			</tr>
			<tr>
				<td>가입시 작성하신 이름과 이메일을 입력하시면 아이디를 찾으실수있습니다.</td>
			</tr>
			<tr>
				<td><input type="submit" id="idfindchk" value="아이디찾기"></td>
			</tr>
		</table>
	</form>

</body>
</html>