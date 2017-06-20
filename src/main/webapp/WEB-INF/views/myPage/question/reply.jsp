<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="replyContainer">
		<div id="comment_insert">
			<form id="comment_form">
				<div>
					<label for="user_name">작성자</label>
					<input type="text" name="user_name" id="user_name">
					<input type="button" id="questionreplyInsert" value="저장하기">
				</div>
				<div>
					<label for="questionreply_content">댓글내용</label>
					<textarea name="questionreply_content" id="questionreply_content"></textarea>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
