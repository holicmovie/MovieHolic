<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kitri.dto.FilmDto, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>



<style>
/* 큰 제목 */
.big_title{
font-family: 'Noto Sans KR', sans-serif;
font-weight: bold;
font-size: 40px;
}

/* 중간 제목 */
.mid_title{
font-family: 'Noto Sans KR', sans-serif;
font-weight: bold;
font-size: 32px;
margin-top: 50px;
margin-left: 30px;
margin-bottom : 0px;
}

/* 영화명 */
.film_title{
font-family: 'Noto Sans KR', sans-serif;
font-weight: bold;
font-size: 15px;
}

/* 상단 마진 값 */
.top_margin{
margin-top: 100px;
}
</style>



</head>
<body class="homepage is-preload" style="background-color: black;">
<script type="text/javascript">
	$(function() {
		var arr = $("div>div>nav.nav2>li>a");
		$(arr).click(function() {
		var vurl = $(this).attr("href");
		$a.jax({
			url : vurl,
			method:'get',
			success:function(result){
				$("section#category").html(result);
			}
		});
			
		});
	});
</script>



<%
// 박스오피스 조회 날짜(어제)
Calendar c1 = new GregorianCalendar();
c1.add(Calendar.DATE, -1);							    // 어제날짜
SimpleDateFormat f = new SimpleDateFormat("yyyy년 MM월 dd일"); 	// 날짜 포맷 
String yesterday = f.format(c1.getTime()); 				// String으로 저장

// 박스오피스 결과
List<FilmDto> box = (List<FilmDto>)request.getAttribute("box");
int rank=1;

// 선호장르 추천 영화 목록 결과
List<FilmDto> favoritefilm = (List<FilmDto>)request.getAttribute("favoritefilm");

// 로그인 세션 ##### 임시
String id = "abc123";
String name = "김무비";
String genre = "액션"; // ##DB 게시판 table에서 select해야 함##
%>




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

			<%@ include file="/template/nav.jsp"%>
		</div>

		<!---------------------------------------- ① 최신 박스오피스 순위 ---------------------------------------->
		<section id="banner" style="padding: 2em 0 2em 0;">
			<header class="top_margin">
				<h2 class="big_title">
					<strong>최신 박스오피스 순위</strong>
				</h2>
				<br>
				<h4 class="font_light_small">
					(기준 날짜 : <%=yesterday%>)
				</h4>
			</header>
		</section>

		<!-- 박스오피스 배너 start -->
		<section class="carousel">
			<div class="reel">

<%
for(FilmDto dto : box){
%>	

				<article style="background-color: rgb(3, 39, 49);">
					<span class="font_light_small"><%=rank++%>위</span><br>
					<a href="/MovieHolic/page/film/moviedetail.jsp" class="image featured">
						<img style="height:320px;" src="<%=dto.getMovieImage()%>" alt="<%=dto.getMovieNm()%> 포스터" />
					</a>
					<header>
						<h5>
							<a href="/MovieHolic/page/film/moviedetail.jsp" class="film_title">
								<%=dto.getMovieNm()%>
							</a>
						</h5>
					</header>
				</article>
<%
}
%> 
			</div>
		</section>
		<!-- 박스오피스 배너 end -->
		
		
		<!---------------------------------------- ② 취향 저격 리스트 ---------------------------------------->
		<!-- #로그인 회원 선호 장르 = 액션 이라고 가정!# -->
		<section id="banner" style="padding: 2em 0 5px 0;">
			<header class="top_margin">
				<h2 class="big_title">
					<strong>취향 저격 리스트</strong>
				</h2>
				<br><br>
				<div class="mid_title" align="left">
					<span style="color:rgb(240, 195, 15)"><%=name%></span>님이 좋아하는 <%=genre%> 영화
				</div>
			</header>
			
		</section>

		<!-- ②-1. 회원 선호장르 영화 추천 start -->
		<div class="tab-content">
			<div class="tab-pane active">
				<section class="carousel" id="category">
					<div class="reel" id="romance">

<%
for(FilmDto dto : favoritefilm){
%>					
						<article style="margin: ; height: 410px; background-color: rgb(3, 39, 49);">
							<a href="#" class="image featured">
								<img style="height:320px;" src="<%=dto.getMovieImage()%>" alt="<%=dto.getMovieNm()%> 포스터" />
							</a>
							<header>
								<h5>
									<a href="/MovieHolic/page/film/moviedetail.jsp" class="film_title">
										<%=dto.getMovieNm()%>
									</a>
								</h5>
							</header>
						</article>
<%
}
%>
	
					</div>
				</section>
			</div>
		</div>
		<!-- 회원 선호장르 영화 추천 end -->


		<!-- ②-2. 또 뭐하지 start -->
		<!-- Banner -->
		<section id="banner" style="padding: 2em 0 2em 0;">
			<header class="top_margin">
				<h2 class="big_title">
					<strong>랜덤 유저 위시리스트</strong>
				</h2>
			</header>
		</section>

		<!-- user movie list -->
		<section class="carousel">
			<div class="reel">

				<article style="background-color: rgb(3, 39, 49);">
					<a href="#" class="image featured">
						<img style="height:320px;" src="images/brother.jpg" alt="" />
					</a>
					<header>
						<h5>
							<a href="#">나의 특별한 형제</a>
						</h5>
					</header>
					<p>머리 좀 쓰는 형 x 몸 좀 쓰는 동생! 세상엔 이런 형제도 있다!</p>
				</article>

			</div>
		</section>
		<!-- 또 뭐하지 end -->
		
		<%@ include file="/template/footer.jsp"%>