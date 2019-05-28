<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>

<style>
/* 좋아요 둥근 버튼을 위해 필요 */
.btn-circle.btn-xl {
	width: 70px;
	height: 70px;
	padding: 10px 16px;
	border-radius: 35px;
	font-size: 24px;
	line-height: 1.33;
}

.btn-circle {
	width: 40px;
	height: 40px;
	padding: 6px 0px;
	border-radius: 22px;
	text-align: center;
	font-size: 12px;
	line-height: 1.42857;
}

/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
    position: static;
    top:1em;
}

/* 구분선 얇은 것 (흰색) */
hr.line_light_w {
	background-color: white;
	position: static;
	top:1em;
}

/* 구분선 얇은 것 (회색) */
hr.line_light_g {
	background-color: gray;
	position: static;
	top:1em;
}

/* 위의 공간 띄울 때 */
.top_margin {
	margin-top: 20px;
}

.top_margin_lg {
	margin-top: 40px;
}

/* 영화 포스터 */
.movieImg {
	border: solid 1px white;
	height: 350px;
}

/* 별모양 */
.fas {
	font-style:normal;
	font-family: FontAwesome;
	font-size: 2.5em;
}

/* 신고버튼 */
.report {
	color: white;
	text-decoration: underline;
}
</style>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>

