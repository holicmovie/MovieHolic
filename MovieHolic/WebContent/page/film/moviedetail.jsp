<%@page import="com.kitri.dto.film.PageBeanReview"%>
<%@page import="com.kitri.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.kitri.dto.FilmDetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
<style>
/* 별모양 */
.fas {
	font-style:normal;
	font-family: FontAwesome;
	font-size: 2.5em;
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
	margin-top: 50px;
}
<%-- 별모양 --%>
.fas {
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
<%-- 마우스 올린 행 배경색 변경 --%>
	.table-hover > tbody > tr:hover {
	  background-color: #3a3a3a;
	}
</style>
<%
// [영화 상세 정보]
FilmDetailDto filmInfo = (FilmDetailDto) request.getAttribute("filmInfo");
// 출연 배우 수
int actorLen = filmInfo.getActors().length;
// 배우 이름
String[] actorNames = filmInfo.getActors();
// 배우 이미지
String[] actorImages = filmInfo.getActorImages();
	
// 예고편 videoId
String videoId = filmInfo.getVideoId();
// [페이지에 맞는 리뷰 목록]
PageBeanReview pb = (PageBeanReview) request.getAttribute("reviews");
List<BoardDto> reviews = pb.getList();
// 리뷰 총 수
int reviewTotalLen = pb.getTotalCnt();
// 현재 페이지의 리뷰 수
int reviewLen = reviews.size();
int currentPage = pb.getCurrentPage();				 // 현재 페이지 index
int startPage = pb.getStartPage();					 // 시작 페이지 index
int endPage = pb.getEndPage();						 // 끝 페이지 index
int cntPerPage = pb.getCntPerPage();				 // 한 페이지 내에 보여줄 최대 행 개수
int totalPage = pb.getTotalPage();					 // 모든 페이지 개수
int cntPerPageGroup = pb.getCntPerPageGroup();		 // 페이지 그룹 개수
// [페이지 눌릴 시, 사용할 영화코드]
String movieCdYoung = (String) request.getAttribute("movieCdYoung");
String movieCdNaver = (String) request.getAttribute("movieCdNaver");
//###################################### 로그인 세션 ###################################### 임시
//TODO : session에서 id 받기로 변경하기! ok
String id = (String)session.getAttribute("loginInfo");
%>

<script>
<%-- 리뷰 페이지 선택한 경우 --%>
$(function(){
	$(document).on("click", ".test", function(){
		
			var currentPage=$(this).attr("data-page");
			var movieCdYoung = $(this).attr("movieCdYoung");
						
			$.ajax({
				url:'/MovieHolic/film?act=viewreviewlist&movieCdYoung=' + movieCdYoung + '&currentPage=' + currentPage,
				method:'get',
				success:function(result){
					$("#reviewlist").html(result);
				}
			});
		
		return false;
	});
});
$(function(){
	<%-- 리뷰 클릭 이벤트 --%>
	$(document).on("click", ".reviewitems", function(){
		var seq = $(this).attr("seq");
		
		location.href = '/MovieHolic/mypage?page=reviewdetail&seq='+seq;
		
	});
		return false;
});
 
$(function() {
		<%-- 위시리스트 추가 이벤트 --%>
		$("#wishlistAdd").click(function(){
		var movieCdYoung = $(this).attr("movieCdYoung");
		var movieCdNaver = $(this).attr("movieCdNaver");
		
		$.ajax({
			url: '/MovieHolic/film?act=addwishlist&movieCdYoung=' + movieCdYoung + '&movieCdNaver=' + movieCdNaver,
			method:'get',
			success: function(result){
				alert(result.trim());
			},
			error: function(error){
				alert(error);
			}
		});
		
		return false;
	});
});
$(function() {
	
	$("#writereview").click(function() {
		
		var movieCdYoung = $(this).attr("movieCdYoung");
		var movieCdNaver = $(this).attr("movieCdNaver");
		var director = $(this).attr("director");
		var actor1 = $(this).attr("actor1");
		var actor2 = $(this).attr("actor2");
		var movieName = $(this).attr("movieName");
		var category = $(this).attr("category");
				
		location.href = '/MovieHolic/mypage?page=writereview&movieCdYoung='+ movieCdYoung + '&movieCdNaver='+ movieCdNaver
				+ '&director=' + director + '&actor1=' + actor1 + '&actor2=' + actor2
				+ '&movieName=' + movieName + '&category=' + category;
		
		return false;
	});
});
<%-- 예고편 클릭 이벤트 --%>
$(document).ready(function() {
	$('#trailer').focusin(function() {
		$('#trailerModal').modal();
	});
});
/**
 * Youtube API 로드
 */
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
/**
 * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
 * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
 * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
 */
var player;
function onYouTubeIframeAPIReady() {
    player = new YT.Player('movieTrailerIFrame', {
        events: {
            'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
            'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
        }
    });
}
function onPlayerReady(event) {
    console.log('onPlayerReady 실행');
    // 플레이어 자동실행 (주의: 모바일에서는 자동실행되지 않음)
    event.target.playVideo();
}
var playerState;
function onPlayerStateChange(event) {
    playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
            event.data == YT.PlayerState.PLAYING ? '재생 중' :
            event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
            event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
            event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
            event.data == -1 ? '시작되지 않음' : '예외';
    console.log('onPlayerStateChange 실행: ' + playerState);
}
</script>
</head>

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
						
						<!----------------------------------------- 영화 제목 ----------------------------------------->
							<header>
								<h2 class="font_bold_lg" style="font-size:40px;">
									<%=filmInfo.getMovieNm()%>
								</h2>
								<p class="font_light_small" style="margin: 0 0 0 0;"><%=filmInfo.getMovieNmEn()%>, <%=(filmInfo.getOpenYear() == null) ? "미개봉" : filmInfo.getOpenYear()%></p>
							</header>
						<!----------------------------------------- 영화 제목 ----------------------------------------->
						
						<!-- 구분선 -->
						<hr class="line_bold">
						
						<!----------------------------------------- 영화 이미지 ----------------------------------------->
							<div class="col-12-moblie top_margin_lg" style="margin-bottom: 20px;">
								<div
									style="float: left; margin-right: 20px; padding: 0 2em 0 2em;">
									<a class="image featured" style="margin: 0; width: 18em;">
										<img src="<%=filmInfo.getMovieImage()%>" alt="<%=filmInfo.getMovieNm()%> 포스터" />
									</a>
									<br>
								</div>
						<!----------------------------------------- 영화 이미지 ----------------------------------------->
								
								<div class="col-12-moblie"
									style="float: left; border-left: 1px solid; padding: 0 2em 0 2em; width: 65%">
						
						
						<!------------------------------------------ 영화 정보 ------------------------------------------->
									<h3>
										<Strong class="font_bold_mid">영화정보</Strong>
									</h3>
									
									<div id="likeunlike" class="rounded-lg"
										style="background-color: rgb(0, 0, 0); margin: 20px 0 20px 0; height: 100px; padding-top: 8px;">
										<div style="color: rgb(240, 195, 15);"
											class="font_light_small">MovieHolic 평점 : <%=filmInfo.getStarPoint()%> 점</div>
										<div style="font-size: 1.3em; align-items:">
											<span style="font-size: 1em;">
<%
for(int i =1;i<=filmInfo.getStarPoint();i++){
%>
												<i class="fas fa-star" style="color: #ffca08;"></i>
<%
} 
for(int i = 1;i<=5-filmInfo.getStarPoint();i++){ 
%>
												<i class="fas fa-star" style="color: #222222;"></i>
<%
}
%>
											</span>
										</div>
									</div>
									
									<div class="col-lg-12 col-12-mobile font_light_small">
										<p>
											개요 : <%=filmInfo.getCategory()%> | <%=filmInfo.getNations()%> | <%=filmInfo.getShowTm()%>분 | <%=(filmInfo.getOpenYear() == null) ? "미개봉" : filmInfo.getOpenYear() + " 개봉"%> <br>
										<p>
											감독 : <%=(filmInfo.getDirectors() == null) ? "비공개" : filmInfo.getDirectors()%><br>
										<p>
											등급 : <%=(filmInfo.getWatchGradeNm() == null) ? "미정" : filmInfo.getWatchGradeNm()%><br>
										<p>제작 : <%=(filmInfo.getCompanyNm() == null) ? "없음" : filmInfo.getCompanyNm()%>
									</div>

				<!------------------------------------------------- 영화 정보 ------------------------------------------------->
				
										<br>
				<!------------------------------------ 예고편, 리뷰쓰기 버튼 ----------------------------------------->
									<ul style="list-style-type: none;">
										
										<li style="padding-left: 0px;">
											<button id ="trailer" class="btn btn-success font_bold_small" style="margin-right: 10px; width:200px;">
											예고편 영상
											</button>
<%
if(id != null) {
%>
											<button id="writereview" class="btn btn-success font_bold_small" style="margin-right: 10px; width:200px;"
											movieCdYoung="<%=filmInfo.getMovieCdYoung()%>" movieCdNaver= "<%=filmInfo.getMovieCdNaver()%>" 
											director="<%=filmInfo.getDirectors()%>" actor1= "<%=filmInfo.getActor1()%>" actor2="<%=filmInfo.getActor2()%>"
											movieName="<%=filmInfo.getMovieNm()%>" category="<%=filmInfo.getCategory()%>">
											리뷰 쓰기
											</button>
											<button id="wishlistAdd" class="btn btn-success font_bold_small"
											movieCdYoung="<%=filmInfo.getMovieCdYoung()%>" movieCdNaver="<%=filmInfo.getMovieCdNaver()%>" style="color: #ffcd07; margin-right: 10px; width:200px;">
											위시리스트 추가
											</button>
<%
}
%>
										</li>
									</ul>
				<!------------------------------------ 예고편, 리뷰쓰기 버튼 ----------------------------------------->
						

								</div>
								<div style="clear: both;"></div>
							</div>
							<div>
							
							<br><br>
							
							<!-- 구분선 -->
							<hr class="line_light_g">
							
							<br>

				<!--------------------------------------- 출연 배우 / 감독 ---------------------------------------------->
								<header>
									<h3 class="font_bold_mid">출연 배우</h3>
								</header>
								<br>
								<div class="row gtr-50">
<%
for(int i = 0; i < actorLen; i++){
%>
									<div class="col-2">
										<a class="image fit">
											<img style="width: 70%" src="<%=actorImages[i]%>" alt="<%=actorNames[i]%> 사진" title="<%=actorNames[i]%>" />
										</a>
									</div>
									<div class="col-4">
										<span class="font_light_mid" style="font-size:20px;"><%=actorNames[i]%></span>
									</div>
<%
}
%>
								</div>
							</div>
							
							<br><br>
											
							<!-- 구분선 -->
							<hr class="line_light_g">
							
							<br>
							
							<div>
								<header>
									<h3 class="font_bold_mid">감독</h3>
								</header>
								<br>
								<div class="row gtr-50">
								
									<div class="col-2">
										<a class="image fit">
										<img style="width: 70%" src="<%=filmInfo.getDirectorImage()%>" alt="<%=filmInfo.getDirectors()%> 사진" title="<%=filmInfo.getDirectors()%>" /></a>
									</div>
									<div class="col-4">
										<span class="font_light_mid" style="font-size:20px;"><%=(filmInfo.getDirectors() == null) ? "비공개" : filmInfo.getDirectors()%></span>
									</div>
									
								</div>
							</div>
							
				<!--------------------------------------- 출연 배우 / 감독 ---------------------------------------------->							
							
						</article>
					</div>
				</div>
				

				<br><br>

			    <!------------------------------------------------- 리 뷰 ------------------------------------------------->

				<div id = "reviewlist">
				<div class="row">
				<div class="col-lg-12 col-mobile-12 font_bold_lg top_margin_lg" style="margin-bottom: 1em;">
					<span>REVIEWS</span> (<span id="commentcount"><%=reviewTotalLen%></span>)
					<!-- 구분선 -->
					<hr class="line_bold">
				</div>
				</div>
					
				<div class="row">
					
					<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0; width:200px;">
<%
if(reviewLen>0){
	for(int i = 0; i < reviewLen; i ++){
		
		/* --------------------------------------------------------------------------------------------------- */
%>
						<tr>
							<td class="reviewitems" style="vertical-align: middle; border-top:0px; border-bottom:1px solid white;" seq="<%=reviews.get(i).getSeq()%>" >
								<a href="/MovieHolic/mypage?page=viewuserinfo&userid=<%=reviews.get(i).getUserId()%>">
									<img id="replywriter" class="profile_icon" alt="댓글작성자 프로필 사진" src="/MovieHolic/images/user2.jpg"></a> 
								<a href="/MovieHolic/mypage?page=viewuserinfo&userid=<%=reviews.get(i).getUserId()%>" id="replywriterId" class="font_bold_small" style="color: white; margin-right: 15px;"><%=reviews.get(i).getUserId()%></a>
								<span style="font-size: 1em;margin-right: 15px;">
<%
		for(int j =1;j<=reviews.get(i).getStarPoint(); j++){
%>
												<i class="fas fa-star" style="color: #ffca08;"></i>
<%
		} 
		for(int j = 1; j<=5-reviews.get(i).getStarPoint(); j++){ 
%>
												<i class="fas fa-star" style="color: #222222;"></i>
<%
		}
%>
							</span>
							 
							<span><%=reviews.get(i).getPostDate()%></span>
							<br> 
							
							<span style="display: block; width:1200px;">
							<%=reviews.get(i).getContent()%>
							</span>
							
							</td>
						</tr>
						
<%
	}
}
%>
						
						</table>

					<%--pagination처리 --%>
					<div class="col-lg-12">
					
<%
// 시작 페이지가 1이 아닌 경우만 '이전' 표시
if(startPage != 1) {
%>
						<div style="float: left">
							<button class="btn btn-success font_bold_small test" movieCdYoung="<%=movieCdYoung%>" movieCdNaver = "<%=movieCdNaver%>" data-page="<%=startPage-1%>">이&nbsp;&nbsp;&nbsp;전</button>
						</div>
<%		
}
if(endPage != totalPage){
%>
						<div style="float: right">
							<button class="btn btn-success font_bold_small test" movieCdYoung="<%=movieCdYoung%>" movieCdNaver = "<%=movieCdNaver%>" data-page="<%=endPage+1%>">다&nbsp;&nbsp;&nbsp;음</button>
						</div>
<%		
}
%>

						<ul class="pagination justify-content-center">
<%
 // 페이지 그룹 개수(5)만큼 반복
for(int i = 0; i < cntPerPageGroup; i++) {
    // 마지막 페이지에서, 
    if(startPage+i <= totalPage){
%>
							<li class="page-item">
								<a class="page-link a test" href="#" movieCdYoung="<%=movieCdYoung%>" movieCdNaver = "<%=movieCdNaver%>" data-page="<%=startPage+i%>"><%=startPage+i%></a>
							</li>
<%
    }
}
%>
						</ul>
						<%-- float clear용 빈 div --%>
						<div style="clear: both;"></div>
					</div>
				</div>
				
				 </div>
				<!------------------------------------------------- 리 뷰 ------------------------------------------------->
				

			</div>

		</div>
		
		<!-------------------------------------------- 예고편 모달 ------------------------------------------------->
		
<div id="trailerModal" class="modal fade" role="dialog">
<h5 class="modal-title" id="myModalLabel">예고편</h5>
    <div class="modal-dialog modal-lg">
        <div class="modal-content modal-lg">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span style="color:black;" aria-hidden="true">×</span>
                </button>
            </div>    
            <div class="modal-body text-center">
<%
if(videoId != null){
%>
            	<iframe id="movieTrailerIFrame" width="100%" height="500px" src="https://www.youtube.com/embed/<%=videoId%>?rel=0&enablejsapi=1" frameborder="0" allowfullscreen></iframe>
<%
} else {
%>
	<div class="font_bold_mid" style="color:black; width : 100%; height:500px;">예고편 영상이 존재하지 않습니다.</div>
<%	
}
%>
            </div>
        </div>
    </div>
</div>
	<!-------------------------------------------- 예고편 모달 ------------------------------------------------->

		<%@ include file="/template/footer.jsp"%>