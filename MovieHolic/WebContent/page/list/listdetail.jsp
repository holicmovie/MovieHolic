<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp" %>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp" %>

<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<style>
p, span, a{
	color: white;
}
div{
padding: 0;
}
<!-- 좋아요 둥근 버튼을 위해 필요 -->
.btn-circle.btn-xl {
    width: 50px;
    height: 50px;
    padding: 10px 10px;
    border-radius: 35px;
    font-size: 25px;
    line-height: 1.33;
}
.btn-circle {
    width: 50px;
    height: 50px;
    padding: 10px 10px;
    border-radius: 35px;
    text-align: center;
    font-size: 25px;
    line-height: 1.42857;
}
.comment{
	border-right-color: lightgray;
	border-right-style: solid;
}

/* 구분선 굵은 것 */
hr.line_bold {
	background-color: white;
	height: 2px;
    position: static;
}

/* 구분선 얇은 것 (흰색) */
hr.line_light_w {
	background-color: white;
	position: static;
}

/* 구분선 얇은 것 (회색) */
hr.line_light_g {
	background-color: gray;
	position: static;
}

</style>
</head>
<body class="left-sidebar is-preload" style="margin: 0; padding: 0;">

<!-- Header -->
	<div id="header"  style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>

<!-- Main -->
<div class="wrapper style1" style = "margin: 0;padding: 0;">
	<div class = "row">
	<!-- 글 제목 밑 상태 바 -->
	<div class = "col-lg-2"></div>
	<div class = "col-lg-8" id = "listdetail-title">
		<div class = "col-lg-12"><h2 style = "bold">우울할 때 보는 영화 10선</h2></div>
		<div align ="right" style="width: 100%; border-top: thin solid white; border-bottom:thin solid white;">
		<h3>2019.05.21</h3>
		</div>
	</div>
	<div class = "col-lg-2"></div>
	</div>
	
	<div class = "row">
	<!-- 리스트 상세 내용  포스터 + 글 내용 -->
	<div class = "col-lg-2"></div>	
	<div class = "col-lg-8">
	<div style="float:right;"><a href = "">신고하기</a></div>
	<div style="clear:both;">
	<p><font>지극히 주관적으로 선정한 우울할 때 보면 좋은 영화 10선 입니다. 
	주인공들의 대사가 개인적으로 너무 마음에 들었구요,
	감독들이 의도를 가지고 표현한 각 장면이 너무 감명 깊었습니다.</font></p>
	<img src = "/MovieHolic/images/avengers.png" width = "200px">
	<img src = "/MovieHolic/images/benisback.jpg" width = "200px">
	<img src = "/MovieHolic/images/girlcops.jpg" width = "200px">
	<img src = "/MovieHolic/images/myspecialbrother.jpg" width = "200px">
	<br>
	 <font style = "color : gray">#한시반감성#울고싶을때보는영화#감동</font>
	</div>
	</div>	
	<div class = "col-lg-2"></div>	
	</div>

	<div class = "row">
	<!--가운데에 좋아요 누르는 기능 -->
	<div class = "col-lg-5"></div>
	<div class = "col-lg-2">
		<section id="likeunlike">
			<ul style="list-style: none; padding: 0px;">
				<li style="float: left; position: relative; text-align: center; margin-right: 50px;">
					<a href="#"><img alt="좋아요 아이콘" src="/MovieHolic/images/like.png"></a> <span style="display: block;">1000</span>
				</li>
				<li style="float: left; text-align: center;"><a href="#"><img alt="싫어요 아이콘" src="/MovieHolic/images/unlike.png"></a>
				<span style="display: block;">1000</span></li>
			<!-- float clear용 빈 li -->
			<li style="clear: both;"></li>
			</ul>
		</section>
	
	
	</div>
	<div class = "col-lg-5"></div>		
	</div>	
	<br><br>
	
	
	<div class = "row">
	<!-- 댓글 보기 -->
	<div class = "col-lg-2"></div>	
	<div class = "col-lg-8">
	<!-- 구분선 -->
	<div class="top_margin_lg">
							<div class="font_light_small" style="float: right">
								<a class="report" href="#">신고하기</a>
							</div>
							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
						</div>
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
								style="float: right">등 록</button>
							<!-- float clear용 빈 div -->
							<div style="clear: both;"></div>
							<br><br><br><br>
						</div>

						<!-- 댓글 end -->

					</div>
					<!-- 오른쪽 내용 end -->
	<div class = "col-lg-2"></div>	
	
	<%--댓글 작성 row--%>	

	</div>
</div>

<%@ include file="/template/footer.jsp" %>