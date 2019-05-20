<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<link rel="stylesheet" href="/MovieHolic/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Inner -->
			<div class="inner">
				<header>
					<h1>
						<a href="/MovieHolic/index.html" id="logo">Movie Holic</a>
					</h1>
					<hr />
					<p>Welcome Movie Holic</p>
				</header>
				<footer>
					<a href="#banner" class="button circled scrolly">Start</a>
				</footer>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="/MovieHolic/index.jsp">HOME</a></li>
					<li><a href="/MovieHolic/page/film/moviefilm.jsp">Films</a></li>
					<li><a href="/MovieHolic/page/film/movielist.jsp">Lists</a></li>
					<li>
						<a href="/MovieHolic/page/mypage/mypage.jsp">My page</a>
						<ul>
							<li><a href="/MovieHolic/page/mypage/Preference.jsp">My Movie Chart</a></li>
							<li><a href="/MovieHolic/page/mypage/wishlist.jsp">Wish List</a></li>
							<li><a href="/MovieHolic/page/mypage/diary.jsp">Diary</a></li>
							<li><a href="/MovieHolic/page/mypage/social.jsp">Social</a></li>
							<li><a href="/MovieHolic/page/mypage/setting.jsp">Setting</a></li>
						</ul>
					</li>
					<li>
						<a href="/MovieHolic/page/admin/management.jsp">Management</a>
						<ul>
							<li><a href="/MovieHolic/page/admin/management.jsp">Management</a></li>
							<li><a href="/MovieHolic/page/admin/edit-movie.jsp">Modify</a></li>
							<li><a href="/MovieHolic/page/admin/statistics.jsp">Statistics</a></li>
						</ul>
					</li>
					<li><a href="#">Login</a></li>
					<li><a href="#">Register</a></li>
				</ul>
			</nav>
		</div>

		<!-- Banner -->
		<section id="banner">
			<header>
				<h2>
					<strong>최신 박스오피스 순위</strong>
				</h2>
			</header>
		</section>

		<!-- boxoffice -->
		<section class="carousel">
			<div class="reel">

				<article>
					<a href="/MovieHolic/page/film/moviedetail.jsp" class="image featured"><img
						src="images/avengers.png" alt="" /></a>
					<header>
						<h3>
							<a href="/MovieHolic/page/film/moviedetail.jsp">어벤져스 : 엔드게임</a>
						</h3>
					</header>
					<p>인피니티 워 이후 절반만 살아남은 지구 마지막 희망이...</p>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="images/나의특별한형제.jpg" alt="" /></a>
					<header>
						<h3>
							<a href="#">나의 특별한 형제</a>
						</h3>
					</header>
					<p>머리 좀 쓰는 형 x 몸 좀 쓰는 동생! 세상엔 이런 형제도 있다!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/캡틴마블.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">캡틴 마블</a>
						</h3>
					</header>
					<p>위기에 빠진 어벤져스의 희망! 1995년, 공군 파일럿 시절의 기억을 잃고</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic04.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">왓칭</a>
						</h3>
					</header>
					<p>회사 주차장에서 납치 당한 여자(강예원)가 자신을 조여오는 감...</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic05.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">돈</a>
						</h3>
					</header>
					<p>오직 부자가 되고 싶은 꿈을 품고 여의도 증권가에 입성한 신입 주식...</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic01.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">뽀로로 극장판 보물섬 대모험</a>
						</h3>
					</header>
					<p>떠나자, 보물섬으로~!뽀로로와 친구들의 스펙터클 보물찾기 어드벤처!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic02.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">명탐정 피카츄</a>
						</h3>
					</header>
					<p>“탐정이 아냐, 명탐정이지!”세상을 구할 번쩍이는 추리가 시작된다!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic03.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">어글리 돌</a>
						</h3>
					</header>
					<p>못생겨서 더 사랑스러운 ‘어글리 돌’의 씽~나는 무한도전이 시작된다!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic04.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">헬보이</a>
						</h3>
					</header>
					<p>헬보이' 자신이 소속된 B.P.R.D의 임무로 영국의 한 비밀 단체의 괴수 사냥을 도우러 갔지만 되려 공격을
						당하고,</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic05.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">안도 타다오</a>
						</h3>
					</header>
					<p>“빛의 교회, 지중미술관, 푼타 델라 도가나 미술관 등 세계를 사로잡은 건축가!”</p>
				</article>

			</div>
		</section>

		<!-- Banner -->
		<section id="banner">
			<header>
				<h2>
					<strong>취향 저격 리스트</strong>
				</h2>
				<nav id="nav2">
					<ul>
						<li><a data-toggle="tab" href="#romance">로맨스</a></li>
						<li><a data-toggle="tab" href="#">느와르</a></li>
						<li><a data-toggle="tab" href="#">미스터리</a></li>
						<li><a data-toggle="tab" href="#">공포</a></li>
						<li><a data-toggle="tab" href="#">스릴러</a></li>
						<li><a data-toggle="tab" href="#action">액션</a></li>
						<li><a data-toggle="tab" href="#">코미디</a></li>
					</ul>
				</nav>
			</header>
		</section>

		<!-- user movie list -->
		<section class="carousel">
			<div class="reel" id="romance">
				<article>
					<a href="#" class="image featured"><img
						src="images/나의특별한형제.jpg" alt="" /></a>
					<header>
						<h3>
							<a href="#">나의 특별한 형제</a>
						</h3>
					</header>
					<p>머리 좀 쓰는 형 x 몸 좀 쓰는 동생! 세상엔 이런 형제도 있다!</p>
				</article>
				<article>
					<a href="#" class="image featured"><img
						src="images/avengers.png" alt="" /></a>
					<header>
						<h3>
							<a href="#">어벤져스 : 엔드게임</a>
						</h3>
					</header>
					<p>인피니티 워 이후 절반만 살아남은 지구 마지막 희망이...</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/캡틴마블.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">캡틴 마블</a>
						</h3>
					</header>
					<p>위기에 빠진 어벤져스의 희망! 1995년, 공군 파일럿 시절의 기억을 잃고</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic04.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">왓칭</a>
						</h3>
					</header>
					<p>회사 주차장에서 납치 당한 여자(강예원)가 자신을 조여오는 감...</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic05.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">돈</a>
						</h3>
					</header>
					<p>오직 부자가 되고 싶은 꿈을 품고 여의도 증권가에 입성한 신입 주식...</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic01.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">뽀로로 극장판 보물섬 대모험</a>
						</h3>
					</header>
					<p>떠나자, 보물섬으로~!뽀로로와 친구들의 스펙터클 보물찾기 어드벤처!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic02.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">명탐정 피카츄</a>
						</h3>
					</header>
					<p>“탐정이 아냐, 명탐정이지!”세상을 구할 번쩍이는 추리가 시작된다!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic03.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">어글리 돌</a>
						</h3>
					</header>
					<p>못생겨서 더 사랑스러운 ‘어글리 돌’의 씽~나는 무한도전이 시작된다!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic04.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">헬보이</a>
						</h3>
					</header>
					<p>헬보이' 자신이 소속된 B.P.R.D의 임무로 영국의 한 비밀 단체의 괴수 사냥을 도우러 갔지만 되려 공격을
						당하고,</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic05.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">안도 타다오</a>
						</h3>
					</header>
					<p>“빛의 교회, 지중미술관, 푼타 델라 도가나 미술관 등 세계를 사로잡은 건축가!”</p>
				</article>

			</div>
			
			
		</section>
		

		<!-- Randomuser movie list -->

		<!-- Banner -->
		<section id="banner">
			<header>
				<h2>
					<strong>랜덤 유저 위시리스트</strong>
				</h2>
			</header>
		</section>

		<!-- user movie list -->
		<section class="carousel">
			<div class="reel">

				<article>
					<a href="#" class="image featured"><img
						src="images/나의특별한형제.jpg" alt="" /></a>
					<header>
						<h3>
							<a href="#">나의 특별한 형제</a>
						</h3>
					</header>
					<p>머리 좀 쓰는 형 x 몸 좀 쓰는 동생! 세상엔 이런 형제도 있다!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="images/avengers.png" alt="" /></a>
					<header>
						<h3>
							<a href="#">어벤져스 : 엔드게임</a>
						</h3>
					</header>
					<p>인피니티 워 이후 절반만 살아남은 지구 마지막 희망이...</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/캡틴마블.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">캡틴 마블</a>
						</h3>
					</header>
					<p>위기에 빠진 어벤져스의 희망! 1995년, 공군 파일럿 시절의 기억을 잃고</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic04.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">왓칭</a>
						</h3>
					</header>
					<p>회사 주차장에서 납치 당한 여자(강예원)가 자신을 조여오는 감...</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic05.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">돈</a>
						</h3>
					</header>
					<p>오직 부자가 되고 싶은 꿈을 품고 여의도 증권가에 입성한 신입 주식...</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic01.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">뽀로로 극장판 보물섬 대모험</a>
						</h3>
					</header>
					<p>떠나자, 보물섬으로~!뽀로로와 친구들의 스펙터클 보물찾기 어드벤처!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic02.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">명탐정 피카츄</a>
						</h3>
					</header>
					<p>“탐정이 아냐, 명탐정이지!”세상을 구할 번쩍이는 추리가 시작된다!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic03.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">어글리 돌</a>
						</h3>
					</header>
					<p>못생겨서 더 사랑스러운 ‘어글리 돌’의 씽~나는 무한도전이 시작된다!</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic04.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">헬보이</a>
						</h3>
					</header>
					<p>헬보이' 자신이 소속된 B.P.R.D의 임무로 영국의 한 비밀 단체의 괴수 사냥을 도우러 갔지만 되려 공격을
						당하고,</p>
				</article>

				<article>
					<a href="#" class="image featured"><img src="images/pic05.jpg"
						alt="" /></a>
					<header>
						<h3>
							<a href="#">안도 타다오</a>
						</h3>
					</header>
					<p>“빛의 교회, 지중미술관, 푼타 델라 도가나 미술관 등 세계를 사로잡은 건축가!”</p>
				</article>

			</div>
		</section>
<%@ include file="/template/footer.jsp" %>