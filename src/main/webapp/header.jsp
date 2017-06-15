<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만년필의 명가 파카(PARKER)</title>

<!--jQuery 플러그인 추가-->
<script src="js/common.js"></script>
<style type="text/css"></style>
<link rel="stylesheet" type="text/css" href="../css/content.css" />
</head>
<body>
	<div class="mapper">
		<header>
			<ul class="hd_nav1">
				<li class="hd_nav1"><a href="#">SITE-MAP</a></li>
				<li class="hd_nav1"><a href="#">SUPPORT</a></li>
				<c:choose >
					<c:when test="${not empty sessionScope.UVO}">
					<li class="hd_nav1"><a href="logout.do">LOGOUT</a></li>
					</c:when>
					<c:when test="${empty sessionScope.UVO}">
						<li class="hd_nav1"><a href="user/userinsertForm.do">JOIN</a></li>
						<li class="hd_nav1"><a href="user/userlogin.do">LOGIN</a></li>
					</c:when>
				</c:choose>
				<li class="hd_nav1"><a href="/">HOME</a></li>
			</ul>

			<br>

			<p class="center">
				<img class="logo" src="images/logo.png">
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
		<div class="content">

			

			<br>

			<p class="center">
				<img id="footer_img" src="images/story.jpg"> <img
					id="footer_img" class="img_padding" src="images/pen.jpg"> <img
					id="footer_img" src="images/store.jpg">
			</p>


		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		








	</div>
</body>
</html>