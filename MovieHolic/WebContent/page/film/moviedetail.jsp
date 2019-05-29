<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
</head>
<style>
<%--
별점의 별 icon을 사용하기 위해 필요 --%> .starrating>input {
	display: none;
}

<%--
Remove radio buttons --%> .starrating>label:before {
	content: "\f005"; <%-- Star --%> margin : 3px;
	font-size: 2em;
	font-family: FontAwesome;
	display: inline-block;
}

.starrating>label {
	color: #222222;
	<%--
	Start
	color
	when
	not
	clicked
	--%>
}

.starrating>input:checked ~ label {
	color: #ffca08;
}

<%--
Set yellow color when star checked  --%> .starrating>input:hover ~ label
	{
	color: #ffca08;
}
<%--
Set

 

yellow

 

color

 

when

 

star

 

hover

  

--%>
</style>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header" style="background-image: none; padding: 5em 0 0 0;">
			<%@ include file="/template/nav.jsp"%>
		</div>

		<!-- Main -->
		<div class="wrapper style1"
			style="padding: 3em 0 6em 0; color: white;">

			<div class="container">
				<div class="row gtr-200">
					<div class="col-12 col-12-mobile" id="content">
						<article id="main">
							<header>
								<h2>
									<a href="/MovieHolic/film/moviedetail.html">어벤져스 : 엔드게임</a>
								</h2>
								<p style="margin: 1em 0 0 0;">Avengers: Endgame, 2019</p>

							</header>
							<div class="col-12-moblie"
								style="border-left: 2px solid; margin-bottom: 20px; border-right: 2px solid; ">
								<div
									style="float: left; margin-right: 20px; padding: 0 2em 0 2em;" >
									<a href="#" class="image featured"
										style="margin: 0; width: 18em;"><img
										src="/MovieHolic/images/avengers4.jpg" alt="" /></a><br>
								</div>
								<div class="col-12-moblie"
									style="float: left; border-left: 2px solid; padding: 0 2em 0 2em; width:65%">
									<ul style="list-style-type: none;">
										<li
											style="margin-bottom: 10px; padding-left: 0px; font-size: 25px;"><strong>상영관
												: </strong><a style="color: rgb(240, 195, 15);"
											href="https://www.cgv.co.kr">CGV</a> , <a
											style="color: rgb(240, 195, 15);"
											href="https://www.lottecinema.co.kr">롯데시네마</a></li>
										<li style="padding-left: 0px;"><a
											href="https://www.youtube.com" class="button"
											style="color: rgb(240, 195, 15); margin-right: 10px; background-color: rgb(2, 39, 49);">예고편
												영상</a> <a
											style="color: rgb(240, 195, 15); background-color: rgb(2, 39, 49);"
											href="/MovieHolic/page/mypage/writereview.jsp" class="button">리뷰
												쓰기</a></li>
									</ul>

									<h3>
										<Strong>줄거리</Strong>
									</h3>
									<br>
									<div class="col-lg-12 col-12-mobile">
										인피니티 워 이후 절반만 살아남은 지구<br> 마지막 희망이 된 어벤져스<br> 먼저 떠난
										그들을 위해 모든 것을 걸었다!<br> 위대한 어벤져스<br> 운명을 바꿀 최후의 전쟁이
										펼쳐진다!
									</div>
									<div id="likeunlike" class="rounded-lg"
										style="background-color: rgb(0, 0, 0); margin: 20px 0 20px 0; height: 100px; padding-top: 8px;">
										<span style="color: rgb(240, 195, 15);"
											class="font_light_small">영화를 평가해주세요.</span>
										<div
											class="starrating risingstar d-flex justify-content-center flex-row-reverse"
											style="font-size: 1.3em; justify-content: left!important; flex-direction: unset!important;">
											<input type="radio" id="star5" name="rating" value="5" /><label
												for="star5" title="5 star"></label> <input type="radio"
												id="star4" name="rating" value="4" /><label for="star4"
												title="4 star"></label> <input type="radio" id="star3"
												name="rating" value="3" /><label for="star3" title="3 star"></label>
											<input type="radio" id="star2" name="rating" value="2" /><label
												for="star2" title="2 star"></label> <input type="radio"
												id="star1" name="rating" value="1" /><label for="star1"
												title="1 star"></label>
										</div>
									</div>


								</div>
								<div style="clear: both;"></div>
							</div>
							<div>
								<!-- 배우/출연진/감독 -->
								<header>
									<h3>
										<a href="#">배우</a>
									</h3>
								</header>
								<div class="row gtr-50">
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/ironman.jpg" alt="" title="로버트다우니주니어" /></a>
									</div>
									<div class="col-4">
										<h4>로버트 다우니 주니어</h4>
										<p>
											<font color="orange" size="3px">주연</font> : <font size="3px">토니스타크/아이언맨</font><br>
											<font size="3px">I am Ironman</font>
										</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/capamerica.jpg" alt=""
											title="크리스 에반스" /></a>
									</div>
									<div class="col-4">
										<h4>크리스 에반스</h4>
										<p>
											<font color="orange" size="3px">주연</font> : <font size="3px">스티븐
												로져스/캡틴 아메리카</font><br> <font size="3px"> 치즈버거</font>
										</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/thor.jpg" alt="" title="크리스 헴스워스" /></a>
									</div>
									<div class="col-4">
										<h4>크리스 헴스워스</h4>
										<p>
											<font color="orange" size="3px">주연</font> : <font size="3px">돼르</font><br>
											<font size="3px">먹고싶다</font>
										</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/pic13.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Sed tempus fringilla</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/pic14.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Malesuada fermentum</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
								</div>
							</div>
							<div>
								<header>
									<h3>
										<a href="#">감독 & 출연진</a>
									</h3>
								</header>
								<div class="row gtr-50">
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/sony.jpg" alt="" title="안소니 루소" /></a>
									</div>
									<div class="col-4">
										<h4>안소니 루소</h4>
										<p>
											<font color="orange" size="3px">감독</font> : <font size="3px">안소니
												루소</font><br> <font size="3px"></font>
										</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/pic11.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Proin sed adipiscing</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/pic12.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Lorem feugiat magna</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/pic13.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Sed tempus fringilla</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img
											src="/MovieHolic/images/pic14.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Malesuada fermentum</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
								</div>
							</div>
						</article>

					</div>

					<%-- <div class="col-4 col-12-mobile" id="sidebar">
						<hr class="first" />
						<section>
							<header>
								<h3>
									<a href="#">제작 노트</a>
								</h3>
							</header>
							<p>전 세계 최고의 기대작 어벤져스 시리즈의 압도적 대미를 장식할 어벤져스: 엔드게임 이 지난 4월
								14일(일)과 15일(월) 양일간 진행된 대한민국 내한 행사를 성공적으로 마무리 지었다. 어벤져스: 엔드게임의 주역
								로버트 다우니 주니어, 제레미 레너, 브리 라슨, 안소니 루소&조 루소 감독, 트린 트랜 프로듀서, 케빈 파이기
								마블 스튜디오 대표까지 방문하여 특별한 대한민국 사랑을 뽐냈다. 특히 이번 행사는 월드투어의 일환으로, 대한민국이
								아시아 정킷 허브로 선정돼 일본, 인도, 뉴질랜드, 호주, 홍콩, 싱가폴, 말레이시아, 인도네시아, 필리핀,
								베트남, 타이완 총 11개 아시아 국가의 기자들이 대한민국을 방문하여 함께 뜨거운 어벤져스: 엔드게임 정킷 행사를
								함께 즐겼다. 먼저 4월 15일(월) 진행된 아시아 프레스 컨퍼런스를 비롯하여 장충체육관에서 약 4,000여명의
								팬들과 함께 진행된 아시아 팬이벤트까지 뜨거운 내한 행사가 성공리에 끝이 났다. 프레스 컨퍼런스에서 프로듀서 트린
								트랜은 “여성 히로인들이 이전의 영화에서도 그렇고 이번 어벤져스: 엔드게임에서 강하게 자리 잡으며 중요한 역할을 할
								것이다. 저희는 항상 그 점을 고려하고 있고 앞으로도 여성 히로인을 계속해서 서포트 할 것”이라며 어벤져스:
								엔드게임의 새로운 관전 포인트를 꼽기도 했다. 아이언맨 로버트 다우니 주니어는 아시아 팬이벤트 말미 깜짝 재등장해
								한국 팬들과 관객들에게 “10년 전에는 저도 어렸고, 여러분들도 어렸다. 이렇게 잘 자라주어서 고맙고 자랑스럽다.
								이 말을 하지 않고 갈 수는 없었다”라며 감동 메시지를 전하기도 했다. 흥행 캡틴에 등극한 브리 라슨은 아시아
								프레스 컨퍼런스에서 “한국 음식을 계속 먹고 있어서 계속 배가 부른 상태다”라며 재치 있는 답변으로 한국 사랑을
								보여주기도 했다. 아시아 팬이벤트에서는 관객들이 선물로 준비한 응원봉 이벤트에 진심으로 감동한 모습을 보이며 눈물
								짓기도 해 더욱 한국 팬들과 관객들에게 뭉클한 감동을 전하였다. 어벤져스 원년멤버 호크아이의 제레미 레너도
								한국에서의 좋은 기억을 아시아 프레스 컨퍼런스에서 언급했다. “한국의 벚꽃도 아름다웠고, 한국 음식도 먹었다. 특히
								소주가 맛있었다”라며 유쾌한 답변을 전하기도 하였다.</p>
							
						</section>
						<hr />
						<section>
							<header>
								<h3>
									<a href="#">Sed lorem etiam consequat</a>
								</h3>
							</header>
							<p>Tempus cubilia ultrices tempor sagittis. Nisl fermentum
								consequat integer interdum.</p>
							<div class="row gtr-50">
								<div class="col-4">
									<a href="#" class="image fit"><img src="/MovieHolic/images/pic10.jpg"
										alt="" /></a>
								</div>
								<div class="col-8">
									<h4>Nibh sed cubilia</h4>
									<p>Amet nullam fringilla nibh nulla convallis tique ante
										proin.</p>
								</div>
								<div class="col-4">
									<a href="#" class="image fit"><img src="/MovieHolic/images/pic11.jpg"
										alt="" /></a>
								</div>
								<div class="col-8">
									<h4>Proin sed adipiscing</h4>
									<p>Amet nullam fringilla nibh nulla convallis tique ante
										proin.</p>
								</div>
								<div class="col-4">
									<a href="#" class="image fit"><img src="/MovieHolic/images/pic12.jpg"
										alt="" /></a>
								</div>
								<div class="col-8">
									<h4>Lorem feugiat magna</h4>
									<p>Amet nullam fringilla nibh nulla convallis tique ante
										proin.</p>
								</div>
								<div class="col-4">
									<a href="#" class="image fit"><img src="/MovieHolic/images/pic13.jpg"
										alt="" /></a>
								</div>
								<div class="col-8">
									<h4>Sed tempus fringilla</h4>
									<p>Amet nullam fringilla nibh nulla convallis tique ante
										proin.</p>
								</div>
								<div class="col-4">
									<a href="#" class="image fit"><img src="/MovieHolic/images/pic14.jpg"
										alt="" /></a>
								</div>
								<div class="col-8">
									<h4>Malesuada fermentum</h4>
									<p>Amet nullam fringilla nibh nulla convallis tique ante
										proin.</p>
								</div>
							</div>
							<footer>
								<a href="#" class="button">Magna Adipiscing</a>
							</footer>
						</section>	
					</div> --%>
				</div>
				<hr />
				<div class="row">
					<%-- <article class="col-4 col-12-mobile special">
						<a href="#" class="image featured"><img src="/MovieHolic/images/watching.jpg"
							alt="" /></a>
						
						<p>Amet nullam fringilla nibh nulla convallis tique ante proin
							sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
							cubilia ultrices tempor sagittis. Nisl fermentum consequat
							integer interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special">
						<a href="#" class="image featured"><img src="/MovieHolic/images/money.jpg"
							alt="" /></a>
						
						<p>Amet nullam fringilla nibh nulla convallis tique ante proin
							sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
							cubilia ultrices tempor sagittis. Nisl fermentum consequat
							integer interdum.</p>
					</article>
					<article class="col-4 col-12-mobile special">
						<a href="#" class="image featured"><img src="/MovieHolic/images/capma.jpg"
							alt="" /></a>
						
						</header>
						<p>Amet nullam fringilla nibh nulla convallis tique ante proin
							sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus
							cubilia ultrices tempor sagittis. Nisl fermentum consequat
							integer interdum.</p>
					</article>--%>
					<section class="carousel">
						<div class="reel" id="romance">
							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/brother.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#"><strong>나의 특별한 형제</strong></a>
									</h6>
								</header>
								<p>머리 좀 쓰는 형 x 몸 좀 쓰는 동생! 세상엔 이런 형제도 있다!</p>
							</article>
							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/avengers4.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#">어벤져스 : 엔드게임</a>
									</h6>
								</header>
								<p>인피니티 워 이후 절반만 살아남은 지구 마지막 희망이...</p>
							</article>

							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/capma.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#">캡틴 마블</a>
									</h6>
								</header>
								<p>위기에 빠진 어벤져스의 희망! 1995년, 공군 파일럿 시절의 기억을 잃고</p>
							</article>

							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/watching.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#">왓칭</a>
									</h6>
								</header>
								<p>회사 주차장에서 납치 당한 여자(강예원)가 자신을 조여오는 감...</p>
							</article>

							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/money.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#">돈</a>
									</h6>
								</header>
								<p>오직 부자가 되고 싶은 꿈을 품고 여의도 증권가에 입성한 신입 주식...</p>
							</article>

							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/pic01.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#">뽀로로 극장판 보물섬 대모험</a>
									</h6>
								</header>
								<p>떠나자, 보물섬으로~!뽀로로와 친구들의 스펙터클 보물찾기 어드벤처!</p>
							</article>

							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/pic02.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#">명탐정 피카츄</a>
									</h6>
								</header>
								<p>“탐정이 아냐, 명탐정이지!”세상을 구할 번쩍이는 추리가 시작된다!</p>
							</article>

							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/pic03.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#">어글리 돌</a>
									</h6>
								</header>
								<p>못생겨서 더 사랑스러운 ‘어글리 돌’의 씽~나는 무한도전이 시작된다!</p>
							</article>

							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/pic04.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#">헬보이</a>
									</h6>
								</header>
								<p>헬보이' 자신이 소속된 B.P.R.D의 임무로 영국의 한 비밀 단체의 괴수 사냥을 도우러 갔지만 되려
									공격을 당하고,</p>
							</article>

							<article style="background-color: rgb(3, 39, 49);">
								<a href="#" class="image featured"><img
									src="/MovieHolic/images/pic05.jpg" alt="" /></a>
								<header>
									<h6>
										<a href="#">안도 타다오</a>
									</h6>
								</header>
								<p>“빛의 교회, 지중미술관, 푼타 델라 도가나 미술관 등 세계를 사로잡은 건축가!”</p>
							</article>

						</div>


					</section>
				</div>
			</div>

		</div>

		<%@ include file="/template/footer.jsp"%>