<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만년필의 명가 파카(PARKER)</title>

<!--jQuery 플러그인 추가-->
<style type="text/css"></style>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body>

	<div class="mapper">
		<header>
			<ul class="hd_nav1">
				<li class="hd_nav1"><a href="#">SITE-MAP</a></li>
				<li class="hd_nav1"><a href="#">SUPPORT</a></li>
				<li class="hd_nav1"><a href="/serviceCenter/userBoard/userBoard.do">고객센터</a></li>
				<c:choose >
					<c:when test="${not empty sessionScope.UVO}">
					<li class="hd_nav1">${sessionScope.UVO.user_id}님</li>
					<li class="hd_nav1"><a href="/user/logout.do">로그아웃</a></li>
					<li class="hd_nav1"><a href="/myPage/myPagePasswordForm.do">마이페이지</a></li>
					</c:when>
					<c:when test="${empty session }">
							<li class="hd_nav1">${sessionScope.UVO.user_id}asdasd</li>
						<li class="hd_nav1"><a href="/user/userinsertForm.do">회원가입</a></li>
						<li class="hd_nav1"><a href="/user/userlogin.do">로그인</a></li>
					</c:when>
				</c:choose>
				<li class="hd_nav1"><a href="/">HOME</a></li>
			</ul>

			<br>

			<p class="center">
				<!-- <img class="logo" src="../images/logo.png"> -->
			</p>

			<br>

			<center>
				<ul class="hd_nav2">
					<li class="hd_nav2"><a href="#"><b>STORY</b></a></li>
					<li class="hd_nav2"><a href="#"><b>COLLECTION</b></a></li>
					<li class="hd_nav2"><a href="#"><b>SUPPORT</b></a></li>
					<li class="hd_nav2"><a href="#"><b>STORE</b></a></li>
				</ul>
			</center>

			<br>

		</header>

		<br>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		








	</div>
</body>
</html>