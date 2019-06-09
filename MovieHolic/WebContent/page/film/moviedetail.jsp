<%@page import="com.kitri.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.kitri.dto.FilmDetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
</head>
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

// [리뷰]
List<BoardDto> reviews = (List<BoardDto>) request.getAttribute("reviews");
// 리뷰 수
int reviewLen = reviews.size();
%>

<script type="text/javascript">
<%-- 위시리스트 추가 이벤트 --%>
$(function() {
	$("#wishlistAdd").click(function() {
		alert("위시리스트에 추가되었습니다");
		return false;
	});
});

<%-- 리뷰쓰기 이벤트 --%>
$(function() {
	$("#writereview").click(function() {
		alert("리뷰쓰기로 이동합니다.");
		
		$.ajax({
			url: '/MovieHolic/mypage?page=writereview',  <%-- 뭘 넘겨줘야 할지 상의 필요! 영화코드만? 아님 영화상세정보 다? --%>
			method:'get', 
			success:function(result){
				
			}
		});
		
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
											<a id ="trailer" href="https://www.youtube.com" class="btn btn-success font_bold_small"" style="margin-right: 10px; width:200px;">
											예고편 영상
											</a>
											<a id="writereview" href="/MovieHolic/page/mypage/writereview.jsp" class="btn btn-success font_bold_small"" style="margin-right: 10px; width:200px;">
											리뷰 쓰기</a>
											<a id="wishlistAdd" class="btn btn-success font_bold_small" style="color: #ffcd07; margin-right: 10px; width:200px;">
											위시리스트 추가</a>
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

				<div class="font_bold_lg top_margin_lg" style="margin-bottom: 3em;">
					<span>REVIEWS</span> (<span id="commentcount"><%=reviewLen%></span>)
					<!-- 구분선 -->
					<hr class="line_bold">
				</div>
				

				<div class="row">
					<table class="table table-hover col-lg-12 col-mobile-12" style="margin-top: 0;">

<%
if(reviewLen>0){

	for(int i = 0; i < reviewLen; i ++){
%>
						<tr>
							<td style="vertical-align: middle;">
							<a href="#"><img id="replywriter" class="profile_icon" alt="댓글작성자 프로필 사진" src="/MovieHolic/images/user2.jpg"></a> 
								 <a id="replywriterId" class="font_bold_small" href="#" style="color: white; margin-right: 15px;"><%=reviews.get(i).getUserId()%></a>
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