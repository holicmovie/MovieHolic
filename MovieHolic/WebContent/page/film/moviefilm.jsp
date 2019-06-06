<%@page import="java.util.List, com.kitri.dto.FilmDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<%@ include file="/template/nav.jsp"%>

<script>
<%-- 영화 검색어 입력후 엔터키 누른 경우 --%>
$(function(){
	var searchFilm = $('#searchFilm');
	$(searchFilm).keypress(function(event){
	    if (event.which == 13 ) {
			if(searchFilm.val() != "") {	<%-- 검색어가 공백이 아닌 경우 srchKey로 받아옴 --%>
				var srchKey = searchFilm.val();
				location.href = "/MovieHolic/film?act=searchFilm&srchKey=" + srchKey;
			}
	    }
	});
	return false;
});
</script>

<%
// 장르별 영화 목록 결과
List<FilmDto> favoritefilm = (List<FilmDto>)request.getAttribute("filmlist");

int films = favoritefilm.size(); 	// 영화 총 개수
int lines = films / 5; 				// 목록 줄 개수

%>

</head>
<body class="left-sidebar is-preload" style="background-color: black;">
	<div id="page-wrapper">
		<!-- ALL Movie -->

		<!-- Banner -->
		<div id="header" style="background-image: none; padding: 4em 0 0 0;">
			<section id="banner"
				style="padding: 0; margin: 0 auto; background-color: black;">
				<hr style="top: 0; border-top: 1px solid rgba(255, 255, 255);">
				<header>
					<h2>
						<strong style="color: white;">주간 인기 영화</strong>
					</h2>
				</header>
				<hr style="top: 0; border-top: 1px solid rgba(255, 255, 255);">

			</section>
		</div>
		
		<section class="carousel" style="background-color: rgb(3, 39, 49); padding: 1.5em 0 0 0;">
			<div class="reel">
			
				<article style="background-color: rgb(3, 39, 49); color: white;">
					<a href="/MovieHolic/page/film/moviedetail.jsp"
						class="image featured">
						<img src="/MovieHolic/images/avengers4.jpg" alt="" />
					</a>
					<header>
						<h5>
							<a href="/MovieHolic/page/film/moviedetail.jsp"
								style="color: white;">어벤져스 : 엔드게임</a>
						</h5>
					</header>
				</article>

			</div>
		</section>
		
		<hr style="top: 1em; border-top: 5px solid rgba(255, 255, 255);">
		<div>
		
		<!---------------------------------------------- 검색 ----------------------------------------------------->
		
			<div class="col-lg-9 col-2-mobile"
				style="float: right; margin-right: 2em; border-left: 5px solid; border-color: white;">

				<div class="row">
					<div class="col-lg-8"></div>
					<div class="col-lg-4 col-2-mobile"
						style="margin-top: 1em; padding-left:90px;">
						<input type="text" id="searchFilm" class="form-control"
							style="height: 40px; width: 13em; background-image: /MovieHolic/images/searchb.png"
							placeholder="제목으로 검색">
					</div>
				</div>
		<!---------------------------------------------- 검색 ----------------------------------------------------->
				
		
		<!--------------------------------------------- 영화 목록 ----------------------------------------------------->
		
				<!-- 목록 한 줄 start-->
				<div class="row" style="margin-top: 0px; margin-left: 0px; margin-right: 0px;">
				
	<%
	for(int i = 0; i < films; i++) {
	%>
					<!-- 총 영화 5개 -->
					<!-- 영화 한 개 start -->
					<div class="col-lg-2 col-4-mobile"
						style="float: left; margin: 0.5em 0.5em 0.5em 0.5em; padding: 2px; border: 2px solid; border-color: white;">
						
						<a href="<%=root%>/page/film?act=viewfilmdetail&<%=favoritefilm.get(i).getMovieCdYoung()%>" class="image featured" style="margin: 0;">
							<img src="<%=favoritefilm.get(i).getMovieImage()%>" alt="<%=favoritefilm.get(i).getMovieNm()%> 포스터 이미지">
						</a>
						
						<header style="text-align: center; background-color: white; margin: 0;">
							<h6 style="background-color: black;">
								<a href="<%=root%>/page/film?act=viewfilmdetail&<%=favoritefilm.get(i).getMovieCdYoung()%>"><%=favoritefilm.get(i).getMovieNm()%></a>
							</h6>
						</header>
						
					</div>
					<!-- 영화 한 개 end -->
	<%
	}
	%>
				</div>
				<!-- 목록 한 줄 end -->

			
	<!--------------------------------------------- 영화 목록 ----------------------------------------------------->
				
				
				
				
	<!-------------------------------------------- 페이징 처리----------------------------------------------------->
	
				<%-- float clear용 빈 div --%>
				<div style="clear: both;"></div>
				
				<div class="col-lg-12" style="padding: 0 0 0 0;">
				<div style="float: left; padding-left: 1em;">
					<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
				</div>
				
				<div style="float: right; padding-right: 11em;">
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
				</div>
			</div>

	<!-------------------------------------------- 페이징 처리----------------------------------------------------->


	<!--------------------------------------------- 장르 분류----------------------------------------------------->

			<div class="col-lg-2 col-1-mobile" style="width: 20%; float: right; text-align: left; margin: 1em 0 0 10px;">
				<ul style="list-style-type: none;">
					<li><h3>
							<strong>장르 분류</strong>
						</h3>
					</li>
					
					<li><a href="<%=root%>/page/film?act=viewfilmlist" style="color: white;">전체</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=드라마" style="color: white;">드라마</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=판타지" style="color: white;">판타지</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=공포" style="color: white;">공포</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=로맨스" style="color: white;">로맨스</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=모험" style="color: white;">모험</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=스릴러" style="color: white;">스릴러</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=느와르" style="color: white;">느와르</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=다큐멘터리" style="color: white;">다큐멘터리</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=코미디" style="color: white;">코미디</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=가족" style="color: white;">가족</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=미스터리" style="color: white;">미스터리</a></li>
					<li><a href="<%=root%>/page/film?act=viewfilmlist&category=전쟁" style="color: white;">전쟁</a></li>
				</ul>
			</div>
			
		<!--------------------------------------------- 장르 분류----------------------------------------------------->
	
	
	
		</div>
			
	</div> <!-- page-wrapper end -->



	<%@ include file="/template/footer.jsp"%>