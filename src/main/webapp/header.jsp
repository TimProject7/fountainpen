<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만년필의 명가 파카(PARKER)</title>
<LINK REL="SHORTCUT ICON" HREF="/images/favicon.ico" />
<!--jQuery 플러그인 추가-->
<style type="text/css"></style>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body>

	<div class="mapper">
		<header>
			<ul class="hd_nav1">
				<c:choose >
					<c:when test="${not empty sessionScope.UVO}">
					<li class="hd_nav1"><a href="#">SITEMAP</a></li>
					<li class="hd_nav1"><a href="/serviceCenter/userBoard/userBoard.do">SUPPORT</a></li>
					<!-- 마이페이지 클릭시 첫화면 장바구니 -->
					<li class="hd_nav1"><a href="/myPage/buyList/buyList.do">MYPAGE</a></li>
					<li class="hd_nav1"><a href="/">HOME</a></li>
					<li class="hd_nav1"><a href="/user/logout.do">LOGOUT</a></li>
					<li class="hd_nav1"><b>${sessionScope.UVO.user_id}님 안녕하세요!</b></li>
					</c:when>
					<c:when test="${empty session }">
					<li class="hd_nav1"><a href="#">SITE-MAP</a></li>
					<li class="hd_nav1"><a href="/serviceCenter/userBoard/userBoard.do">SUPPORT</a></li>
					<li class="hd_nav1">${sessionScope.UVO.user_id}</li>
					<li class="hd_nav1"><a href="/user/userinsertForm.do">JOIN</a></li>
					<li class="hd_nav1"><a href="/user/userlogin.do">LOGIN</a></li>
					<li class="hd_nav1"><a href="/">HOME</a></li>
					</c:when>
				</c:choose>
			</ul>

			<br>

			<p class="center">
				 <img class="logo" src="/images/logo.png">
			</p>

			<br>

			<center>
				<ul class="hd_nav2">
					<li class="hd_nav2"><a href="/story.do"><b>STORY</b></a></li>
					<li class="hd_nav2"><a href="/product/productList.do"><b>PRODUCT</b></a></li>
					<li class="hd_nav2"><a href="/serviceCenter/userBoard/userBoard.do"><b>SUPPORT</b></a></li>
					<li class="hd_nav2"><a href="/store.do"><b>STORE</b></a></li>
				</ul>
			</center>

			<br>

		</header>

		<br>
		

	</div>
</body>
</html>