</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header"  style="background-image: none; margin-bottom: 0px; padding-bottom:0; height: 10px;">
			<%@ include file="/template/nav.jsp"%>
		</div>

		<!-- Main 시작 -->

		<div class="wrapper style1" style="color: white;">

			<div class="container">

					<%-- 페이지 이동경로 --%>		
					<div class="row" style="margin-bottom:30px;">
						<div class="col-lg-12 col-12-mobile font_light_small">
							<span>✱&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/mypage.jsp" style="color:white;">My Page</a>
							<span>&nbsp;&nbsp;❱❱&nbsp;&nbsp;</span>
							<a href="/MovieHolic/page/mypage/diary.jsp" class="font_bold_small" ">Diary</a>
						</div>
					</div>

				<div class="row">
					<div class="col-lg-12 col-12-mobile">
						<div style="float: left">
							<button class="btn btn-success font_bold_small">이&nbsp;&nbsp;&nbsp;전</button>
						</div>
						<div style="float: right">
							<button class="btn btn-success font_bold_small">삭&nbsp;&nbsp;&nbsp;제</button>
						</div>
						<div style="float: right; width: 20px; height: 1px;"></div>
						<div style="float: right">
							<button class="btn btn-success font_bold_small">수&nbsp;&nbsp;&nbsp;정</button>
						</div>
						<!-- float clear용 빈 div -->
						<div style="clear: both;"></div>
					</div>
				</div>

				<div class="row">

					<!-- 왼쪽 내용 start -->
					<div class="col-lg-3 col-12-mobile top_margin" align="center">

						<!-- 포스터, 좋아요싫어요 -->
						<section class="movieImg-wrap">
							<a href="#"><img class="movieImg" alt="어벤져스:엔드게임 포스터"
								src="/MovieHolic/images/avengers4.jpg" border="solid 1px white"></a>
						</section>

						<section id="likeunlike"
							class="rounded-lg top_margin font_light_small"
							style="width: 244px; height: 100px; background-color: #555; padding: 15px 40px;">
							<ul style="list-style: none; padding: 0px;">
								<li
									style="float: left; position: relative; text-align: center; margin-right: 50px;">
									<a href="#"><img alt="좋아요 아이콘"
										src="/MovieHolic/images/like.png"></a> <span
									style="display: block;">1000</span>
								</li>
								<li style="float: left; text-align: center;"><a href="#"><img
										alt="싫어요 아이콘" src="/MovieHolic/images/unlike.png"></a> <span
									style="display: block;">1000</span></li>
							<!-- float clear용 빈 li -->
							<li style="clear: both;"></li>
							</ul>
						</section>

					</div>
					<!-- 왼쪽 내용 end -->

					<!-- 오른쪽 내용 start -->
					<div class="col-lg-9 col-12-mobile top_margin">

						<!-- 영화명, 개봉연도, 조회수, 작성일 -->
						<div class="title">
							<div class="movietitle" style="float: left;">
								<span class="font_bold_lg">어벤져스:엔드게임</span> <span
									class="font_light_mid">&nbsp;2019</span> &nbsp;&nbsp;<img
									alt="잠금 여부 표시 아이콘" src="/MovieHolic/images/lock.png"
									style="margin-bottom: 12px;">
							</div>
							<div class="writeinfo" style="float: right;">
								<span class="font_light_small">
									<span class="font_bold_lg">&nbsp;</span>
									조회수 : <span id="viewcount">22</span>
									&nbsp;&nbsp;|&nbsp;&nbsp;
									<span id="writedate">2019.05.25 &nbsp;오후 05:45</span>
								</span>
							</div>
							
							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
						</div>


						<!-- 별점, 작성자 -->
						<div style="float: left">
							<span style="font-size: 1em;">
								<i class="fas fa-star" style="color: #ffca08;"></i>
								<i class="fas fa-star" style="color: #ffca08;"></i>
								<i class="fas fa-star" style="color: #ffca08;"></i>
								<i class="fas fa-star" style="color: #ffca08;"></i>
								<i class="fas fa-star" style="color: #222222;"></i>
							</span>
						</div>

						<!-- 작성자 프사, 아이디 -->
						<div class="" style="float: right">
							<a href="#">
								<img class="profile_icon" alt="작성자 프로필 사진" src="/MovieHolic/images/user.jpg">
							</a>
							&nbsp;
							<span class="font_light_small">by&nbsp;
							<a id="writerId" class="font_bold_small" href="#" style="color: white">shzy232</a></span>
						</div>

						<!-- float clear용 빈 div -->
						<div style="clear: both;"></div>

						<!-- 구분선 -->
						<hr class="line_bold">

						<!-- 작성 내용 -->
						<div class="font_light_small top_margin">
							<p>
								2008년 아이언맨으로 시작한 MCU(Marvel Cinematic Universe)의 10년이 끝을 맺었다.
								다양한 히어로들의 스토리가 연결되면서 거대한 서사를 이루었다. 단순한 히어로영화가 마스터피스가 되는 순간이었다.
								모든 마블영화들의 스토리가 집약되며 결말을 이루었지만, 위화감 대신에 웅장한 느낌을 받는다. 그 중심에는 아이언맨
								토니 스타크가 있다. 지극히 일반적이나 돌아보면 입체적이다. <br>
								<br> 3시간의 러닝타임이 지루할 법 하지만 순간순간 유머로 그것을 환기 시킨다. 토르! 그는 진지하다.
								마지막 어벤져스 어셈블! 극의 정점을 찍는다. 이별을 맞지만, 지금까지와는 다른 양상을 보이면서 교차된다.
								아이언맨은 희생을, 스티브는 자신의 인생을 선택한다. 지금까지 대립구도의 역설을 보여주며 마치 양자시간여행의
								뫼비우스 띠 같은 느낌을 받는다. 어찌 보면 토니는 가족을 이루었고, 스티브는 지금까지의 희생 뒤에 결말을 짓고
								자신의 가족을 만든 것이 순리대로 풀린 느낌을 받는다. 어색하지 않고 담담하다. <br>
								<br> 지금까지의 작품의 방점을 찍는 듯이 화려하다. 하지만 첫 시작으로는 어렵다. 새로운 시작으로 가기
								위한 어색함이 담겨있다. 너무 많은 히어로들 속에 잊혀지거나 과하거나. 그렇지만 역시 마스터피스! MCU의 10년에
								박수를 보낸다.
							</p>
						</div>

						<!--신고하기 -->
						<div class="top_margin_lg">
							<div class="font_light_small" style="float: right">
								<a class="report" href="#">신고하기</a>
							</div>
							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
						</div>


						<!-- 구분선 -->
						<hr class="line_bold">

						<!-- 댓글 start -->
						<div class="font_bold_small top_margin_lg">
							<span>COMMENTS</span>(<span id="commentcount">2</span>)
						</div>

						<!-- 구분선 -->
						<hr class="line_light_w">

						<!-- 댓글 한 개 -->
						<div class="font_light_small">
							<div style="float: left">
								<a href="#"><img id="replywriter" class="profile_icon"
									alt="댓글작성자 프로필 사진" src="/MovieHolic/images/user2.jpg"></a>
								&nbsp;&nbsp;
							</div>
							<div style="float: left">
								<a id="replywriterId" class="font_bold_small" href="#"
									style="color: white">abc123</a><br> <span>3시간 전</span>
							</div>
							<div style="float: left; margin-left: 20px;">
								<p id="replycontent">리뷰에서 오랜 팬심이 느껴져서 공감가네요. ㅎㅎ 좋아요 누르고 갑니다!
								</p>
							</div>
							<div style="float: right">
								<button type="button" id="replydelete" class="close"
									style="color: white">&times;</button>
							</div>

							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
							<!-- 구분선 -->
							<hr class="line_light_g">

						</div>

						<!-- 댓글 한 개 -->
						<div class="font_light_small">
							<div style="float: left">
								<a href="#"><img id="replywriter" class="profile_icon"
									alt="댓글작성자 프로필 사진" src="/MovieHolic/images/user2.jpg"></a>
								&nbsp;&nbsp;
							</div>
							<div style="float: left">
								<a id="replywriterId" class="font_bold_small" href="#"
									style="color: white">abc123</a><br> <span>3시간 전</span>
							</div>
							<div style="float: left; margin-left: 20px;">
								<p id="replycontent">리뷰에서 오랜 팬심이 느껴져서 공감가네요. ㅎㅎ 좋아요 누르고 갑니다!
								</p>
							</div>
							<div style="float: right">
								<button type="button" id="replydelete" class="close"
									style="color: white">&times;</button>
							</div>

							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
							<!-- 구분선 -->
							<hr class="line_light_g">

						</div>

						<!-- 댓글 입력칸 -->
						<div class="font_light_small top_margin_lg">
							<textarea class="form-control" rows="4" id="mycomment"
								placeholder="댓글을 입력해주세요." style="resize: none;"></textarea>
							<button class="btn btn-success font_bold_small top_margin"
								style="float: right">등&nbsp;&nbsp;&nbsp;록</button>
							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
						</div>

						<!-- 댓글 end -->

					</div>
					<!-- 오른쪽 내용 end -->

				</div>

			</div>

		</div>
		<!-- Main 끝 -->

		<%@ include file="/template/footer.jsp"%>