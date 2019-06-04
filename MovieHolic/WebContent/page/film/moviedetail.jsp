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

/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
	position: static;
	top: 1em;
}

/* 구분선 얇은 것 (흰색) */
hr.line_light_w {
	background-color: white;
	position: static;
	top: 1em;
}

/* 구분선 얇은 것 (회색) */
hr.line_light_g {
	background-color: gray;
	position: static;
	top: 1em;
}

/* 위의 공간 띄울 때 */
.top_margin {
	margin-top: 20px;
}

.top_margin_lg {
	margin-top: 40px;
}

<%--
별모양 --%> .fas {
	font-style: normal;
	font-family: FontAwesome;
	font-size: 1.8em;
}

@media screen and (max-width: 990px) {
	.hide1 {
		display: none;
	}
	.fas {
		font-size: 1.8em;
	}
}

@media screen and (max-width: 765px) {
	.hide2 {
		display: none;
	}
}
</style>
<body class="left-sidebar is-preload">
	<script type="text/javascript">
		$(function() {
			$("#wishlistAdd").click(function() {
				alert("위시리스트에 추가되었습니다");
				return false;
			});
		});
	</script>
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
								style="border-left: 2px solid; margin-bottom: 20px; border-right: 2px solid;">
								<div
									style="float: left; margin-right: 20px; padding: 0 2em 0 2em;">
									<a href="#" class="image featured"
										style="margin: 0; width: 18em;"><img
										src="/MovieHolic/images/avengers4.jpg" alt="" /></a><br>
								</div>
								<div class="col-12-moblie"
									style="float: left; border-left: 2px solid; padding: 0 2em 0 2em; width: 65%">
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
											style="color: rgb(240, 195, 15); background-color: rgb(2, 39, 49); margin-right: 10px;"
											href="/MovieHolic/page/mypage/writereview.jsp" class="button">리뷰
												쓰기</a><a id="wishlistAdd" class="button"
											style="color: rgb(240, 195, 15); background-color: rgb(2, 39, 49);">위시리스트
												추가</a></li>
									</ul>

									<h3>
										<Strong>영화정보</Strong>
									</h3>
									<br>
									<div class="col-lg-12 col-12-mobile">
										<p>
											개요 : 액션,SF | 미국 | 181분 | 2019.04.20 개봉 <br>
										<p>
											감독 : 안소니 루소, 조 루소<br>
										<p>
											등급 : 12세 관람가<br>
										<p>제작 : 마블 스튜디오
									</div>
									<div id="likeunlike" class="rounded-lg"
										style="background-color: rgb(0, 0, 0); margin: 20px 0 20px 0; height: 100px; padding-top: 8px;">
										<div style="color: rgb(240, 195, 15); text-align: center;"
											class="font_light_small">영화를 평가해주세요.</div>
										<div
											class="starrating risingstar d-flex justify-content-center flex-row-reverse"
											style="font-size: 1.3em; align-items:">
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
										<a href="#" class="image fit"><img style="width: 70%"
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
										<a href="#" class="image fit"><img style="width: 70%"
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
										<a href="#" class="image fit"><img style="width: 70%"
											src="/MovieHolic/images/thor.jpg" alt="" title="크리스 헴스워스" /></a>
									</div>
									<div class="col-4">
										<h4>크리스 헴스워스</h4>
										<p>
											<font color="orange" size="3px">주연</font> : <font size="3px">돼르</font><br>
											<font size="3px">햄식이</font>
										</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img style="width: 70%"
											src="/MovieHolic/images/pic13.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Sed tempus fringilla</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img style="width: 70%"
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
										<a href="#" class="image fit"><img style="width: 70%"
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
										<a href="#" class="image fit"><img style="width: 70%"
											src="/MovieHolic/images/pic11.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Proin sed adipiscing</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img style="width: 70%"
											src="/MovieHolic/images/pic12.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Lorem feugiat magna</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img style="width: 70%"
											src="/MovieHolic/images/pic13.jpg" alt="" /></a>
									</div>
									<div class="col-4">
										<h4>Sed tempus fringilla</h4>
										<p>Amet nullam fringilla nibh nulla convallis tique ante
											proin.</p>
									</div>
									<div class="col-2">
										<a href="#" class="image fit"><img style="width: 70%"
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


				</div>
				<hr />
				<!-- 구분선 -->

				<!-- 댓글 start -->
				<div class="font_bold_small top_margin_lg"
					style="margin-bottom: 3em;">
					<span>REVIEWS</span>(<span id="commentcount">2</span>)
				</div>

				<!-- 구분선 -->

				<div class="row">
					<table class="table table-hover col-lg-12 col-mobile-12"
						style="margin-top: 0;">
						<tr>
							<td style="vertical-align: middle;"><a
								href="#"><img id="replywriter" class="profile_icon"
									alt="댓글작성자 프로필 사진" src="/MovieHolic/images/user2.jpg"></a> 
									<a id="replywriterId" class="font_bold_small" href="#"
								style="color: white; margin-right: 15px;">abc123</a><span style="font-size: 1em;margin-right: 15px;">
									<i class="fas fa-star" style="color: #ffca08;"></i> 
									<i class="fas fa-star" style="color: #ffca08;"></i> 
									<i class="fas fa-star" style="color: #ffca08;"></i> 
									<i class="fas fa-star" style="color: #ffca08;"></i> 
									<i class="fas fa-star" style="color: #222222;"></i>
							</span> 
							<span>2019-06-01</span>
							<br> 
							<span style="display: block; width:1200px;">
								 	Amet nullam
									fringilla nibh nulla convallis tique ante proin.Amet nullam
									fringilla nibh nulla convallis tique ante proin.Amet nullam
									fringilla nibh nulla convallis tique ante proin.
									Amet nullam
									fringilla nibh nulla convallis tique ante proin.Amet nullam
									fringilla nibh nulla convallis tique ante proin.Amet nullam
									fringilla nibh nulla convallis tique ante proin.
							</span>
							</td>
						</tr>
						<tr>
							<td style="vertical-align: middle;"><a
								href="#"><img id="replywriter" class="profile_icon"
									alt="댓글작성자 프로필 사진" src="/MovieHolic/images/user2.jpg"></a> 
									<a id="replywriterId" class="font_bold_small" href="#"
								style="color: white; margin-right: 15px;">abc123</a><span style="font-size: 1em;margin-right: 15px;">
									<i class="fas fa-star" style="color: #ffca08;"></i> 
									<i class="fas fa-star" style="color: #ffca08;"></i> 
									<i class="fas fa-star" style="color: #ffca08;"></i> 
									<i class="fas fa-star" style="color: #ffca08;"></i> 
									<i class="fas fa-star" style="color: #222222;"></i>
							</span> <span>2019-06-01</span><br> <span style="display: block; width:1200px;">Amet nullam
									fringilla nibh nulla convallis tique ante proin.Amet nullam
									fringilla nibh nulla convallis tique ante proin.Amet nullam
									fringilla nibh nulla convallis tique ante proin.
									Amet nullam
									fringilla nibh nulla convallis tique ante proin.
									Amet nullam
									fringilla nibh nulla convallis tique ante proin.</span></td>
						</tr>
						</table>

					<%--pagination처리 --%>
					<div class="col-lg-12">
						<div style="float: left">
							<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
						</div>

						<div style="float: right">
							<button class="btn btn-success font_bold_small">다&nbsp;&nbsp;&nbsp;음</button>
						</div>

						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link a"
								href="javascript:void(0);">1</a></li>
							<li class="page-item"><a class="page-link a"
								href="javascript:void(0);">2</a></li>
							<li class="page-item"><a class="page-link a"
								href="javascript:void(0);">3</a></li>
							<li class="page-item"><a class="page-link a"
								href="javascript:void(0);">4</a></li>
							<li class="page-item"><a class="page-link a"
								href="javascript:void(0);">5</a></li>
						</ul>
						<%-- float clear용 빈 div --%>
						<div style="clear: both;"></div>
					</div>
				</div>
				<div class="row" style="margin-top: 1em;">

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