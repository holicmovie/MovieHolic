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
/* 인기 영화 랭킹 스타일 */
div.interated_network_movie_info_img{
width:100%;
float: none;
display: table-cell;
vertical-align: top;
position: relative;
}
span.movie_ranking_number {
position: absolute;
vertical-align: top;
    top: 0;
    left: 0;
    width: 38px;
    padding: 6px 0 6px 0;
    font-size: 20px;
    background-color : #ff4e00;
    font-weight: 700;
    color: #fff;
    text-align: center;
    z-index: 1000;
}
</style>
</head>



<script type="text/javascript">
$(function() {
		
	
		if(${Recursion != 1}){
			location.href='/MovieHolic/film';
		}
	
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
if((Integer)request.getAttribute("Recursion") != null){
	int Recursion = (Integer)request.getAttribute("Recursion");
	if(Recursion == 1 ){ %>

<body class="homepage is-preload" style="background-color: black;">



<%
// 박스오피스 조회 날짜(어제)
Calendar c1 = new GregorianCalendar();
c1.add(Calendar.DATE, -1);							    // 어제날짜
SimpleDateFormat f = new SimpleDateFormat("yyyy년 MM월 dd일"); 	// 날짜 포맷 
String yesterday = f.format(c1.getTime()); 				// String으로 저장
// 박스오피스 결과
List<FilmDto> box = (List<FilmDto>)request.getAttribute("box");
int rank=1;
// ###################################### 로그인 세션 ###################################### 임시
//TODO : session에서 id 받기로 변경하기! ok
String id = (String)session.getAttribute("loginInfo");
String name = (String) session.getAttribute("name");
// # 로그인
// 선호장르 추천 영화 목록 결과
// 선호장르 1
List<FilmDto> favoritefilm = (List<FilmDto>)request.getAttribute("favoritefilm");
// 선호장르 2
List<FilmDto> favoritefilm2 = (List<FilmDto>)request.getAttribute("favoritefilm2");
// # 비로그인
// 최신 영화 목록 결과
List<FilmDto> variousfilm = (List<FilmDto>)request.getAttribute("variousfilm");
// 리뷰 높은 영화 목록 결과
List<FilmDto> variousfilm2 = (List<FilmDto>)request.getAttribute("variousfilm2");
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
if(box != null){
	for(FilmDto dto : box){
%>	

				<article style="background-color: rgb(3, 39, 49);">
			<div class="interated_network_movie_info_img">
				<span class="movie_ranking_number" id="rankNum"><%=rank++%></span>
					<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="image featured">
						<img style="height:320px;" src="<%=dto.getMovieImage()%>" alt="<%=dto.getMovieNm()%> 포스터" />
					</a>
			</div>
					<header>
						<h5>
							<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="film_title">
								<%=dto.getMovieNm()%>
							</a>
						</h5>
					</header>
				</article>
<%
	}
}
%> 
			</div>
		</section>
		<!-- 박스오피스 배너 end -->
		
<%
// ################## 비로그인 ##################
if(id == null || (id!=null && favoritefilm.get(0).getCategory() == "")) {
%>

		<!---------------------------------------- ② 취향 저격 리스트 ---------------------------------------->
		<!-- #로그인 회원 선호 장르 = 액션 이라고 가정!# -->
		<section id="banner" style="padding: 2em 0 5px 0;">
			<header class="top_margin">
				<h2 class="big_title">
					<strong>취향 저격 리스트</strong>
				</h2>
				<br><br>
				<div class="mid_title" align="left">
					최신 개봉 영화
				</div>
			</header>
			
		</section>

		<!-- ②-1. 회원 선호장르1 영화 추천 start -->
		<div class="tab-content">
			<div class="tab-pane active">
				<section class="carousel" id="category">
					<div class="reel" id="romance">

<%
if(variousfilm != null){
	for(FilmDto dto : variousfilm){
%>					
						<article style="margin: ; height: 410px; background-color: rgb(3, 39, 49);">
							<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="image featured">
								<img style="height:320px;" src="<%=dto.getMovieImage()%>" alt="<%=dto.getMovieNm()%> 포스터" />
							</a>
							<header>
								<h5>
									<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="film_title">
										<%=dto.getMovieNm()%>
									</a>
								</h5>
							</header>
						</article>
<%
	}
}
%>
	
					</div>
				</section>
			</div>
		</div>
		<!-- 회원 선호장르1 영화 추천 end -->

		<section id="banner" style="padding: 2em 0 5px 0;">
			<header class="top_margin">
				<div class="mid_title" align="left">
					Movie Holic 추천 영화
				</div>
			</header>
			
		</section>

		<!-- ②-2. 회원 선호장르2 영화 추천 start -->
		<div class="tab-content">
			<div class="tab-pane active">
				<section class="carousel" id="category">
					<div class="reel" id="romance">

<%
if(variousfilm2 != null){
	for(FilmDto dto : variousfilm2){
%>					
						<article style="margin: ; height: 410px; background-color: rgb(3, 39, 49);">
							<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="image featured">
								<img style="height:320px;" src="<%=dto.getMovieImage()%>" alt="<%=dto.getMovieNm()%> 포스터" />
							</a>
							<header>
								<h5>
									<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="film_title">
										<%=dto.getMovieNm()%>
									</a>
								</h5>
							</header>
						</article>
<%
	}
}
%>
	
					</div>
				</section>
			</div>
		</div>
		<!-- 회원 선호장르2 영화 추천 end -->



<%
}
// ################## 로그인 ################## 
else {
%>

		<!---------------------------------------- ② 취향 저격 리스트 ---------------------------------------->
		<!-- #로그인 회원 선호 장르 = 액션 이라고 가정!# -->
		<section id="banner" style="padding: 2em 0 5px 0;">
			<header class="top_margin">
				<h2 class="big_title">
					<strong>취향 저격 리스트</strong>
				</h2>
				<br><br>
				<div class="mid_title" align="left">
					<span style="color:rgb(240, 195, 15)"><%=name%></span>님이 좋아하는 '<%=favoritefilm.get(0).getCategory()%>' 영화
				</div>
			</header>
			
		</section>

		<!-- ②-1. 회원 선호장르1 영화 추천 start -->
		<div class="tab-content">
			<div class="tab-pane active">
				<section class="carousel" id="category">
					<div class="reel" id="romance">

<%
if(favoritefilm != null) {
	for(FilmDto dto : favoritefilm){
%>					
						<article style="margin: ; height: 410px; background-color: rgb(3, 39, 49);">
							<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="image featured">
								<img style="height:320px;" src="<%=dto.getMovieImage()%>" alt="<%=dto.getMovieNm()%> 포스터" />
							</a>
							<header>
								<h5>
									<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="film_title">
										<%=dto.getMovieNm()%>
									</a>
								</h5>
							</header>
						</article>
<%
	}
}
%>
	
					</div>
				</section>
			</div>
		</div>
		<!-- 회원 선호장르1 영화 추천 end -->

		<section id="banner" style="padding: 2em 0 5px 0;">
			<header class="top_margin">
				<div class="mid_title" align="left">
					<span style="color:rgb(240, 195, 15)"><%=name%></span>님이 좋아하는 '<%=favoritefilm2.get(0).getCategory()%>' 영화
				</div>
			</header>
			
		</section>

		<!-- ②-2. 회원 선호장르2 영화 추천 start -->
		<div class="tab-content">
			<div class="tab-pane active">
				<section class="carousel" id="category">
					<div class="reel" id="romance">

<%
if(favoritefilm2!=null){
	for(FilmDto dto : favoritefilm2){
%>					
						<article style="margin: ; height: 410px; background-color: rgb(3, 39, 49);">
							<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="image featured">
								<img style="height:320px;" src="<%=dto.getMovieImage()%>" alt="<%=dto.getMovieNm()%> 포스터" />
							</a>
							<header>
								<h5>
									<a href="<%=root%>/film?act=viewfilmdetail&movieCdYoung=<%=dto.getMovieCdYoung()%>&movieCdNaver=<%=dto.getMovieCdNaver()%>"  class="film_title">
										<%=dto.getMovieNm()%>
									</a>
								</h5>
							</header>
						</article>
<%
	}
}
%>
	
					</div>
				</section>
			</div>
		</div>
		<!-- 회원 선호장르2 영화 추천 end -->

<%
}
%>	
 
 
<section id="banner">
<br><br><br><br><br><br><br><br><br><br><br><br>
</section>
		
		<%@ include file="/template/footer.jsp"%>
		
<%
	}
}else{%>

<img style="display: block; margin: 250px auto; " alt="로딩중" src="/MovieHolic/images/loding.gif">
	
<%
}
%>

  
