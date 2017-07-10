<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiStory | STORY |</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/jquery.banner.js"></script>
<script src="js/story_tap.js"></script>
<script src="js/script.js"></script>
<style type="text/css"></style>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/story_style.css" />
</head>
<body>
	<div class="mapper">
<%-- 		<header>
			<ul class="hd_nav1">
				<li class="hd_nav1"><a href="#">SITE-MAP</a></li>
				<li class="hd_nav1"><a href="#">SUPPORT</a></li>
				<li class="hd_nav1"><a href="#">JOIN</a></li>
				<li class="hd_nav1"><a href="#">LOGIN</a></li>
				<li class="hd_nav1"><a href="#">HOME</a></li>
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

		</header> --%>

		<br>

		<div class="content">
			<h1 class="center">STORY</h1>
			<div id="container">

				<ul class="tab" >
					<li><a href="#tab1" class="selected">Brand Story</a></li>
					<li><a href="#tab2">History</a></li>
				</ul>

			</div>

			<br> <br>

			<p class="center">
				<img src="images/라인.PNG" width="70%">
			</p>

			<br> <br>

			<div id="container2">

				<ul class="panel">


					<li id="tab1">
					
						<table class="story_table">
							<tr>
								<td colspan="2">
									<h2>만년필 명가(名家)의 탄생</h2> <br>
									<p class="center">
										<img src="images/h3_line.jpg">
									</p> <br> 인류의 위대한 발명품 중에는 생활 속의 작은 불편함에서 시작되는 경우가 많다.<br>
									‘만년필의 명가(名家)’ 파카(Parker)의 시작도 미국의 한 도시에서 교사로 재직하던 평범한 남자의<br>
									생각의 전환에서 시작되었다. <br> <br> <br> 1888년, 교사로 재직하던
									조지 새포트 파카(George Safford Parker)는 부업으로 만년필을 판매했다.<br> 그런데
									당시의 만년필들은 잉크가 자주 새는 문제점이 있어 고객들은 늘 불만이었고,<br> 결국 그는 자신이 직접
									만년필을 만들기로 결심한다. 계속되는 연구와 실패를 거듭한 끝에 1894년,<br> 잉크 유출방지 기술인
									‘Lucky Curve’ 시스템을 발명하여 특허를 받게 된다. 이것이 오늘날 파카의 탄생인 것이다.
								</td>
								
								<td><img src="images/brand_img1.jpg" width="60%"></td>
							</tr>
						</table>
						
						<br><br><br>
						
						<table class="story_table">
							<tr>
							<td><img src="images/brand_img2.jpg" width="60%"></td>
								<td colspan="2">
									<h2>역사의 중심에 선 파카</h2> <br>
									<p class="center">
										<img src="images/h3_line.jpg">
									</p> <br>
										필기는 역사를 발전시키는 중요한 수단이 되었으며 파카는 그 중심에 서 있었다.<br>
										20세기 초 미국경제가 급성장하는 동안, 만년필은 단순한 필기구에서 나아가 개인의 스타일을 대변해<br>주는
										액세서리가 되었다. 파카 역시 금과 은은 물론 진주 등으로 세공한 만년필로 트렌드를 이끌었다.<br>
										그 당시 읽고 쓸 수 있었던 사람은 지식인층으로 한정되어 만년필의<br>
										소유 자체가 교양 있는 사람임을 보여주는 상징이었다.<br>
										<br><br>										
										그 후 제 1차 세계 대전으로 미국은 경제 위기를 맞이하게 되지만 반면 필기구 산업은 전성기를 맞게 된다.<br>
										가족들에게 편지를 쓰기 위해 펜이 필요했던 군인들에게 파카가 펜을 제공하였기 때문이다.<br>
										전쟁을 거치며 큰 성장을 이룩한 파카는 끊임없는 연구를 통해 듀오폴드,<br>
										파카 51 등 그 당시를 대표하는 아이콘적인 모델을 선보이며 그 명성을 이어가게 된다.<br>
								</td>
							</tr>
						</table>
						
						<br><br><br>
						
						<table class="story_table">
							<tr>
								<td colspan="2">
									<h2>파카를 사랑한 사람들</h2> <br>
									<p class="center">
										<img src="images/h3_line.jpg">
									</p> <br> 파카 펜은 100여 년 동안 경제계, 정계 그리고 예술계의 리더들로부터 사랑 받아왔다.<br>
											셜록 홈즈의 작가 아더 코난 도일경은 1920년대에 “내가 평생 찾던 펜은 바로 파카”라고 할 만큼 파카 펜을 애용했고,<br>
											마가렛 대처 전 영국수상은 1988년 파카의 영국 공장을 방문하고 “어린시절, 파카 펜을 갖는 것은 나의 꿈이었으며,<br>
											지금도 모든 서명에 G7 정상회담 때 받은 듀오폴드 펜을 사용한다.” 라고 밝힌 바 있다.<br>
											<br><br>
											또한 파카 펜은 역사적으로 중요한 순간에도 사용되었다.<br>
											맥아더 장군은 태평양 전쟁 당시 일본의 항복문서에 서명할 때 그의 20년 된 파카 듀오폴드 펜을 사용했다.<br>
											1990년 6월 부시 대통령과 고르바쵸프 대통령은 백악관에서 파카 펜으로 자유무역 협정을 체결하여<br>
											사실상 냉전을 종식 시켰고, 영국 왕실은 파카를 공식 지정 펜으로 사용하고 있다.<br><br>
								</td>
								
								<td><img src="images/brand_img3.jpg" width="60%"></td>
							</tr>
						</table>
						
						<br><br><br>
						
						<p class="center">
							<img src="images/라인.PNG" width="95%" >
						</p>
						
							
						
					</li>
					
					<li id="tab2" >
					
					<div style="width: 100%; padding: 0; margin: 0;">
					
						<div class="history_div" id="left_div">
								<br><br><br><br><br><br><br><br>
								<p>파카의 혁신적인 5세대 플랫폼이 최초로 적용된 인제뉴어티 출시&nbsp;&nbsp;<b>2011년</b></p><br>
								<p>부드러우면서도 빨리 마르는 Quinkflow 기술 개발&nbsp;&nbsp;<b>2010년</b></p><br>
								<p>우아하고 고품격의 재료를 바탕으로 한 21세기 디자인 기준 마련&nbsp;&nbsp;<b>2009년</b></p><br><br><br>
								<p>후디드닙 스타일이 적용된 파카100 출시&nbsp;&nbsp;<b>2004년</b></p><br>
								<p>옛 모델에서 착안,새로운 기술이 적용 파카 베스트셀러 소네트 출시 &nbsp;&nbsp;<b>1993년</b></p><br>
								<p><img style="width: 47%;" src="images/history_img2.jpg"></p>
								<br><br><br><br><br><br><br>
								<p>런던을 시작으로 본격적으로 유럽 대륙 진출&nbsp;&nbsp;<b>1924년</b></p><br>
								<p>빅레드로 잘 알려진 당대 가장 현대적인 만년필,듀오폴드 만년필 출시 &nbsp;&nbsp;<b>1921년</b></p><br>
								<br><br>
								<p>1차 세계대전까지 혼자 회사를 운영한 조지 새포트 파커, 형제 러셀합류&nbsp;&nbsp;<b>1919년</b></p><br>
								<br>
								<p>듀오폴드의 시초인 블랙 자이언트 출시 &nbsp;&nbsp;<b>1905년</b></p><br>
								<p>쉽게 끼우고 뺄 수 있는 펜 뚜껑 특허 획득 &nbsp;&nbsp;<b>1898년</b></p><br>
								<p><img style="width: 25%;" src="images/history_img4.jpg"></p>
						</div>
						
						<p class="center">
							<img class="center_line" src="images/center_line.png">
						</p>
						
						<div class="history_div" id="right_div"><br>
						<p><b>2013년</b>&nbsp;&nbsp;파카펜 창립 125주년</p><br>
						<p><img style="width: 28%;" src="images/history_img1.jpg"> </p>
							<br><br><br><br><br>
						<p><b>1992년</b>&nbsp;&nbsp;듀오폴드 인터내셔널 펄&블랙 출시</p><br>
						<p><b>1982년</b>&nbsp;&nbsp;파커 벡터 롤러볼 출시</p><br>
						<p><b>1960년</b>&nbsp;&nbsp;권총 이름을 딴 첫 번째 카트리지 펜 출시</p><br>
						<p><b>1956년</b>&nbsp;&nbsp;파커펜의 첫 번째 자동주입식 만년필, 파카 61출시</p><br>
						<p><b>1954년</b>&nbsp;&nbsp;파커의 대표적인 볼펜, 조터 출시</p><br>
						<p><b>1939년</b>&nbsp;&nbsp;파커 51 출시</p><br>
						<p><img style="width: 48%;" src="images/history_img3.jpg"> </p>
						<br><br><br><br><br><br>
						<p><b>1894년</b>&nbsp;&nbsp;잉크 유출 방지 기술인 ‘Lucky Curve’ 시스템 발명 및 특허 획득</p><br>
						<p><b>1893년</b>&nbsp;&nbsp;교사로 재직하던 조지 새포드 파카는 잉크 샘이 없는 펜을 개발하기 위해 학생들에게 펜을 팔기 시작</p><br><br>
						<p><b>1889년</b>&nbsp;&nbsp;조지 새포트 파카의 첫 번째 만년필 특허 획득</p><br>
						<p><b>1888년</b>&nbsp;&nbsp;조지 새퍼트 파카, 파커펜 회사 설립</p><br>
						<p><img style="width: 20%;" src="images/history_img5.jpg"> </p>
						</div>
					</div>
					</li>
				</ul>
			</div>
		</div>

		<!-- <footer>
			<div class="footer_content1">
				<br>
				<table class="footer_table">
					<tr class="basic_fontszie">
						<th>QuickMenu</th>
						<td><b>Story</b></td>
						<td colspan="2"><b>Collection</b></td>
						<td><b>Support</b></td>
						<td><b>Store</b></td>
					</tr>

					<tr>
						<td></td>
						<td>> Brand Story</td>
						<td>> DOUFOLD</td>
						<td>> PREMIER</td>
						<td>> Notice</td>
						<td>> Off-line Shop</td>
					</tr>

					<tr>
						<td></td>
						<td>> History</td>
						<td>> SONNET</td>
						<td>> INGENUITY</td>
						<td>> FAQ</td>
					</tr>

					<tr>
						<td></td>
						<td></td>
						<td>> URBAN</td>
						<td>> IM</td>
						<td>> A/S system</td>
					</tr>

					<tr>
						<td></td>
						<td></td>
						<td>> VECTOR</td>
						<td>> JOTTER</td>
						<td>> User board</td>
					</tr>

					<tr>
						<td></td>
						<td></td>
						<td>> INK&REFILL</td>
						<td></td>
						<td>> How to use</td>
					</tr>
				</table>
			</div>

			<br>

			<div class="footer_content2">
				<table style="width: 80%;">
					<tr>
						<th><img src="images/flogo.png"></th>
						<td>서울특별시 강남구 도산대로 507 대신빌딩 5층 (주)항소 TEL : 02-554-0911 FAX :
							02 554-4828 E-mail : admin@hangso.co.kr<br> Copyright(C)
							2015 parker.co.kr, All Rights Reserved.<br> 개인정보 취급방침
						</td>
					</tr>

				</table>
			</div>

		</footer> -->


	</div>
</body>
</html>
<%@ include file="/footer.jsp"%>